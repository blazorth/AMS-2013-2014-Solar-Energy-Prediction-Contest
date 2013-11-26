library(gbm)			‘ Load the gbm package

DataTrain = read.table(“DataTrain.csv", header = T, sep = ",", dec = ".")		‘ Load training set
DataTest = read.table(“DataTest.csv", header = T, sep = ",", dec = ".")		‘ Load testing set

Model.gbm <- gbm(Power ~ .,distribution="laplace", data=DataTrain, n.trees=3000, interaction.depth =6, shrinkage=0.05, bag.fraction)		‘ Train the model

Prediction <- predict.gbm(Model.gbm, DataTest, n.trees=3000)	‘ Predict the test set
