page 50100 "Quality Control Measures"
{
    //Caption = 'Quality Control Measures', Comment = 'ESP="Medidas control calidad"';
    Caption = 'Quality Control Measures', Comment = 'ESP="Medidas control calidad",FRA="skjakjsa"';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Quality Control Measures";

    layout
    {
        area(Content)
        {
            repeater(RepeaterControl)
            {
                field(Measure; Rec.Measure) { }
                field(Description; Rec.Description) { }
                field(Blocked; Rec.Blocked) { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportExportQCMeasures)
            {
                Caption = 'Import/Export', comment = 'ESP="Importar/Exportar"';
                Image = Import;
                RunObject = xmlport "Import/Export QC Measures";
            }
            action(ExecuteQuery)
            {
                Caption = 'Execute Query', comment = 'ESP="Ejecutar query"';
                Image = ExecuteBatch;
                RunObject = query "Item Vendor";
            }
        }
    }
}