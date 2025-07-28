# intersystems-iris-sample-data-split
A tool to facilitate the ML process in Intersystems IRIS


Essentially, Machine Learning is about learning from data. Therefore, having "good" data leads to better models and more importantly, the quality of information being applied to it plays a crucial role in improving the prediction accuracy.

In this article, we will expose best practices for randomization when separating the data into training and validation sets, as well as the use of a developed routine to execute such tasks.

Consider an example where using HistoricalData from the IRIS IntegratedML library, we create a model. The general process is:

1. Create a model with the training dataset:
```
CREATE MODEL Model01 PREDICTING (Label) FROM TrainData
```

2. Train the model:
```
TRAIN MODEL Model01
```

3. Validate the model using the testing dataset:
```
VALIDATE MODEL Model01 FROM TestData
```

A key point to note is that when constructing the model, both the training and testing datasets come from the same table in HistoricalData, which means they have the same origin. Historical Data = training + test 

This approach has significant implications for developing models: having a balanced sample of data (Training and Test) is essential. When splitting data into Training and Testing sets, it's crucial to keep in mind to have:

- The maximum possible number of observations for training 
- Each category of features should have an adequate representation of observations.

This suggests not using a standard split ratio, such as 50/50 or 80/20. Instead, I prefer two principles:

1. Keep the maximum number of samples for training within 80-90%.
2. Ensure that each category of feature has representative numbers of observations.
3. Avoid having an imbalance in categories where necessary.

Example, if you're trying to predict hospital admission probabilities based on patient data and one of your features is sex, it's better not to train the model with very few records from a particular sex group (e.g., fewer than 30 females). This would lead to unstable 
estimations in the model. Therefore, for smaller datasets, using 50/50 split might be more suitable.



IRIS Example :



start with: docker compose up


Here a method was developed to generate random samples using python functions



We are using a dataset from Kaggle https://www.kaggle.com/datasets/blastchar/telco-customer-churn

we want to build a risk model that measures the risk of customer churn for a telco company
As label we have the column "Churn" and also have 20 customer-related features






Our table with all customers data: churn01

To split our samples Just run on SQL editor,

```
CALL samplingData('ML.churn01',43534,70);
```

This will generate three tables:

1. `churn01_train_data` (table with the training sample)
2. `churn01_test_data` (table with the testing sample)
3. `churn01_sampling_result` (table with the random elements for each row)


In our example:
- `ML.churn01`: Namespace and table name
- `seed=43534`: Repeating this number ensures we will always have the same random sample.
- `training_percentage=70`: This means that 70% of the dataset will be used for training and 30% for test

All the tables were created, so we can go ahead with  AutoML:

1) Create our model: CREATE MODEL model01 PREDICTING (Churn) FROM  ML.churn01_train_data
2) Train with our train data: TRAIN MODEL Model01
3) Validate with our test data; VALIDATE MODEL Model01 FROM ML.churn01_test_data





