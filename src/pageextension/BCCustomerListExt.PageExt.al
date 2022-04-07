// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50400 "BCCustomerListExt" extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            action(BCCallPublisher)
            {
                ApplicationArea = All;
                ToolTip = 'Trinidad';
                Promoted = true;
                PromotedCategory = Process;
                Image = "8ball";

                trigger OnAction()
                begin
                    OnCallPublisher(Rec);
                end;
            }
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnCallPublisher(var Customer: Record Customer)
    begin
    end;
}
