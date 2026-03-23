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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnPostUpdateOrderLineOnPurchHeaderReceive, '', false, false)]
    local procedure "Purch.-Post_OnPostUpdateOrderLineOnPurchHeaderReceive"(var TempPurchLine: Record "Purchase Line"; PurchRcptHeader: Record "Purch. Rcpt. Header")
    begin
        TempPurchLine."QC Result (Option)" := TempPurchLine."QC Result (Option)"::" ";
        Clear(TempPurchLine."QC Result (Enum)");
        // TempPurchLine.Modify();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterValidateEvent, "No.", false, false)]
    local procedure PurchaseLine_OnAfterValidate_No_SetQualityControlMeasures(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line")
    begin
        SetQualityControlMeasures(Rec, Rec."No." <> xRec."No.");
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterInsertEvent, '', false, false)]
    local procedure PurchaseLine_OnAfterInsert_SetQualityControlMeasures(var Rec: Record "Purchase Line")
    begin
        SetQualityControlMeasures(Rec, false);
    end;

    local procedure SetQualityControlMeasures(var Rec: Record "Purchase Line"; DeletePreviousMeasures: Boolean)
    var
        ItemQCMeasures: Record "Item Quality Control Measures";
        PurchaseQCMeasures: Record "Purchase QC Measures";
    begin
        if Rec.IsTemporary() then
            exit;

        if Rec.Type <> Rec.Type::Item then
            exit;

        if Rec."Line No." = 0 then
            exit;

        if DeletePreviousMeasures then begin
            PurchaseQCMeasures.SetRange("Document Type", Rec."Document Type");
            PurchaseQCMeasures.SetRange("Document No.", Rec."Document No.");
            PurchaseQCMeasures.SetRange("Line No.", Rec."Line No.");
            PurchaseQCMeasures.DeleteAll(true);
        end;

        ItemQCMeasures.SetRange("Item No.", Rec."No.");
        if ItemQCMeasures.FindSet() then
            repeat
                PurchaseQCMeasures.Init();
                PurchaseQCMeasures.Validate("Document Type", Rec."Document Type");
                PurchaseQCMeasures.Validate("Document No.", Rec."Document No.");
                PurchaseQCMeasures.Validate("Line No.", Rec."Line No.");
                PurchaseQCMeasures.Validate("Item No.", Rec."No.");
                PurchaseQCMeasures.Validate(Measure, ItemQCMeasures.Measure);
                PurchaseQCMeasures.Validate("Normal Value", ItemQCMeasures."Normal Value");
                PurchaseQCMeasures.Insert(true);
            until ItemQCMeasures.Next() = 0;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromPurchLine, '', false, false)]
    local procedure "Item Journal Line_OnAfterCopyItemJnlLineFromPurchLine"(var ItemJnlLine: Record "Item Journal Line"; PurchLine: Record "Purchase Line")
    begin
        ItemJnlLine."QC Result (Option)" := PurchLine."QC Result (Option)";
        ItemJnlLine."QC Result (Enum)" := PurchLine."QC Result (Enum)";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', false, false)]
    local procedure "Item Jnl.-Post Line_OnAfterInitItemLedgEntry"(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."QC Result (Option)" := ItemJournalLine."QC Result (Option)";
        NewItemLedgEntry."QC Result (Enum)" := ItemJournalLine."QC Result (Enum)";
    end;
}