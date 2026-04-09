pageextension 50106 "Posted Purchase Receipt" extends "Posted Purchase Receipt"
{
    layout
    {
        addafter(PurchReceiptLines)
        {
            part(PurchaseQCMeasures; "Purchase QC Measures")
            {
                Editable = false;
                ApplicationArea = Suite;
                Provider = PurchReceiptLines;
                SubPageLink = "Document Type" = const("Posted Receipt"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
            }
        }
    }
}