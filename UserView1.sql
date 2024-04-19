USE YamaranDb;


SELECT BI.*, BP.Price, BP.Tax, BP.VendorFee, BP.Total
FROM BikeInventory BI
JOIN BikePricing BP ON BI.BikeID = BP.BikeID;