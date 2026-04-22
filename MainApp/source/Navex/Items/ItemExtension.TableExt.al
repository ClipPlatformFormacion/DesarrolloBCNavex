namespace Navex.Items;

using Microsoft.Inventory.Item;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Location;

tableextension 50100 "Item Extension" extends Item
{
    fields
    {
        field(50100; "Requieres Quality Control"; Boolean)
        {
            Caption = 'Requieres Quality Control', Comment = 'ESP="Requiere control calidad"';
            ToolTip = 'sdbsdkjbkj', Comment = 'ESP="Especifica que se deberá realizar un control de calidad de este producto en las compras"';
            DataClassification = CustomerContent;
            ObsoleteState = Pending;
            ObsoleteReason = 'Este campo será elimando en BC30. Utilice el campo "Requires Quality Control" en su lugar"';

            trigger OnValidate()
            begin
                Rec."Requires Quality Control" := Rec."Requieres Quality Control";
            end;
        }
        field(50103; "Requires Quality Control"; Boolean)
        {
            Caption = 'Requires Quality Control', Comment = 'ESP="Requiere control calidad"';
            ToolTip = 'sdbsdkjbkj', Comment = 'ESP="Especifica que se deberá realizar un control de calidad de este producto en las compras"';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                Rec."Requieres Quality Control" := Rec."Requires Quality Control";
            end;
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
                                "Location Code" = field("Un FlowFilter"),
                                "Posting Date" = field("Date Filter")
                                ));
        }
        field(50102; "Un FlowFilter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
    }
}