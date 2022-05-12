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
