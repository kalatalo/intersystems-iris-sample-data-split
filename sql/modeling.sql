
CALL samplingData('ML.churn01', 42, 70);


CREATE MODEL model01 PREDICTING (Churn) FROM  ML.churn01_train_data

TRAIN MODEL Model01

VALIDATE MODEL Model01 FROM ML.churn01_test_data


