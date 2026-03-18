table 50101 "Item Quality Control Measures"
{
    CaptionML = ENU = 'Item Quality Control Measures', ESP = 'Medidas calidad producto';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            CaptionML = ENU = 'Item No.', ESP = 'Nº producto';
            TableRelation = Item;
            ToolTipML = ENU = 'sanvasjh', ESP = 'savjhsavjhsa';
            DataClassification = AccountData;
        }
        field(2; "Measure"; Code[20])
        {
            CaptionML = ENU = 'Measure', ESP = 'Medida';
            TableRelation = "Quality Control Measures" where(Blocked = const(false));
            ToolTipML = ENU = 'sanvasjh', ESP = 'savjhsavjhsa';
        }
        field(3; "Normal Value"; Text[50])
        {
            CaptionML = ENU = 'Normal Value', ESP = 'Valor normal';
            ToolTipML = ENU = 'sanvasjh', ESP = 'savjhsavjhsa';
        }
    }

    keys
    {
        key(PK; "Item No.", Measure)
        {
            Clustered = true;
        }
    }
}