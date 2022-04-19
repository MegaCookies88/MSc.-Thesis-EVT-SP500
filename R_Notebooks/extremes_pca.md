Multivariate Tail Dependence Decomposition
================
Mongi Nouira

We propose a decomposition which help to summarize and describe
multivariate tail dependence. It can be seen as an adaptation of PCA to
the extremes.

<p align="center">

</p>

## Data Transformation

1.  Keep only positive losses.
2.  Apply bijection x-\>log(1+exp(x)).
3.  Scale variables using empirical/gpd mixture to Frechet scale
    transformation.

The last two transformations are required by the framework. In
particular, the tail index needs to be 2.

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-3-1.png" style="display: block; margin: auto;" />

</p>

<p align="center">

</p>

<p align="center">

</p>

<p align="center">

    ## [1] "---"

</p>

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-7-1.png" style="display: block; margin: auto;" />

</p>

## Tail Pairwise Dependence Matrix

<p align="center">

</p>

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

</p>

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-10-1.png" style="display: block; margin: auto;" />

</p>

## Eigen Decomposition

<p align="center">

</p>

### Eigen Values

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-12-1.png" style="display: block; margin: auto;" />

</p>

### Eigen Vectors

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-13-1.png" style="display: block; margin: auto;" />

</p>

## Principal Components Time Series

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-14-1.png" style="display: block; margin: auto;" />

</p>

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-15-1.png" style="display: block; margin: auto;" />

</p>

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-16-1.png" style="display: block; margin: auto;" />

</p>

<p align="center">

<img src="cache/extremes_pca/unnamed-chunk-17-1.png" style="display: block; margin: auto;" />

</p>
