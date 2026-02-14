CREATE TRIGGER sales.Trigr_Insert_Customer
ON sales.customers
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.logfile (Id, logtext)
    SELECT
        NEWID(),
        'New customer inserted: '
        + ISNULL(first_name,'') + ' ' + ISNULL(last_name,'')
        + ', Email=' + ISNULL(email,'')
        + ', Phone=' + ISNULL(phone,'')
        + ', Address=' + ISNULL(street,'') + ', ' + ISNULL(city,'') + ', ' + ISNULL(state,'') 
        + ', Zip=' + CAST(ISNULL(zip_code,0) AS VARCHAR(10))
            
    FROM inserted;
END;
GO
INSERT INTO sales.customers
(first_name, last_name, phone, email, street, city, state, zip_code)
VALUES
('Alica','Hunter',NULL,'alica.hunter@hotmail.com','8 San Juan Drive','East Elmhurst','NY',11369);

select * from logfile