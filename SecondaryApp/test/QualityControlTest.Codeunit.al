namespace ClipPlatform.Test;

codeunit 50151 "Quality Control Test"
{
    Subtype = Test;
    // TestType = UnitTest;

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
}