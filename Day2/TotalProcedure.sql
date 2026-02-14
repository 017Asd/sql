GO
CREATE PROCEDURE dbo.SP_CustomerOperations
(
    @CustomerId INT = NULL,
    @Segment    VARCHAR(50) = NULL,
    @IsActive   BIT = NULL,
    @Name       VARCHAR(100) = NULL,
    @City       VARCHAR(50) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    /* 1?? UPDATE customer details (if CustomerId provided) */
    IF @CustomerId IS NOT NULL
    BEGIN
        UPDATE dbo.Customers
        SET 
            Segment  = ISNULL(@Segment, Segment),
            IsActive = ISNULL(@IsActive, IsActive)
        WHERE CustomerId = @CustomerId;
    END

    /* 2?? SELECT by City */
    IF @City IS NOT NULL AND @Name IS NULL
    BEGIN
        SELECT *
        FROM dbo.Customers
        WHERE City = @City;
    END

    /* 3?? SELECT by Name and City */
    IF @Name IS NOT NULL AND @City IS NOT NULL
    BEGIN
        SELECT *
        FROM dbo.Customers
        WHERE FullName = @Name
          AND City = @City;
    END
END;
GO

EXEC dbo.SP_CustomerOperations
     @CustomerId = 206,
     @Segment = 'Social Service',
     @IsActive = 1;
EXEC dbo.SP_CustomerOperations
     @City = 'California';
EXEC dbo.SP_CustomerOperations
     @Name = 'John',
     @City = 'Seatle';
