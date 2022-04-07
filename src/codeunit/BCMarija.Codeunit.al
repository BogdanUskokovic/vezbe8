codeunit 50400 "BCMarija"
{
    TableNo = Customer;

    trigger OnRun()
    begin
        Rec.FindFirst();
        Message('Hello: %1', Rec.Count());
    end;

    procedure Mladjan()
    begin
        Message('Greetings from Trinidad & Tobago');
    end;

    procedure setKristina(k: Integer)
    begin
        Kristina := k;
    end;

    procedure getKristina(): Integer;
    begin
        exit(Kristina);
    end;

    var
        Kristina: Integer;

}