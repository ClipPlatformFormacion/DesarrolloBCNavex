report 50100 "Block Non-Satisfactory Items"
{
    Caption = 'Block Non-Satisfactory Items', comment = 'ESP="Bloquear productos No satisfactorios"';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // ProcessingOnly = true;
    DefaultRenderingLayout = RDLCLayout;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Inventory Posting Group";

            dataitem(ItemQualityControlMeasures; "Item Quality Control Measures")
            {
                DataItemLinkReference = Item;
                DataItemLink = "Item No." = field("No.");

                column(Measure; Measure) { }
                column(Normal_Value; "Normal Value") { }
                column(Measure_Description; "Measure Description") { }
            }

            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(NonSatisfactoryPurchQty; "Non-Satisfactory Purch. (Qty.)")
            {
                IncludeCaption = true;
            }
            column(BlockedByReport; Format(BlockedByReport)) { }
            column(BlockedByReportCaption; BlockedByReportCaption) { }

            trigger OnPreDataItem()
            begin
                // Message('OnPreDataItem');
                Item.SetFilter("Date Filter", '%1..%2', CalcDate(Period, WorkDate()), WorkDate());
            end;

            trigger OnAfterGetRecord()
            begin
                // Message('OnAfterGetRecord');
                // Counter := Counter + 1;
                Counter += 1;
                Clear(BlockedByReport);

                Item.CalcFields("Non-Satisfactory Purch. (Qty.)");
                if Item."Non-Satisfactory Purch. (Qty.)" > NoOfNonSatistactoryUnits then begin
                    Item.Validate(Blocked, true);
                    Item.Modify(true);
                    ModifiedCounter += 1;
                    BlockedByReport := true;
                end;
            end;

            trigger OnPostDataItem()
            var
                NoOfBlockedItemsMsg: Label '%1 items have been blocked out of a total of %2 items', comment = 'ESP="Se han bloqueado %1 productos de un total de %2 productos"';
            begin
                Message(NoOfBlockedItemsMsg, ModifiedCounter, Counter);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(NoOfNonSatistactoryUnitsControl; NoOfNonSatistactoryUnits)
                    {
                        Caption = '# of Non-Satisfactory Units', comment = 'ESP="Nº de unidades No Satisfactorias"';
                        ToolTip = '', Comment = 'ESP="Indica que los productos que hayan tenido una cantidad mayor de unidades no satisfactorias que el establecido en esta opción, serán bloqueados"';
                        ApplicationArea = All;
                    }
                    field(PeriodControl; Period)
                    {
                        Caption = 'Period', comment = 'ESP="Periodo"';
                        ApplicationArea = All;
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            NoOfNonSatistactoryUnits := 5;
            Evaluate(Period, '-1M');
        end;
    }

    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './source/BlockNonSatisfactoryItems.rdl';
        }
        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = './source/BlockNonSatisfactoryItems.xlsx';
        }
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = './source/BlockNonSatisfactoryItems.docx';
        }
    }

    trigger OnPreReport()
    begin
        if NoOfNonSatistactoryUnits = 0 then
            if not Confirm('¿Estás seguro que quieres bloquear los productos con más de %1 unidades No satisfactorias?', false, NoOfNonSatistactoryUnits) then
                Error('Proceso detenido a petición del usuario');
    end;

    var
        Period: DateFormula;
        Counter, ModifiedCounter : Integer;
        NoOfNonSatistactoryUnits: Decimal;
        BlockedByReport: Boolean;
        BlockedByReportCaption: TextConst ENU = 'Blocked by Report', ESP = 'Bloqueado por el informe';
}