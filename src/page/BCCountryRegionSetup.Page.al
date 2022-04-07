page 50400 "BCCountry/Region Setup"
{
    Caption = 'Country/Region Setup';
    PageType = Card;
    SourceTable = "BCCountry/Region Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;
    //sad edit na remote

    layout
    {
        area(content)
        {
            group(General)
            {
                field(CountryRegion; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Select Country/Region for your Localization';
                    Visible = false;
                }

                field(Name; Rec."Country/Region Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country/region Name field.';
                    Visible = false;
                }
                field(CountryRegionEnum; Rec."Country/Region Enum")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Country/Region Enum field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Setup)
            {
                action(UpgradeScript)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        CountryRegionUpgrade: Codeunit "BCCountry/Region Upgrade";
                    begin
                        CountryRegionUpgrade.Run();
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.FindFirst() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
