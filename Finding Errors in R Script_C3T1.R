install.packages("readr") # call package in quotes
library("readr")
IrisDataset<- read.csv("iris.csv") # call data set in quotes
attributes(IrisDataset)
summary(IrisDataset) # correct spelling of data set req'd
str(IrisDataset) #again...correct spelling of data set req'd
names(IrisDataset)
IrisDataset<- subset(IrisDataset, select= -c(X))

hist(IrisDataset$Species) #can't run because 'Species' data in string vals
IrisDataset$Species<-as.factor(IrisDataset$Species) # change 'car'Species' type from str to categorical
counts<- table(IrisDataset$Species) # can't run on factor data type either...use bar plot instead
barplot(counts, main="Species Distribution",
        xlab = "Population")

plot(IrisDataset$Sepal.Length) #close parenthesis

qqnorm(IrisDataset$Sepal.Length) # qqnorm plots must call on feature, not whole data set

IrisDataset$Species<- as.numeric(IrisDataset$Species) #change 'Species' data type to numeric
hist(IrisDataset$Species)

set.seed(123)
trainSize <- round(nrow(IrisDataset) * 0.2)
testSize <- nrow(IrisDataset) - trainSize # 'trainSize'not 'trainSet'
trainSize # 'trainSize'not 'trainSizes'
testSize

training_indices<- sample(seq_len(nrow(IrisDataset)),size= trainSize) #define training_indices before calling them 
trainSet <- IrisDataset[training_indices, ]
testSet <- IrisDataset[-training_indices, ]


## omitting the following code as it calls new random seed
## which is a separate seed than was called for random
## sampling of the data

# set.seed(405)
# trainSet <- IrisDataset[training_indices, ]
# testSet <- IrisDataset[-training_indices, ]



LinearModel<- lm(trainSet$Petal.Width ~ trainSet$Petal.Length) #modeling should only occur in trainSet, not 'testingSet'
summary(LinearModel)

prediction<-predict(LinearModel, testSet) # predict() function needs to call model AND testing data
prediction # 'prediction' not 'predictions'


