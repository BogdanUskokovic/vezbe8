table 50400 "BCCountry/Region Setup"
{
    Caption = 'Country/Region Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            DataClassification = SystemMetadata;
            TableRelation = "Country/Region";
            ObsoleteState = Pending;
            ObsoleteReason = 'In version 2.0 this field will be removed';

            trigger OnValidate()
            begin
                CalcFields("Country/Region Name");
            end;
        }
        field(3; "Country/Region Name"; Text[50])
        {
            Caption = 'Country/region Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Country/Region".Name where(Code = field("Country/Region Code")));
            Editable = false;
        }
        field(4; "Country/Region Enum"; Enum "CountryRegion Enum")
        {
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
