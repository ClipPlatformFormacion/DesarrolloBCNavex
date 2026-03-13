pageextension 50100 "Item Card Extension" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group(QualityControl)
            {
                CaptionML = ENU = 'Quality Control', ESP = 'Control calidad';
                field("Requieres Quality Control"; Rec."Requieres Quality Control")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}