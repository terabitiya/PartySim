library(shinythemes)

fluidPage(theme = shinytheme("united"),

       titlePanel("Simulations with Consideration Set"),
       sidebarLayout(
           sidebarPanel(
              h2("All Parties"),
               checkboxGroupInput("cons_set",
                                  label = "Choose a Consideration Set",
                                  choices = list("Just Russia"=1,
                                  "LDPR"=2,
                                  "CPRF"=3,
                                  "Yabloko"=4,
                                  "United Russia"=5,
                                  "Right Cause"=6),
                                  selected = list(1,2,3,4,5,6)),
              br(),
              h2("One Party"),
               selectInput("party", 
                           label = "Choose a party to display",
                           choices = list("Just Russia"=1,
                                          "LDPR"=2,
                                          "CPRF"=3,
                                          "Yabloko"=4,
                                          "United Russia"=5,
                                          "Right Cause"=6),
                           selected = 1),
             
              fluidRow(
                 
                 column(5, 
                        checkboxGroupInput("cons_set1",
                                           label = "Consideration Set 1",
                                           choices = list("Just Russia"=1,
                                                          "LDPR"=2,
                                                          "CPRF"=3,
                                                          "Yabloko"=4,
                                                          "United Russia"=5,
                                                          "Right Cause"=6),
                                           selected = list(1,2))
                        ),
                 column(5,
                        checkboxGroupInput("cons_set2",
                                           label = "Consideration Set 2",
                                           choices = list("Just Russia"=1,
                                                          "LDPR"=2,
                                                          "CPRF"=3,
                                                          "Yabloko"=4,
                                                          "United Russia"=5,
                                                          "Right Cause"=6),
                                           selected = list(1,2,3))
                 )
                 ),
                        
              fluidRow(
                 
                 column(5, 
                        checkboxGroupInput("cons_set3",
                                           label = "Consideration Set 3",
                                           choices = list("Just Russia"=1,
                                                          "LDPR"=2,
                                                          "CPRF"=3,
                                                          "Yabloko"=4,
                                                          "United Russia"=5,
                                                          "Right Cause"=6),
                                           selected = list(1,2,3,4))
                 ),
                 column(5,
                        checkboxGroupInput("cons_set4",
                                           label = "Consideration Set 4",
                                           choices = list("Just Russia"=1,
                                                          "LDPR"=2,
                                                          "CPRF"=3,
                                                          "Yabloko"=4,
                                                          "United Russia"=5,
                                                          "Right Cause"=6),
                                           selected = list(1,2,3,4,5,6))
                 )
              ),
               submitButton("Submit"),width=3),
           
           
           mainPanel(
              tabsetPanel(type = "tabs",
                          tabPanel("All Parties", 
                                   fluidRow(
                                      column(6, plotOutput("Plot1_1")),
                                      column(6, plotOutput("Plot1_2"))),
                                   fluidRow(
                                      column(6, plotOutput("Plot1_3")),
                                      column(6, plotOutput("Plot1_4"))),
                                   fluidRow(
                                      column(6, plotOutput("Plot1_5")),
                                      column(6, plotOutput("Plot1_6"))),
                                   fluidRow(
                                      column(6, plotOutput("Plot1_7")))
                          ),
                         tabPanel("One Party",
                               h4("These graphs show how the change in the choice set composition influences the probability to choose a certain party on each issue dimension.", align="left") ,
                               h4("The party should be selected in the left menu (here, the default party is Just Russia). Besides, you can create four or fewer consideration sets with the selected party. After that, press the button Submit to get results.", align = "left"),  
                                fluidRow(column(8, plotOutput("Plot2_1"))),
                                fluidRow(column(8, plotOutput("Plot2_2"))),
                                fluidRow(column(8, plotOutput("Plot2_3"))),
                                fluidRow(column(8, plotOutput("Plot2_6"))),
                                fluidRow(column(8, plotOutput("Plot2_5"))),
                                fluidRow(column(8, plotOutput("Plot2_4"))),
                                fluidRow(column(8, plotOutput("Plot2_7")))
                                # fluidRow(
                                #   column(6, plotOutput("Plot2_1")),
                                #    column(6, plotOutput("Plot2_2"))),
                                 # fluidRow(
                                 #    column(6, plotOutput("Plot2_3")),
                                 #    column(6, plotOutput("Plot2_4"))),
                                 # fluidRow(
                                 #    column(6, plotOutput("Plot2_5")),
                                 #    column(6, plotOutput("Plot2_6"))),
                                 # fluidRow(
                                 #    column(6, plotOutput("Plot2_7")))
                          )
              )
   )))
