library(SASxport)
library(caret)
s1 <- read.xport("/dataprod/DEMO_G.XPT")
s2 <- read.xport("/dataprod/BMX_G.XPT")
s4 <- read.xport("/dataprod/DIQ_G.XPT")
sAll <- merge(s4,s1,by="SEQN")
sAll <- merge(sAll,s2,by="SEQN")
sel <- data.frame(age=sAll$RIDAGEYR,race=as.factor(sAll$RIDRETH3),gender=as.factor(sAll$RIAGENDR),wt=sAll$BMXWT,ht=sAll$BMXHT,waist=sAll$BMXWAIST,diab= as.factor(sAll$DIQ010))
levels(sel$race) <- c("Mexican American", "Other Hispanic", "White", "Black", "Asian", "Other")
levels(sel$gender) <- c("Male", "Female")
levels(sel$diab) <- c("High", "Low", "High", NA, NA)
sel <- sel[-(is.na(sel$diab)),]
hasNA <- which(apply(sel, 1, function(x) {sum(is.na(x))}) > 0)
sel <- sel[-hasNA,]
##trainIndex <- createDataPartition(y = sel$diab, p = 0.8, list = FALSE)
##training <- sel[trainIndex, ]
##testing <- sel[-trainIndex, ]
tc <- trainControl(method = "cv", number = 5)
logit2 <- train(diab ~ ., method = "glm", family = binomial, data=sel, trControl = tc)
save(logit2, file = "diabmodel.RData")