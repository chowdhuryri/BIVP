library(shiny)
library(rgl)
library(shinyRGL)
library(rglwidget)

probcal<-function(y1,y2,l1,l2){
      mymat<-matrix(0,y1+1,y2+1)
      for (i in 0:y1){
            for (j in 0:y2){
            mymat[i,j]<-(exp(-l1)*l1^i/factorial(i)) * (exp(-l2*i)*(l2*i)^j/factorial(j))
            }
      }
      
      colnames(mymat)<-c(0:y2)
      rownames(mymat)<-c(0:y1)
      mymat<-cbind(mymat,Total=apply(mymat,1,sum))
      mymat<-rbind(mymat,Total=apply(mymat,2,sum))
      mymat
}

shinyServer(
      function(input, output){

            matrix1<-reactive({probcal(input$y1,input$y2,input$l1,input$l2)})
           
            output$matrix <- renderTable({
                  matrix1()
            })
            
            output$myWebGL <- renderWebGL({
                  m1 <- matrix1()
                  m1 <- m1[1:(nrow(m1)-1),1:(ncol(m1)-1)]
                  mylist<-list(x=0:input$y1,y=0:input$y2,z=m1)
                  col1 <- rainbow(length(mylist$z))[rank(mylist$z)]
                  open3d()
                  persp3d(x=mylist, xlab = "Y1", ylab = "Y2", zlab = "Probability",
                          col = col1,forceClipregion = TRUE)
            })
            
            output$ex1 <- renderUI({
              withMathJax(
                    helpText('The bivariate Poisson pdf is: 
                              $$g(y_1,y_2)=\\frac{e^{-\\lambda_1} 
                              \\lambda_1^{y_1} e^{-\\lambda_2 y_1}
                              {(\\lambda_2 y_1)}^{y_2}}{y_1! y_2!},$$'),
                    helpText('where, $$y_1 =0,1,...; y_2=0,1,...;
                             \\lambda_1, \\lambda_2 > 0.$$')      
                          )
            })

         }
)