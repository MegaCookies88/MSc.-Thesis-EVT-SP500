GPD Univariate/Bivariate - EDA
================
Mongi Nouira

Using the univariate Generalized Pareto Distribution for EDA (Threshold
selection, Frechet Scale, …). The time series correspond to log daily
losses. We focus on the Technology sector.

<p align="center">

</p>

## Technology Sector

<p align="center">

<div class="figure" style="text-align: center">

<img src="GPD_univariate_files/figure-gfm/unnamed-chunk-6-1.png" alt="Mean Residual Life Plot"  />

<p class="caption">

Mean Residual Life Plot

</p>

</div>

</p>

<p align="center">

<div class="figure" style="text-align: center">

<img src="GPD_univariate_files/figure-gfm/unnamed-chunk-7-1.png" alt="Parameters vs Threshold"  />

<p class="caption">

Parameters vs Threshold

</p>

</div>

</p>

<p align="center">

    ## $threshold
    ## [1] 5
    ## 
    ## $nexc
    ## [1] 24
    ## 
    ## $conv
    ## [1] 0
    ## 
    ## $nllh
    ## [1] 36.43958
    ## 
    ## $mle
    ## [1] 1.2279738 0.3128952
    ## 
    ## $rate
    ## [1] 0.004757185
    ## 
    ## $se
    ## [1] 0.4311193 0.2926481

<div class="figure" style="text-align: center">

<img src="GPD_univariate_files/figure-gfm/unnamed-chunk-8-1.png" alt="Fitted GPD With Threshold u=5 Diagnostic"  />

<p class="caption">

Fitted GPD With Threshold u=5 Diagnostic

</p>

</div>

</p>

## Bivariate EDA

<p align="center">

<div class="figure" style="text-align: center">

<img src="GPD_univariate_files/figure-gfm/unnamed-chunk-9-1.png" alt="Technology/Energy Pair - 95% Marginal Quantiles"  />

<p class="caption">

Technology/Energy Pair - 95% Marginal Quantiles

</p>

</div>

</p>

<p align="center">

<div class="figure" style="text-align: center">

<img src="GPD_univariate_files/figure-gfm/unnamed-chunk-10-1.png" alt="Technology/Energy Pair - 95% Marginal Quantiles - Frechet Scale"  />

<p class="caption">

Technology/Energy Pair - 95% Marginal Quantiles - Frechet Scale

</p>

</div>

</p>

<p align="center">

<img src="GPD_univariate_files/figure-gfm/unnamed-chunk-11-1.png" style="display: block; margin: auto;" /><img src="GPD_univariate_files/figure-gfm/unnamed-chunk-11-2.png" style="display: block; margin: auto;" />

</p>

<p align="center">

<img src="GPD_univariate_files/figure-gfm/unnamed-chunk-12-1.png" style="display: block; margin: auto;" />

</p>
