USE MetroAlt

/*Create BusService table*/
CREATE TABLE BusService (
	BusServiceKey INT IDENTITY (1,1) PRIMARY KEY,
	BusServiceName VARCHAR (255) NOT NULL,
	BusServiceDescription VARCHAR (255),
)

/*Create Maintenance table*/ 
CREATE TABLE Maintenance (
	MaintenanceKey INT IDENTITY (1,1) PRIMARY KEY,
	MaintenanceDate DATE NOT NULL,
	BusKey INT NOT NULL,
)

/*Create Maintenance Detail table*/
CREATE TABLE MaintenanceDetail (
	MaintenanceDetailKey INT IDENTITY (1,1) PRIMARY KEY,
	EmployeeKey INT NOT NULL,

)