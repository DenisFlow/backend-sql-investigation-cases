/*
Case:
Enable product availability for partner.
*/

UPDATE PartnerProductSettings
SET IsEnabled = 1
WHERE PartnerId = 'PARTNER_ID'
AND ProductCode = 'AUTO_STANDARD';