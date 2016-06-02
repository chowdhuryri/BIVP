---
title       : Bivariate Poisson Distribution (Marginal/Conditional Approach)
subtitle    : Reproducible Pitch Presentation- DDP Course Project
author      : Rafiqul Chowdhury
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Paired Count Data

. Correlated count data are generated from various fields. For example,

- Number of accidents and fatalities
- Number of episodes of depression and number of visits to doctors
- Number of sales of different products

. Leiter and Hamadan (1973) suggested following bivariate probability 
models.
$$g(y_1,y_2)=\frac{e^{-\lambda_1}\lambda_1^{y_1} e^{-\lambda_2 y_1}{(\lambda_2 y_1)}^{y_2}}{y_1! y_2!},\mbox{ } y_1 =0,1,...;\mbox{ } y_2=0,1,...;\mbox{ }\lambda_1, \mbox{ }\lambda_2 > 0.$$ 

. Observed data may not cover the full range as the 
theoretical range above. 

. This produces right truncation for both the variables. 

. Therefore, the total probability may not sum to one.

--- .class #id 

## Total Probability Calculation from simulated data
. Following r code chunk calculate total probability using bivariate pdf.

. In following code Y1 and Y2 values are 0 to 14 and lambda1 = 0.76 
and lambda2 = 3.5.


```r
library(slidifyLibraries)

mypdf<-function(y1,y2,l1,l2){
mymat<-matrix(0,y1+1,y2+1)
  for (i in 0:y1){
     for (j in 0:y2){mymat[i,j]<-(exp(-l1)*l1^i/factorial(i)) * (exp(-l2*i)*(l2*i)^j/factorial(j))  
            }  
  } 
mymat
}
```

--- .class #id 
## Codes

. Total probability for different combinations of Y1, Y2, lambda1 and
lambda2 values.


```r
cat("Y1 = ",y11,",","Y2 = ",y21,",","l1 = ",l11,",","l2 = ",l21,",","Total Prob. = ", sum(mypdf(y11,y21,l11,l21)),"\n")    
```

Y1 =  5 , Y2 =  5 , l1 =  2.06 , l2 =  1.19 , Total Prob. =  0.650547 

```r
cat("Y1 = ",y12,",","Y2 = ",y22,",","l1 = ",l12,",","l2 = ",l22,",","Total Prob. = ", sum(mypdf(y12,y22,l12,l22)),"\n")  
```

Y1 =  9 , Y2 =  7 , l1 =  3.94 , l2 =  0.96 , Total Prob. =  0.8121686 

```r
cat("Y1 = ",y13,",","Y2 = ",y23,",","l1 = ",l13,",","l2 = ",l23,",","Total Prob. = ", sum(mypdf(y13,y23,l13,l23)),"\n") 
```

Y1 =  15 , Y2 =  15 , l1 =  3.94 , l2 =  0.96 , Total Prob. =  0.9111765 

--- .class #id 
## Conclusions

**Conclusions:**

- Right truncation should be considered in analyzing count data.
- Adapting right truncated models would provide more refined estimates.

**References:**

Leiter RE and Hamdan MA. Some Bivariate Probability Models Applicable to 
Traffic Accidents and Fatalities. (1973), International Statistical Review,
41(1): 87-100.




