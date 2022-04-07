codeunit 50403 "BCCountry/Region Upgrade"
{
    trigger OnRun()
    begin
        PerformUpgrade();
    end;

    /*trigger OnUpgradePerCompany()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(ReasonLbl) then exit;

        PerformUpgrade();

        UpgradeTag.SetUpgradeTag(ReasonLbl);
    end;*/

    local procedure PerformUpgrade()
    var
        CountryRegionSetup: Record "BCCountry/Region Setup";
        CountryRegionInstall: Codeunit "BCCountry/Region-Install";
    begin
        if not CountryRegionSetup.FindFirst() then
            CountryRegionInstall.HandleFreshInstall()
        else begin
            case CountryRegionSetup."Country/Region Code" of
                'NO':
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::NO;
                'RS':
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::RS;
                'CR':
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::CR;
                else
                    CountryRegionSetup."Country/Region Enum" := CountryRegionSetup."Country/Region Enum"::NO;

            end;
            CountryRegionSetup.Modify();
        end;
    end;


    //[EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(ReasonLbl);
    end;


    var
        ReasonLbl: Label 'BeTerna-SetupEnum-20220406', Locked = true;
}