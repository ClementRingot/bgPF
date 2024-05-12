@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_TEST_TABLE_CRT'
@ObjectModel.semanticKey: [ 'TravelID' ]
define root view entity ZC_TEST_TABLE_CRT
  provider contract transactional_query
  as projection on ZR_TEST_TABLE_CRT
{
  key TravelID,
  AgencyID,
  CustomerID,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  CurrencyCode,
  Description,
  OverallStatus,
  Attachment,
  MimeType,
  FileName,
  LocalLastChangedAt
  
}
