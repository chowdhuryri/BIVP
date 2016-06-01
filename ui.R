library(shiny)
shinyUI(pageWithSidebar(
      headerPanel("Bivariate Poisson Probability Calculation"),
      sidebarPanel(
            sliderInput('y1','Y1 value',2,min=0,max=25,step = 1),
            sliderInput('y2','Y2 value',2,min=0,max=25,step = 1),
            sliderInput('l1','Lambda_1',.1,min=.01,max=10,step = .01),
            sliderInput('l2','Lambda_2',.1,min=.01,max=10,step = .01)
      ),
      mainPanel(
        tabsetPanel(type="tab",
                    tabPanel("Joint Probability",tableOutput("matrix")),
                    tabPanel("Plot",plotOutput("mypdf")))
      )
))