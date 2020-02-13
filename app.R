#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(DT)



ui <- fluidPage(
  titlePanel("Iris"),
  
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.dataset === "Plot"',
        helpText("Change the variables"),
        
        selectInput("varX", 
                    label = "Select the variables X",
                    choices = sort(names(iris)) [names(iris) != "Species"] ,
                    selected = "Sepal.Length"),
        
        selectInput("varY", 
                    label = "Select the variables Y",
                    choices = c("Sepal.Length", 
                                "Sepal.Width",
                                "Petal.Length", 
                                "Petal.Width"),
                    selected = "Sepal.Width"),
        
        selectInput("filter", 
                    label = "Filter",
                    choices = sort(names(iris)) [names(iris) != "Species"] ,
                    selected = "Sepal.Length"),
        
        sliderInput("range", 
                    label = "Range of interest:",
                    min = 0, max = 10, value = c(0, 10)),
        
        actionButton("update", "Update")
      ),
      
      conditionalPanel(
        'input.dataset === "Table"',
        helpText("Display 5 records by default."),
        checkboxGroupInput("show_varsIris", "Columns in iris to show:",
                           names(iris), selected = names(iris))
      ),
      
      conditionalPanel(
        'input.dataset === "Calcul"',
        selectInput("calcul", 
                    label = "Select the variable to calculate an average.",
                    choices = sort(names(iris)) [names(iris) != "Species"] ,
                    selected = "Sepal.Length")
      ),
      
      conditionalPanel(
        'input.dataset === "Filter Species"',
        
        
        selectInput("TestSpecies", 
                    label = "Select the species",
                    choices = c("Setosa" ="setosa", 
                                "Versicolor" ="versicolor",
                                "Virginica" = "virginica", 
                                "All"
                    ),
                    selected = "All")
      )
      
      
      
    ),
    
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel("Plot",  plotOutput("Plot1")),
        tabPanel("Table", DT::dataTableOutput("mytable")),
        tabPanel("Calcul", textOutput("selected_var")),
        tabPanel("Filter Species", DT::dataTableOutput("tableTest")),
        
        
        textOutput("selected_var"),
        textOutput("min_max")
        # plotOutput("Plot1")
        
      )
      
    )
  )
)



server <- function(input, output) {
  
  #average calcul
  output$selected_var <- renderText({ 
    paste("Average of", input$calcul, "is : ", mean(iris[[input$calcul]]))
    #mean(iris$Sepal.Length)
  })
  
  #slider
  output$min_max <- renderText({ 
    paste("You have chosen a range that goes from",
          input$range[1], "to", input$range[2])
  })
  
  #update button
  updateAll <- eventReactive(input$update, {
    iris <- iris[(iris[[input$filter]] >= input$range[1])  & (iris[[input$filter]] <= input$range[2]) ,]
    
    plot(iris[[input$varX]] , iris[[input$varY]], col = iris$Species ,
         xlab = input$varX,
         ylab = input$varY,
         
         main = "my super plot")
  })
  #output for onlet Plot
  output$Plot1 <- renderPlot({
    
    updateAll()
    
    
  })
  
  #drop the collumns in the datatable
  output$mytable <- DT::renderDataTable({
    DT::datatable(iris[, input$show_varsIris, drop = FALSE], options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
  })
  
  #Filter Species 
  output$tableTest <- DT::renderDataTable({
    if(input$TestSpecies == "All"){
      iris
    }
    else{
      iris[iris$Species == input$TestSpecies,]
    }
  })
  
  
}

shinyApp(ui, server)
