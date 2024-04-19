USE YamaranDb;

SELECT 
    EI.EmployeeID AS EmpID,
    EI.Fname AS FName,
    EI.Lname AS LName,
	EI.ContactNum AS ContactNum,
	EI.EmailAddress AS EmailAddress,
    EI.Position AS EmpPosition,
    D.DepName AS DepartmentName,
	D.DepLocation AS DepLocation

FROM 
    EmployeeInformation EI
JOIN 
    Department D ON EI.DepID = D.DepID;