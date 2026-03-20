pageextension 50103 "Purchase Order" extends "Purchase Order"
{
    layout
    {
        addbefore(PurchaseDocCheckFactbox)
        {
            part(PurchaseQCMeasures; "Purchase QC Measures")
            {
                ApplicationArea = Suite;
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
            }
        }
    }
}