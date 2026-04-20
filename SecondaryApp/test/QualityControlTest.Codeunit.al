namespace ClipPlatform.Test;

using Microsoft.Inventory.Item;
using Microsoft.Purchases.Document;

codeunit 50151 "Quality Control Test"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure Test001()
    begin

    end;

    [Test]
    procedure Test002()
    begin
        Error('Un error');
    end;

    [Test]
    procedure GetMin001()
    var
        GetMin: Codeunit GetMin;
        Valor1: Decimal;
        Valor2: Decimal;
        Resultado: Decimal;
    begin
        // [Scenario] La función GetMin devuelve el primer valor

        // [Given] Dos valores, 1 y 2
        Valor1 := 1;
        Valor2 := 2;

        // [When] Se llama a la función GetMin
        Resultado := GetMin.GetMin(Valor1, Valor2);

        // [Then] El resultado es 1
        if Resultado <> Valor1 then
            Error('El resultado es incorrecto');
    end;

    [Test]
    procedure GetMin002()
    var
        GetMin: Codeunit GetMin;
        Valor1: Decimal;
        Valor2: Decimal;
        Resultado: Decimal;
    begin
        // [Scenario] La función GetMin devuelve el segundo valor

        // [Given] Dos valores, 10 y 2
        Valor1 := 10;
        Valor2 := 2;

        // [When] Se llama a la función GetMin
        Resultado := GetMin.GetMin(Valor1, Valor2);

        // [Then] El resultado es 2
        if Resultado <> Valor2 then
            Error('El resultado es incorrecto');
    end;

    [Test]
    procedure SeleccionProductoEnPedidoCompra()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        PurchaseQCMeasures: Record "Purchase QC Measures";
        ItemQCMeasures: Record "Item Quality Control Measures";
        LibraryQC: Codeunit "Library - QC";
        LibraryPurchase: Codeunit "Library - Purchase";
        ItemNo: Code[20];
    begin
        // [Scenario] Cuando se selecciona un producto que requiere control de calidad
        //            en un pedido de compra, las medidas vinculadas al producto
        //            aparecen en el pedido de compra

        // [Given]    Un producto que requiere control de calidad y tiene medidas vinculadas
        //            Un pedido de compra para un proveedor cualquiera
        ItemNo := LibraryQC.CreateItemWithQC();
        LibraryPurchase.CreatePurchHeader(PurchaseHeader, Enum::"Purchase Document Type"::Order, '');
        LibraryPurchase.CreatePurchaseLineSimple(PurchaseLine, PurchaseHeader);

        // [When]  Seleccionamos el producto en el pedido
        PurchaseLine.Validate(Type, PurchaseLine.Type::Item);
        PurchaseLine.Validate("No.", ItemNo);
        PurchaseLine.Modify(true);

        // [Then]  Las medidas vinculadas al producto aparecen en el pedido de compra
        PurchaseQCMeasures.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseQCMeasures.SetRange("Document No.", PurchaseHeader."No.");
        PurchaseQCMeasures.SetRange("Line No.", PurchaseLine."Line No.");
        if PurchaseQCMeasures.Count() <> 2 then
            Error('El número de medidas de control de calidad vinculadas al pedido de compra es incorrecto');

        if PurchaseQCMeasures.FindSet() then
            repeat
                if not ItemQCMeasures.Get(ItemNo, PurchaseQCMeasures.Measure) then
                    Error('La medida vinculada a la compra no existe en el producto');
            until PurchaseQCMeasures.Next() = 0;
    end;
}