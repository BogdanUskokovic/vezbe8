codeunit 50401 "BCMySubscribers"
{
    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnCallPublisher', '', true, true)]
    local procedure MessageOnCallPublisher(var Customer: Record Customer)
    var
        TextMsg: Label 'You have selected %1 customer';
    begin
        Message(TextMsg, Customer.Name);
    end;
}