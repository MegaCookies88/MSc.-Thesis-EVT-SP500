GPD Univariate/Bivariate - EDA
================
Mongi Nouira

Using the univariate Generalized Pareto Distribution for EDA (Threshold
selection, Frechet Scale, …). The time series correspond to log daily
losses. We focus on the Technology sector.

<p align="center">

</p>

## Technology Sector

First, we look at the mean residual life plot with 95% confidence
intervals. It is initially linear the shows curvature between -1 and 5
then is reasonably linear relatively to confidence intervals. This may
suggest that a loss of 5% is a good threshold. However, there are only
24 exceedances in the data of 5045 observations. The threshold of 2%
seems more appropriate with 367 exceedances.

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

</p>

Second, we look at the stability of GPD parameters when changing the
threshold. The selected threshold of 2 seems reasonable.

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-4-1.png" style="display: block; margin: auto;" />

</p>

Finally, we fit the GPD with threshold u=2. It is summarized as
following :

<p align="center">

    ## $threshold
    ## [1] 2
    ## 
    ## $nexc
    ## [1] 369
    ## 
    ## $conv
    ## [1] 0
    ## 
    ## $nllh
    ## [1] 425.9481
    ## 
    ## $mle
    ## [1] 1.0740668 0.0828456
    ## 
    ## $rate
    ## [1] 0.07288169
    ## 
    ## $se
    ## [1] 0.07801314 0.05084159

</p>

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-6-1.png" style="display: block; margin: auto;" />

</p>

## Comparing GPD parameters by sector

<p align="center">

</p>

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-8-1.png" style="display: block; margin: auto;" />

</p>

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

</p>

## Bivariate EDA : Technology/Energy

In this section, we are interested in the asymptotic dependence between
the technology and energy sectors.

First, we look at the scatter plots of the two sectors and the
corresponding 95% marginal quantiles. We can also do the same plot after
transformation to the Frechet scale and using the logarithmic scale for
the axis.

  - Left Figure : Plot of positive losses only.
  - Right Figure : Transformation to Frechet scale and using logarithmic
    scale using GPD with threshold 2. Only the exceedances are plotted.
  - Red Line : 95% marginal quantiles of losses.
  - Green Line : x+y=5 (Original and Transformed to Frechet scale).

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-10-1.png" style="display: block; margin: auto;" />

</p>

Second, we look at the chi plots with 95% confidence intervals. The
interpretation is not simple because the confidence intervals are large
i.e. a high variance of the estimators but it seems that
\(\bar\chi(q) \rightarrow 1\) when \(q \rightarrow 1\) with a value
around 0.65. This supports the asymptotic dependence between the two
sectors.

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-11-1.png" style="display: block; margin: auto;" />

</p>

Another approach is to fit a univariate GPD model to the variable
\(T=\min{\{X_1,X_2\}}\) then the shape parameter provides an estimation
of the coefficient of tail dependence \(\eta\).

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-12-1.png" style="display: block; margin: auto;" />

</p>

Finally, we fit the logistic bivariate extreme value distribution for
the exceedances over the threshold. We use the function “evd::fbvpot”
and specifying the threshold u=2. Maximum-likelihood Fitting of
Bivariate Extreme Value Distributions to Threshold Exceedances.

<p align="center">

<img src="cache/GPD_EDA/unnamed-chunk-13-1.png" style="display: block; margin: auto;" />

</p>
