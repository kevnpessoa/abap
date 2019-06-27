@AbapCatalog.sqlViewName: 'zv_sflight'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View for flights'
define view zcds_sflight as select 

from sflight as fli
     join sbook as sbo on sbo.carrid = fli.carrid
         and sbo.connid = fli.connid
         and sbo.fldate = fli.fldate

{
    fli.carrid, fli.connid, fli.fldate,
    sbo.bookid
}
