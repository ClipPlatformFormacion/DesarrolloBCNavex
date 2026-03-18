table 50101 "Item Quality Control Measures"
{
    Caption = 'Item Quality Control Measures', Comment = 'ESP="Medidas calidad producto"';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.', Comment = 'ESP="Nº producto"';
            TableRelation = Item;
            ToolTip = 'sanvasjh', Comment = 'ESP="savjhsavjhsa"';
            DataClassification = AccountData;
        }
        field(2; "Measure"; Code[20])
        {
            Caption = 'Measure', Comment = 'ESP="Medida"';
            TableRelation = "Quality Control Measures" where(Blocked = const(false));
            ToolTip = 'sanvasjh', Comment = 'ESP="savjhsavjhsa"';
        }
        field(3; "Normal Value"; Text[50])
        {
            Caption = 'Normal Value', Comment = 'ESP="Valor normal"';
            ToolTip = 'sanvasjh', Comment = 'ESP="savjhsavjhsa"';
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