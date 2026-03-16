permissionset 50100 "QCSuper"
{
    CaptionML = ENU = 'SUPER Quality Control', ESP = 'SUPER Control calidad';
    Assignable = true;
    Permissions = tabledata "Quality Control Measures" = RIMD,
        tabledata "Item Quality Control Measures" = RIMD,
        table "Item Quality Control Measures" = X,
        table "Quality Control Measures" = X,
        page "Item Quality Control Measures" = X,
        page "Quality Control Measures" = X;
}