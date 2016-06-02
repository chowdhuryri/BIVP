library(shiny)
library(rgl)
library(shinyRGL)
library(rglwidget)

shinyUI(pageWithSidebar(
      headerPanel("Bivariate Poisson Probability Calculation"),
      sidebarPanel(("Select Outcome and Parameter Values"),
            sliderInput('y1','Y1 value',2,min=0,max=25,step = 1),
            sliderInput('y2','Y2 value',2,min=0,max=25,step = 1),
            sliderInput('l1','Lambda_1',.1,min=.01,max=10,step = .01),
            sliderInput('l2','Lambda_2',.1,min=.01,max=10,step = .01),
            tags$style("body{background-color:linen;color:black}"),
            tags$style(".col-sm-12{font-style: oblique;border-style: solid}"),
            tags$style(".col-sm-4{font-style: oblique;border-style: solid}"),
            tags$style(".col-sm-8{font-style: oblique;border-style: solid}")
      ),
      
      mainPanel(
        tabsetPanel(type="tab",
                    tabPanel("Joint Probability",tableOutput("matrix")),
                    tabPanel("Density Plot",webGLOutput("myWebGL")),
                    tabPanel("About",includeMarkdown("bivp.Rmd")),
                    tabPanel("Mathematical form",uiOutput('ex1'))
                    )
      )

))