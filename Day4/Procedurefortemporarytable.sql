CREATE PROCEDURE usp_TempTable_Demo
AS
BEGIN
    SET NOCOUNT ON;

    /* ===== Local Temporary Table ===== */
    -- Create local temp table
    SELECT TOP 5 *
    INTO #temp1
    FROM [sales].[customers];

    -- Display data from local temp table
    SELECT * FROM #temp1;

    -- Delete data
    DELETE FROM #temp1;

    -- Reinsert data to show TRUNCATE
    INSERT INTO #temp1
    SELECT TOP 5 *
    FROM [sales].[customers];

    -- Truncate table
    TRUNCATE TABLE #temp1;

    -- Drop local temp table
    DROP TABLE #temp1;


    /* ===== Global Temporary Table ===== */
    -- Create global temp table (accessible to other sessions)
    SELECT TOP 5 *
    INTO ##temp2
    FROM [sales].[customers];

    -- Display data from global temp table
    SELECT * FROM ##temp2;

    -- Drop global temp table
    DROP TABLE ##temp2;
END;
GO
