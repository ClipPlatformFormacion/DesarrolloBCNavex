namespace ClipPlatform.QualityControl;

page 50102 "Purchase QC Measures"
{
    Caption = 'Purchase Quality Control Measures', Comment = 'ESP="Medidas calidad compra"';
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Purchase QC Measures";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Measure; Rec.Measure) { Editable = false; }
                field("Normal Value"; Rec."Normal Value") { Editable = false; }
                field(Value; Rec.Value) { }
            }
        }
    }
}