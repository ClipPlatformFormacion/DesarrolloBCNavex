codeunit 50100 "Purchase Management"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchaseDoc, '', false, false)]
    local procedure CheckItemQualityControl(var PurchaseHeader: Record "Purchase Header")
    var
        PurchaseLine: Record "Purchase Line";
        Item: Record Item;
        QCMandatoryOptionErr: TextConst ENU = 'Item %1 requieres quality control', ESP = 'Hay que hacer control de calidad para el producto %1';
        QCMandatoryEnumErr: Label 'Item %1 requieres quality control', Comment = 'ESP="Hay que hacer control de calidad para el producto %1"';
    begin
        if not PurchaseHeader.Receive then
            exit;

        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
        PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
        PurchaseLine.SetFilter("Qty. to Receive", '<>%1', 0);
        // PurchaseLine.SetRange(Type, Enum::"Purchase Line Type"::Item);
        // PurchaseLine.SetRange(Type, "Purchase Line Type"::Item);
        PurchaseLine.SetLoadFields("No.", "QC Result (Enum)", "QC Result (Option)");
        if PurchaseLine.FindSet() then   // SELECT * FROM PurchaseLine WHERE (setrange setfilter)  // SELECT No.,QC Result, 
            repeat
                Item.SetLoadFields("Requieres Quality Control");
                Item.Get(PurchaseLine."No.");
                if Item."Requieres Quality Control" then begin
                    if PurchaseLine."QC Result (Enum)" = PurchaseLine."QC Result (Enum)"::" " then
                        Error(QCMandatoryEnumErr, PurchaseLine."No.");
                    if PurchaseLine."QC Result (Option)" = PurchaseLine."QC Result (Option)"::" " then
                        Error(QCMandatoryOptionErr, PurchaseLine."No.");
                end;
            until PurchaseLine.Next() = 0;
    end;
}