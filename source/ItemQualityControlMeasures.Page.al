page 50101 "Item Quality Control Measures"
{
    CaptionML = ENU = 'Item Quality Control Measures', ESP = 'Medidas calidad producto';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Item Quality Control Measures";

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("Item No."; Rec."Item No.")
                {
                    Visible = false;
                }
                field(Measure; Rec.Measure) { }
                field("Normal Value"; Rec."Normal Value") { }
            }
        }
    }
}