codeunit 50153 "Library - QC"
{
    procedure CreateItemWithQC(): Code[20]
    var
        Item: Record Item;
        LibraryInventory: Codeunit "Library - Inventory";
        LibraryRandom: Codeunit "Library - Random";
        Measure1, Measure2 : Code[20];
    begin
        LibraryInventory.CreateItem(Item);
        Item.Validate("Requires Quality Control", true);
        Item.Modify(true);

        LibraryRandom.Init();
        Measure1 := CreateQualityControlMeasure(LibraryRandom.RandText(20));
        Measure2 := CreateQualityControlMeasure(LibraryRandom.RandText(20));

        CreateItemQualityControlMeasure(Item."No.", Measure1);
        CreateItemQualityControlMeasure(Item."No.", Measure2);

        exit(Item."No.");
    end;

    procedure CreateQualityControlMeasure(Measure: Code[20]): Code[20]
    var
        QualityControlMeasures: Record "Quality Control Measures";
    begin
        QualityControlMeasures.Init();
        QualityControlMeasures.Measure := Measure;
        QualityControlMeasures.Description := 'Descripción' + Measure;
        QualityControlMeasures.Insert();
        exit(Measure);
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