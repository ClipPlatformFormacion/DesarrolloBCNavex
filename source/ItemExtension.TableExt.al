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
    }
}