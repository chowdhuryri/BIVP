# <center> Bivariate Poisson PDF: A Shiny App <center>
### <center> Rafiqul Chowdhury <center>

**Overview**

The bivariate Poisson models have emerged to address a wide range of 
applications in various fields where paired count data are correlated. 
Leiter and Hamadan (1973) suggested bivariate probability models applicable 
to traffic accidents and fatalities. The bivariate Poisson distribution has 
been developed following various assumptions. Among those, the most 
comprehensive one has been proposed by Kocherlakota and Kocherlakota (1992). 
Islam and Chowdhury (2015) proposed bivariate Poisson model for covariate 
dependence based on the extended generalized linear model.

In practice, we may not observe the full range of outcomes as the theoretical 
range of outcomes has no upper limits. This right truncation may occur for 
both the variables due to restrictions in the definition of the outcome 
variables. Therefore, the total probability may not sum to one. 

A shiny application is developed to compute the probability of both events
based on different ranges of two outcomes and corresponding parameter values.
This shiny application also, produce plot of bivariate Poisson PDF.

**The Bivariate Poisson-Poisson Model**

Consider, $\Y_1$  be the number of occurrences of the first event in a given interval follow Poisson distribution with parameter $\lambda_1$  and the probability of the second event,   $\Y_2$, for given   $\Y_1$, where  $\Y_2 = Y_{21} + ... + Y_{2{y_1}}$, be Poisson with parameter,  $\lambda _1 y_1$. The joint pdf of  $\Y_1$ and  $\Y_2$ is shown as

