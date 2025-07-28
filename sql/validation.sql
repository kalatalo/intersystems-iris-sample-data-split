
SELECT 
count (*)
FROM ML.churn01
union all

SELECT 
count (*)
FROM ML.churn01_train_data

union all

SELECT 
count (*)
FROM ML.churn01_test_data
