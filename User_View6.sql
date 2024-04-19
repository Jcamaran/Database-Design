USE YamaranDb;

SELECT CI.CustID, CI.Fname, CI.Lname, CI.ContactNum, CI.EmailAddress,
       OH.HistID, OH.BikeBought, OH.TotalSpent
FROM CustomerInfo CI
JOIN OrderHistory OH ON CI.CustID = OH.CustID;