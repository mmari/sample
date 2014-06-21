library(shiny)
library(samplesize)

        
shinyServer(function(input, output) {

  power <- reactive({1-as.numeric(input$beta)})
  perd <- reactive({input$dr*100})
  
  #if(input$ratio!=1){ 
    num <- reactive({n.ttest(power = power(), alpha = as.numeric(input$alpha), mean.diff = input$dif, sd1 = input$s.d, k = input$ratio, design = "unpaired", fraction = "unbalanced", variance = "equal")})
    num1 <- reactive({ceiling(num()[[2]]/(1-input$dr))})
    num2 <- reactive({ceiling(num()[[3]]/(1-input$dr))})
  #} else{
  #  num <- reactive({n.ttest(power = power(), alpha = as.numeric(input$alpha), mean.diff = input$dif, sd1 = input$s.d, design = "unpaired", fraction = "balanced", variance = "equal")})
  #  num1 <- reactive({round(num()[[2]]/(1-input$dr),0)})
  #  num2 <- reactive({round(num()[[3]]/(1-input$dr),0)})
  #} 
  

  
  #output$beta.serv <- renderPrint({num[[1]]})
  
  #output$text1 <- renderText({ 
#     paste("Accepting an alpha risk of ", input$alpha, " and a beta risk of ",input$beta," in a two-sided test, ",num1()," subjects are necessary in first group and ",num2()," in the second to recognize as statistically significant a difference greater than or equal to ",input$dif," units. The common standard deviation is assumed to be ",input$s.d,". It has been anticipated a drop-out rate of ",perd(),"%.", sep="")
 # })
  
  output$text1 <- renderUI({
  tagList("Accepting an alpha risk of ", input$alpha, " and a beta risk of ",input$beta," in a two-sided test, ",tags$strong(num1())," subjects are necessary in first group and ",tags$strong(num2())," in the second to recognize as statistically significant a difference greater than or equal to ",input$dif," units. The common standard deviation is assumed to be ",input$s.d,". It has been anticipated a drop-out rate of ",perd(),"%.")
  })


  
})
