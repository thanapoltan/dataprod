library(shiny)
shinyUI(fluidPage(
        titlePanel("Are you at risk for Diabetes?"),
        sidebarPanel(
                h3("Your Info.."),
                br(),
                numericInput(inputId = "age", label = "Age", step = 1, value = 25, min = 1, max = 200),
                br(),
                selectInput(inputId = "race", label = "Race", choices=c("Mexican American" = "Mexican American", "Other Hispanic" = "Other Hispanic", "White" = "White", "Black" = "Black", "Asian" = "Asian", "Other" = "Other")),
                br(),
                radioButtons(inputId = "gender", label = "Gender",choices=c("Male" = "Male", "Female" = "Female")),
                br(),
                sliderInput(inputId = "wt", label = "Weight (kg)", step = 1, value = 60, min = 1, max = 300),
                br(),
                sliderInput(inputId = "ht", label = "Height (cm)", step = 1, value = 150, min = 100, max = 300),
                br(),
                sliderInput(inputId = "waist", label = "Waist Circumference (cm)", step = 1, value = 80, min = 40, max = 200),
                br(),
                actionButton("calButton","Calculate Risk")
        ),
        
        mainPanel(
                h3("How to use?"),
                br(),
                p("1. Fill in your info on the left hand side."),
                p("2. Click 'calculate'"),
                p("3. The calculator will calculate your BMI and assess your diabetes risk."),
                h3("Result"),
                br(),
                textOutput("bmi"),
                br(),
                textOutput("result")
                )
                )

        )
