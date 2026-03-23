table 50102 "Purchase QC Measures"
{
    Caption = 'Purchase Quality Control Measures', Comment = 'ESP="Medidas calidad compra"';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Document Type"; Enum "Purchase Document Type") { }
        field(11; "Document No."; Code[20]) { }
        field(12; "Line No."; Integer) { }
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
        field(4; "Value"; Text[50])
        {
            Caption = 'Value', comment = 'ESP="Valor"';
        }
    }

    keys
    {
        key(PK; "Document Type", "Document No.", "Line No.", Measure)
        {
            Clustered = true;
        }
    }
}