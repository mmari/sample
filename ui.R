library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Sample size calculator",
  tabPanel("Sample",                 

  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Two independent means"),
        radioButtons("alpha", label = h5("Alpha:"),
                   choices = list("0.05" = 0.05, "0.10" = 0.10), 
                   selected = 0.05),
          #numericInput("alpha.n", label = p("Other:"), value = 0.05, min=0, max=1, step=0.01),
        radioButtons("beta", label = h5("Beta:"),
                   choices = list("0.20" = 0.20, "0.15" = 0.15, "0.10"=0.10, "0.05"=0.05), 
                   selected = 0.20),
          #numericInput("beta.n", label = p("Other:"), value = 0.20, min=0, max=1, step=0.01),
        numericInput("ratio", label = h5("Group 2 size/Group 1 size ratio:"), value = 1, min=0, step=0.01),
        numericInput("s.d", label = h5("Estimated common standard deviation:"), value = 10, min=0, step=0.01),
        numericInput("dif", label = h5("Minimum expected difference:"), value=1, step=0.01),
        numericInput("dr", label = h5("Dropout rate:"), value = 0, min=0, max=1, step=0.01),
      
      submitButton("Calculate")
    
    ),
    
    
    mainPanel(
      
      hr(),
      fluidRow(h3("Description:")),
        fluidRow(h5("Alpha")),
          fluidRow("Alpha is the probability of obtaining a false positive with the statistical test. That is, it is the probability of rejecting a true null hypothesis. The null hypothesis is that the means are equal."),
      fluidRow(h5("Beta")),
          fluidRow("Beta is the probability of obtaining a false negative with the statistical test. That is, it is the probability of accepting a false null hypothesis. Power is the probability of rejecting the null hypothesis when it is false. Power is equal to 1 - Beta, so specifying beta implicitly specifies power."),
      fluidRow(h5("Group 2 size/Group 1 size ratio")),
          fluidRow("For this choice, you set a value for the ratio of Group 2 size to Group 1 size, and then this calculator determines the needed Group 1 and Group 2 size, with this ratio, to obtain the desired power. An equivalent representation of this Ratio is Group 2 size = Ratio * Group 1 size."),
      fluidRow(h5("Estimated common standard deviation")),
          fluidRow("The standard deviation entered here is the assumed standard deviation for both the Group 1 population and the Group 2 population."),
      fluidRow(h5("Minimun expected difference")),
          fluidRow("Enter a value for the assumed difference between the means of Groups 1 and 2. This difference is the difference at which the design is powered to reject equal means."),
      fluidRow(h5("Dropout rate")),
          fluidRow("Percentage of the expected number of subjects dropped out at the end of the study. For example, if you enter 0.1 the final adjusted taking into account a dropout rate of 10%."),
      hr(),
      fluidRow(h3("Result:")),
      fluidRow(uiOutput("text1")),
      #textOutput("text1")
      hr())
  )),
  
  tabPanel("About",
  mainPanel(
    fluidRow("This Shiny app provides sample size calculations for two-sided two-sample t-tests when the variances of the two groups (populations) are assumed to be equal. This is the traditional two-sample t-test (Fisher, 1925). In this procedure, the assumed difference between means is specified by entering the difference directly. The design corresponding to this test procedure is sometimes referred to as a parallel-groups design. This design is used in situations such as the comparison of the income level of two regions, the nitrogen content of two lakes, or the effectiveness of two drugs. There are several statistical tests available for the comparison of the center of two populations. This procedure is specific to the two-sample t-test assuming equal variance."))
)
))
