codeunit 50153 "Library - QC"
{
    procedure CreateItemWithQC(): Code[20]
    var
        Item: Record Item;
        LibraryInventory: Codeunit "Library - Inventory";
    begin
        LibraryInventory.CreateItem(Item);
        Item.Validate("Requieres Quality Control", true);
        Item.Modify(true);

        CreateQualityControlMeasure('MEDIDA1');
        CreateQualityControlMeasure('MEDIDA2');

        CreateItemQualityControlMeasure(Item."No.", 'MEDIDA1');
        CreateItemQualityControlMeasure(Item."No.", 'MEDIDA2');

        exit(Item."No.");
    end;

    procedure CreateQualityControlMeasure(Measure: Code[20])
    var
        QualityControlMeasures: Record "Quality Control Measures";
    begin
        QualityControlMeasures.Init();
        QualityControlMeasures.Measure := Measure;
        QualityControlMeasures.Description := 'Descripción' + Measure;
        QualityControlMeasures.Insert();
    end;

    procedure CreateItemQualityControlMeasure(ItemNo: Code[20]; Measure: Code[20])
    var
        ItemQCMeasures: Record "Item Quality Control Measures";
    begin
        ItemQCMeasures.Init();
        ItemQCMeasures.Validate("Item No.", ItemNo);
        ItemQCMeasures.Validate("Measure", Measure);
        ItemQCMeasures.Insert();
    end;
}