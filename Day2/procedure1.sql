--create procedure 
CREATE PROCEDURE MyPractice
    @City VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM [dbo].[Customers]
    WHERE City = @City;
END;
GO

-- altering the created procedure
alter procedure MyPractice
@City varchar(50)
as 
Begin
select * from [dbo].[Customers] where City=@City
END

go 
MyPractice 'California'



-- creating a new procedure using stored procedure creating it and using modify to alter
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sreedevi
-- Create date: 22-01-2026
-- Description:	Sample SP
-- =============================================
-- =============================================
-- Author:      Sreedevi
-- Create date: 22-01-2026
-- Description: Sample SP - Get customer by Name and City
-- =============================================

CREATE PROCEDURE SP_GetCustomerByNameAndCity
    @Name VARCHAR(1000),
    @City VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[Customers]
    WHERE FullName = @Name
      AND City = @City;
END;
GO


--altering the created procedure
ALTER PROCEDURE [dbo].[SP_GetCustomerByNameAndCity]
    @Name VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[Customers]
    WHERE FullName = @Name
      AND City = 'Seatle';
END;
GO
EXEC [dbo].[SP_GetCustomerByNameAndCity] 'John';