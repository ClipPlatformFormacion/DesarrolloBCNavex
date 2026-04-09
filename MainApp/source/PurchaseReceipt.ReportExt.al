reportextension 50100 "Purchase - Receipt" extends "Purchase - Receipt"
{
    dataset
    {
        add("Purch. Rcpt. Line")
        {
            column(QC_Result__Enum_; "QC Result (Enum)")
            {
                IncludeCaption = true;
            }
        }
    }

    requestpage
    {
        layout
        {
            addfirst(Options)
            {
                field(UnCampo; 'hola!')
                {
                    Editable = false;
                }
            }
        }
    }

    rendering
    {
        layout(QCRDLC)
        {
            Type = RDLC;
            LayoutFile = './source/PurchaseReceipt.rdl';
        }
    }
}