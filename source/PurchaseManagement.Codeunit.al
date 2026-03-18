codeunit 50100 "Purchase Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchaseDoc, '', false, false)]
    local procedure CheckItemQualityControl(PurchaseHeader: Record "Purchase Header")
    var
        myInt: Integer;
    begin
        if not PurchaseHeader.Receive then
            exit;
    end;
}