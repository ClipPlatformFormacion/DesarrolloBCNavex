pageextension 50100 "Item Card Extension" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group(QualityControl)
            {
                Caption = 'Quality Control', Comment = 'ESP="Control calidad"';
                field("Requieres Quality Control"; Rec."Requieres Quality Control")
                {
                    ApplicationArea = All;
                }
                part(ItemQC; "Item Quality Control Measures")
                {
                    Caption = 'Measures', Comment = 'ESP="Medidas"';
                    ApplicationArea = All;
                    SubPageLink = "Item No." = field("No.");
                }
            }
        }
    }
}