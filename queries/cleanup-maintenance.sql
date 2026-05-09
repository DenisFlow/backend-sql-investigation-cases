/*
Case:
Maintenance cleanup script
*/

DELETE FROM TemporaryApiKeys
WHERE ExpiresAt < GETDATE();