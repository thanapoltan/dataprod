library(SASxport)
library(caret)
load("diabmodel.RData")
## diabmodel.RData come from my R script "diab.R", it's the logistic regression model built on National Center for Health Statistics data (http://wwwn.cdc.gov/nchs/nhanes/search/nhanes11_12.aspx).

shinyServer(function(input, output) {
                output$bmi <- renderText({
                        paste("Your BMI: ", input$wt/(input$ht/100.0)^2)  
                })
                output$result <- renderText({
                        input$calButton
                        isolate(dataInput <- data.frame(age=input$age,race=as.factor(input$race),gender=as.factor(input$gender),wt=input$wt,ht=input$ht,waist=input$waist))
                        isolate(paste("Diabetes Risk Level: ", predict(logit2, dataInput)[1]))
                })
                
                
        }
)