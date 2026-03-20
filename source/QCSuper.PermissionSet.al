permissionset 50100 "QCSuper"
{
    Caption = 'SUPER Quality Control', Comment = 'ESP="SUPER Control calidad"';
    Assignable = true;
    Permissions = tabledata "Quality Control Measures" = RIMD,
        tabledata "Item Quality Control Measures" = RIMD,
        table "Item Quality Control Measures" = X,
        table "Quality Control Measures" = X,
        page "Item Quality Control Measures" = X,
        page "Quality Control Measures" = X,
        tabledata "Purchase QC Measures" = RIMD,
        table "Purchase QC Measures" = X,
        codeunit "Purchase Management" = X;
}