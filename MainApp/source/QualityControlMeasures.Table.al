table 50100 "Quality Control Measures"
{
    Caption = 'Quality Control Measures Caption', Comment = 'ESP="Medidas control calidad"';
    LookupPageId = "Quality Control Measures";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Measure; Code[20])
        {
            Caption = 'Measure', Comment = 'ESP="Medida"';
            ToolTip = 'sanvasjh', Comment = 'ESP="savjhsavjhsa"';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description', Comment = 'ESP="Descripción"';
            ToolTip = 'sanvasjh', Comment = 'ESP="savjhsavjhsa"';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked', Comment = 'ESP="Bloqueado"';
            ToolTip = 'sanvasjh', Comment = 'ESP="savjhsavjhsa"';
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Measure, Description, Blocked) { }
        fieldgroup(Brick; Blocked, Measure, Description) { }
    }
}