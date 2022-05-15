Test Package texmex
================
Mongi Nouira

<p align="center">

</p>

## Marginal GPD Model Fit

### Summary

<p align="center">

    ##                  Market Communication.Services Technology Industrial Materials
    ## Threshold          1.22                   1.38      1.645       1.38      1.57
    ## P(X < threshold)   0.90                   0.90      0.900       0.90      0.90
    ## sigma              0.85                   0.99      1.069       0.95      1.05
    ## xi                 0.19                   0.14      0.074       0.17      0.16
    ## Upper end point     Inf                    Inf        Inf        Inf       Inf
    ##                  Consumer.Discretionary Financial Health.Care Consumer.Staples
    ## Threshold                          1.45      1.67        1.14             0.92
    ## P(X < threshold)                   0.90      0.90        0.90             0.90
    ## sigma                              0.90      1.15        0.74             0.55
    ## xi                                 0.15      0.32        0.17             0.23
    ## Upper end point                     Inf       Inf         Inf              Inf
    ##                  Utilities Real.Estate Energy
    ## Threshold             1.25        1.59   1.85
    ## P(X < threshold)      0.90        0.90   0.90
    ## sigma                 0.73        1.07   1.09
    ## xi                    0.27        0.42   0.22
    ## Upper end point        Inf         Inf    Inf

</p>

### Diagnostic

Done in EDA section.

## Dependence Model Fit

### Summary

<p align="center">

    ## Conditioning on Market variable.
    ## Thresholding quantiles for transformed data: dqu = 0.8
    ## Using laplace margins for dependence estimation.
    ## Constrained estimation of dependence parameters using v = 10 .
    ## Log-likelihood = -1311 -1121 -907 -1134 -978 -1070 -1217 -1309 -1430 -1376 -1355 
    ## 
    ## Dependence structure parameter estimates:
    ##   Communication.Services Technology Industrial Materials Consumer.Discretionary
    ## a                   0.47       0.12       0.50      0.60                   0.25
    ## b                   0.39       0.57       0.48      0.37                   0.59
    ##   Financial Health.Care Consumer.Staples Utilities Real.Estate Energy
    ## a      0.65        0.43             0.45      0.71        0.50   0.50
    ## b      0.32        0.43             0.38      0.28        0.39   0.35

</p>

### Diagnostic

<p align="center">

<img src="cache/texmex/unnamed-chunk-6-1.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-2.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-3.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-4.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-5.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-6.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-7.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-8.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-9.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-10.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-6-11.png" style="display: block; margin: auto;" />

</p>

### Dependence Model Threshold Selection

<p align="center">

</p>

<p align="center">

    ## mexRangeFit run time: 443.073 sec elapsed

</p>

<p align="center">

<img src="cache/texmex/unnamed-chunk-9-1.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-9-2.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-9-3.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-9-4.png" style="display: block; margin: auto;" />

</p>

### Dependence Model 2

<p align="center">

<img src="cache/texmex/unnamed-chunk-10-1.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-2.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-3.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-4.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-5.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-6.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-7.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-8.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-9.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-10.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-10-11.png" style="display: block; margin: auto;" />

</p>

<p align="center">

    ## Conditioning on Market variable.
    ## Thresholding quantiles for transformed data: dqu = 0.75
    ## Using laplace margins for dependence estimation.
    ## Constrained estimation of dependence parameters using v = 10 .
    ## Log-likelihood = -1567 -1279 -978 -1303 -1061 -1231 -1392 -1556 -1709 -1624 -1595 
    ## 
    ## Dependence structure parameter estimates:
    ##   Communication.Services Technology Industrial Materials Consumer.Discretionary
    ## a                   0.77      0.862      0.968      0.88                  0.933
    ## b                   0.17      0.088      0.051      0.16                  0.098
    ##   Financial Health.Care Consumer.Staples Utilities Real.Estate Energy
    ## a      0.89        0.81             0.77      0.65        0.71   0.80
    ## b      0.14        0.20             0.18      0.31        0.20   0.18

</p>

<p align="center">

<img src="cache/texmex/unnamed-chunk-12-1.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-2.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-3.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-4.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-5.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-6.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-7.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-8.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-9.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-10.png" style="display: block; margin: auto;" /><img src="cache/texmex/unnamed-chunk-12-11.png" style="display: block; margin: auto;" />

</p>

<p align="center">

    ## predict.mex(object = cmod, pqu = 0.9, nsim = nrow(ll))
    ## 
    ## Conditioned on Market being above its 90th percentile.
    ## 
    ## 
    ## Conditional Mean and Quantiles:
    ## 
    ##      Market|Market>Q90 Communication.Services|Market>Q90 Technology|Market>Q90
    ## mean               2.3                              1.93                  2.48
    ## 5%                 1.3                              0.42                  0.85
    ## 50%                1.9                              1.61                  2.20
    ## 95%                4.6                              4.53                  4.99
    ##      Industrial|Market>Q90 Materials|Market>Q90
    ## mean                  2.34                 2.44
    ## 5%                    0.93                 0.76
    ## 50%                   1.99                 2.12
    ## 95%                   5.00                 5.12
    ##      Consumer.Discretionary|Market>Q90 Financial|Market>Q90
    ## mean                              2.30                 2.93
    ## 5%                                0.86                 0.85
    ## 50%                               2.01                 2.28
    ## 95%                               4.65                 7.01
    ##      Health.Care|Market>Q90 Consumer.Staples|Market>Q90 Utilities|Market>Q90
    ## mean                   1.67                        1.31                 1.54
    ## 5%                     0.43                        0.27                 0.18
    ## 50%                    1.45                        1.13                 1.22
    ## 95%                    3.64                        2.88                 3.92
    ##      Real.Estate|Market>Q90 Energy|Market>Q90
    ## mean                   2.42               2.5
    ## 5%                     0.35               0.5
    ## 50%                    1.77               2.1
    ## 95%                    6.55               5.9
    ## 
    ## Conditional probability of threshold exceedance:
    ## 
    ##  P(Market>1.22412|Market>Q90) P(Communication.Services>1.38083|Market>Q90)
    ##                             1                                         0.59
    ##  P(Technology>1.64517|Market>Q90) P(Industrial>1.37699|Market>Q90)
    ##                              0.74                             0.79
    ##  P(Materials>1.5741|Market>Q90) P(Consumer.Discretionary>1.44643|Market>Q90)
    ##                            0.71                                         0.78
    ##  P(Financial>1.67156|Market>Q90) P(Health.Care>1.13911|Market>Q90)
    ##                             0.73                              0.67
    ##  P(Consumer.Staples>0.922603|Market>Q90) P(Utilities>1.25301|Market>Q90)
    ##                                     0.63                            0.49
    ##  P(Real.Estate>1.59122|Market>Q90) P(Energy>1.8516|Market>Q90)
    ##                               0.56                        0.58

</p>

<p align="center">

<img src="cache/texmex/unnamed-chunk-14-1.png" style="display: block; margin: auto;" />

</p>
