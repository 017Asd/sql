CREATE PROCEDURE dbo.usp_ProcessProductsAndReorder
AS
BEGIN
    SET NOCOUNT ON;

    -------------------------------------------------
    -- Part 1: Print all products
    -------------------------------------------------
    DECLARE @ProductId INT;
    DECLARE @ProductName VARCHAR(100);
    DECLARE @Price DECIMAL(10,2);

    DECLARE currProducts CURSOR FAST_FORWARD
    FOR
        SELECT ProductId, ProductName, Price
        FROM dbo.Products
        ORDER BY ProductId;

    OPEN currProducts;

    FETCH NEXT FROM currProducts
    INTO @ProductId, @ProductName, @Price;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'ProductId=' + CAST(@ProductId AS VARCHAR(10))
            + ' | Name=' + @ProductName
            + ' | Price=' + CAST(@Price AS VARCHAR(20));

        FETCH NEXT FROM currProducts
        INTO @ProductId, @ProductName, @Price;
    END

    CLOSE currProducts;
    DEALLOCATE currProducts;

    -------------------------------------------------
    -- Part 2: Reorder log for low stock
    -------------------------------------------------
    TRUNCATE TABLE dbo.ReorderLog;

    DECLARE @StockQty INT;

    DECLARE curLowStock CURSOR FAST_FORWARD
    FOR
        SELECT ProductId, ProductName, StockQty
        FROM dbo.Products
        WHERE StockQty < 30
        ORDER BY StockQty ASC;

    OPEN curLowStock;

    FETCH NEXT FROM curLowStock
    INTO @ProductId, @ProductName, @StockQty;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO dbo.ReorderLog (ProductId, Message)
        VALUES
        (
            @ProductId,
            'Reorder needed for ' + @ProductName +
            ' (Stock=' + CAST(@StockQty AS VARCHAR(10)) + ')'
        );

        FETCH NEXT FROM curLowStock
        INTO @ProductId, @ProductName, @StockQty;
    END

    CLOSE curLowStock;
    DEALLOCATE curLowStock;

    -------------------------------------------------
    -- Final output
    -------------------------------------------------
    SELECT *
    FROM dbo.ReorderLog
    ORDER BY LogId;
END
GO
