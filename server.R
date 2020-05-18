library(shiny)
library(shinythemes)
#setwd("/home/anastasia/Documents/Disser/application/disser_dash")
source("helpers.R")
library(ggplot2)

load("data_sim_list.RData")
load("output_cccl_lv_euc2.RData")
params <- output_lv_euc2$par

data_sim1 <- data_simulated_list[[1]]
data_sim2 <- data_simulated_list[[2]]
data_sim3 <- data_simulated_list[[3]]
data_sim4 <- data_simulated_list[[4]]
data_sim5 <- data_simulated_list[[5]]
data_sim6 <- data_simulated_list[[6]]
data_sim7 <- data_simulated_list[[7]]

p_names <- c("Just Russia","LDPR","CPRF","Yabloko","United Russia","Right Cause")


shinyServer(function(input, output) {
  
  cs_inp <- reactive({as.integer(input$cons_set)})
  
  output$Plot1_1 <- renderPlot({
    p_names_filt <- p_names[cs_inp()]
    data_sim <- data_sim1[data_sim1$party %in% cs_inp(),]
    plot_cons_set_id(data_sim,1,"Left-Right Scale",params,p_names_filt)
  })
  
  
  output$Plot1_2 <- renderPlot({
    p_names_filt <- p_names[cs_inp()]
    data_sim <- data_sim2[data_sim2$party %in% cs_inp(),]
    plot_cons_set_id(data_sim,2,"Western Countries as an Enemy",params,p_names_filt)
  })
  
  
  output$Plot1_3 <- renderPlot({
    p_names_filt <- p_names[cs_inp()]
    data_sim <- data_sim3[data_sim3$party %in% cs_inp(),]
    plot_cons_set_id(data_sim,3,"Democracy",params,p_names_filt)
  })
  
  
  output$Plot1_4 <- renderPlot({
    p_names_filt <- p_names[cs_inp()]
    data_sim <- data_sim4[data_sim4$party %in% cs_inp(),]
    plot_cons_set_id(data_sim,4,"Socialism",params,p_names_filt)
  })
  
  
  output$Plot1_5 <- renderPlot({
    p_names_filt <- p_names[cs_inp()]
    data_sim <- data_sim5[data_sim5$party %in% cs_inp(),]
    plot_cons_set_id(data_sim,5,"Market Economy",params,p_names_filt)
  })
  
  
  output$Plot1_6 <- renderPlot({
    p_names_filt <- p_names[cs_inp()]
    data_sim <- data_sim6[data_sim6$party %in% cs_inp(),]
    plot_cons_set_id(data_sim,6,"Putin's Approval",params,p_names_filt)
  })
  
  
  output$Plot1_7 <- renderPlot({
    p_names_filt <- p_names[cs_inp()]
    data_sim <- data_sim7[data_sim7$party %in% cs_inp(),]
    plot_cons_set_id(data_sim,7,"Nationalism",params,p_names_filt)
  })
  
  #ONE PARTY
  
  party_inp <- reactive({as.integer(input$party)})
  
  cons_sets_inp <- reactive({
    l <- list(as.integer(input$cons_set1),
              as.integer(input$cons_set2),
              as.integer(input$cons_set3),
              as.integer(input$cons_set4))
    l <- l[!sapply(l, function(x) all(unlist(x) == 0))]
    return(l)
  })
  
  #output$Text <- renderPrint({party_inp()})     
  
  output$Plot2_1 <- renderPlot({
    plot_cons_set_by_party(data_sim1,1,"Left-Right Scale",party_inp(),cons_sets_inp(),params)
  })
  
  
  output$Plot2_2 <- renderPlot({
    plot_cons_set_by_party(data_sim2,2,"Western Countries as an Enemy",party_inp(),cons_sets_inp(),params)
  })
  
  
  output$Plot2_3 <- renderPlot({
    plot_cons_set_by_party(data_sim3,3,"Democracy",party_inp(),cons_sets_inp(),params)
  })
  
  
  output$Plot2_4 <- renderPlot({
    plot_cons_set_by_party(data_sim4,4,"Socialism",party_inp(),cons_sets_inp(),params)
  })
  
  
  output$Plot2_5 <- renderPlot({
    plot_cons_set_by_party(data_sim5,5,"Market Economy",party_inp(),cons_sets_inp(),params)
  })
  
  
  output$Plot2_6 <- renderPlot({
    plot_cons_set_by_party(data_sim6,6,"Putin's Approval",party_inp(),cons_sets_inp(),params)
  })
  
  
  output$Plot2_7 <- renderPlot({
    plot_cons_set_by_party(data_sim7,7,"Nationalism",party_inp(),cons_sets_inp(),params)
  })
  
}
)
