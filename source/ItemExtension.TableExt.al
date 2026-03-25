tableextension 50100 "Item Extension" extends Item
{
    fields
    {
        field(50100; "Requieres Quality Control"; Boolean)
        {
            Caption = 'Requieres Quality Control', Comment = 'ESP="Requiere control calidad"';
            ToolTip = 'sdbsdkjbkj', Comment = 'ESP="Especifica que se deberá realizar un control de calidad de este producto en las compras"';
            DataClassification = CustomerContent;
        }
        field(50101; "Non-Satisfactory Purch. (Qty.)"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            DecimalPlaces = 0 : 5;
            BlankZero = true;
            CalcFormula = sum("Item Ledger Entry".Quantity where(
                                "Item No." = field("No."),
                                "QC Result (Enum)" = const("Non-Satisfactory"),
                                "Entry Type" = const(Purchase),
                                "Location Code" = field("Un FlowFilter")
                                ));
        }
        field(50102; "Un FlowFilter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
    }
}