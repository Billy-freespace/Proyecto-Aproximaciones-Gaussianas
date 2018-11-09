# ui.R

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  
  
  # Application title
  
  titlePanel("Aproximación de distribuciones"),
  
  navbarPage(" ",
             tabPanel("Introducción",
                      sidebarLayout(
                        sidebarPanel(h3("Objetivo:"),
                                     h5("Esta aplicación muestra gráficamente la aproximación
                                        de una distribución candidata a otra distribución
                                        a medida que se modifican los parámetros
                                        de la distribución candidata."),
                                     h5("En las pestañas de la parte superior están las diferentes aproximaciones."),
                                     br(),
                                     p("App creada por el Semillero de R de la Universidad Nacional de Colombia.
                                       Modificada por el grupo estudiantil de Estadística de la UNI (Perú)"),
                                     img(src="https://raw.githubusercontent.com/Guillermo-Borjas/Proyecto-Metodo-Montecarlo/master/1200px-UNI.svg.png",
                                         height = 100, width = 40),
                                     tags$a(href="https://srunal.wordpress.com/", "Reference")),
                        
                        mainPanel(
                          h2("Casos"),
                          h4("Aproximación 1, de la binomial a la normal"),
                          h4("Aproximación 2, de la Poisson a la normal"),
                          h4("Aproximación 3, de la binomial a la Poisson")
                          
                          
                        )
                        )
                      ),
             
             
             tabPanel("Aproximación 1",
                      sidebarLayout(
                        sidebarPanel(
                          h4('Ingrese los parámetros de la binomial'),
                          br(),
                          sliderInput("n",
                                      "Número de ensayos n",
                                      min = 5,
                                      max = 100,
                                      value = 10,
                                      step = 1, animate=TRUE),
                          
                          sliderInput("p",
                                      "Probabilidad de éxito p",
                                      min = 0,
                                      max = 1,
                                      value = 0.84,
                                      step = 0.01, animate=TRUE),
                          p("Nota: puede dar clic en el triángulo para obtener una animación.")
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(h2("Aproximación de la binomial a la normal"),
                                  tabsetPanel(tabPanel("Gráfica", plotOutput("Grafica1")),
                                              tabPanel("Descripción",
                                                       p(""))
                                              
                                  )
                                  
                        )
                      )
             ),
             
             
             tabPanel("Aproximación 2",
                      sidebarLayout(
                        sidebarPanel(
                          h4('Ingrese el parámetro de la Poisson'),
                          br(),
                          sliderInput("l",
                                      HTML("Tasa promedio &lambda;"),
                                      min = 1,
                                      max = 200,
                                      value = 2,
                                      step = 1, animate=TRUE),
                          p("Nota: puede dar clic en el triángulo para obtener una animación.")
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(h2("Aproximación de la Poisson a la normal"),
                                  tabsetPanel(tabPanel("Gráfica", plotOutput("Grafica2")),
                                              tabPanel("Descripción",
                                                       p("Para el caso de la Distribución de Poisson, 
                                                         cuando λ≥10, la forma de esta distribución se 
                                                         asemeja lo suficiente a la Distribución Normal 
                                                         como para que puede utilizarse ésta última como 
                                                         aproximación."),
                                                       br(),
                                                       HTML("Como ya se había dicho anteriormente para realizar
                                                         la aproximación debe considerarse que la distribución
                                                         Normal tendrá E(X) = &lambda; y &sigma; = &lambda;^(1/2)")))
                                  
                        )
                      )
             ),
             tabPanel("Aproximación 3",
                      sidebarLayout(
                        sidebarPanel(
                          h4('Ingrese los parámetros de la binomial'),
                          br(),
                          sliderInput("n2",
                                      "Número de ensayos n",
                                      min = 5,
                                      max = 150,
                                      value = 5,
                                      step = 1, animate=TRUE),
                          
                          sliderInput("p2",
                                      "Probabilidad de éxito p",
                                      min = 0,
                                      max = 1,
                                      value = 0.9,
                                      step = 0.01, animate=TRUE),
                          p("Nota: puede dar clic en el triángulo para obtener una animación.")
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(h2("Aproximación de la binomial a la Poisson"),
                                  tabsetPanel(tabPanel("Gráfica", plotOutput("Grafica3"))
                                  )))
                      
             )
          )
             
      )
  
)

