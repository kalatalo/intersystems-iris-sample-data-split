CREATE TABLE ML.churn01 (
       customerID VARCHAR(10) PRIMARY KEY,
       gender VARCHAR(5),
       SeniorCitizen INT,
       Partner VARCHAR(3),
       Dependents VARCHAR(3),
       tenure INT,
       PhoneService VARCHAR(3),
       MultipleLines VARCHAR(20),
       InternetService VARCHAR(13),
       OnlineSecurity VARCHAR(10),
       OnlineBackup VARCHAR(10),
       DeviceProtection VARCHAR(10),
       TechSupport VARCHAR(10),
       StreamingTV VARCHAR(10),
       StreamingMovies VARCHAR(10),
       Contract VARCHAR(20),
       PaperlessBilling VARCHAR(5),
       PaymentMethod VARCHAR(20),
       MonthlyCharges DECIMAL(10,2),
       TotalCharges DECIMAL(10,2),
       Churn VARCHAR(5)
)
go
