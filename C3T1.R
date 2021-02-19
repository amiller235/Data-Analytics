## Import Packages
install.packages("readr") #install readr to read CSVs
library("readr")

##  Import Data
CarData<- read.csv("cars.csv") 
attributes(CarData) #EDA
summary(CarData)
str(CarData)
names(CarData)
hist(CarData$speed.of.car)
hist(CarData$distance.of.car)
plot(CarData$speed.of.car, CarData$distance.of.car)
qqnorm(CarData$speed.of.car)
qqnorm(CarData$distance.of.car)

## Clean data
CarData$name.of.car<-as.factor(CarData$name.of.car) # change car type from string to categorical
summary(CarData) #verify data type change
names(CarData)<-c("Name", "Speed", "Distance") #rename columns
is.na(CarData) #no NA values shown in summary, verify with is.na search

## Set up regression model
set.seed(123)
trainSize<- round(nrow(CarData)*0.7)
testSize<- nrow(CarData)-trainSize
training_indices<- sample(seq_len(nrow(CarData)),size= trainSize)
trainSet<- CarData[training_indices,]
testSet<- CarData[-training_indices,]
LinRegMod<- lm(Distance ~ Speed, trainSet) 

## Results
summary(LinRegMod)
plot(LinRegMod)
DistPred<- predict(LinRegMod, testSet)
DistPred
