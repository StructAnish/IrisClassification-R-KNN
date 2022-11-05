data(iris)
str(iris)
summary(iris)

set.seed(1234)
head(iris)
random <- runif(150)
iris_random <- iris[order(random),]
head(iris_random)

normal <- function(x) (
  return( ((x - min(x)) /(max(x)-min(x))) )
)
normal(1:5)
iris_new <- as.data.frame(lapply(iris_random[,-5], normal))
summary(iris_new)

train <- iris_new[1:130,]
test <- iris_new[131:150,]
train_sp <- iris_random[1:130,5]
test_sp <- iris_random[131:150,5]


library(class)
model <- knn(train= train,test=test, ,cl= train_sp,k=13)
table(factor(model))
table(test_sp,model)

library(ggplot2)
print(ggplot(aes(Sepal.Length, Petal.Width), data = iris_random)+ geom_point(aes(color= factor(Species))))