table 50100 "Quality Control Measures"
{
    CaptionML = ENU = 'Quality Control Measures Caption', ESP = 'Medidas control calidad';
    LookupPageId = "Quality Control Measures";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Measure; Code[20])
        {
            CaptionML = ENU = 'Measure', ESP = 'Medida';
            ToolTipML = ENU = 'sanvasjh', ESP = 'savjhsavjhsa';
        }
        field(2; Description; Text[100])
        {
            CaptionML = ENU = 'Description', ESP = 'Descripción';
            ToolTipML = ENU = 'sanvasjh', ESP = 'savjhsavjhsa';
        }
        field(3; Blocked; Boolean)
        {
            CaptionML = ENU = 'Blocked', ESP = 'Bloqueado';
            ToolTipML = ENU = 'sanvasjh', ESP = 'savjhsavjhsa';
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Measure, Description, Blocked) { }
        fieldgroup(Brick; Blocked, Measure, Description) { }
    }
}