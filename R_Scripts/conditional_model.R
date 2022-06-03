## Multivariate Conditional On Market Model

library("texmex")

options(digits=2)
set.seed(20130619)

# Color Map
c1 = "#636EFA"
c2 = "#EF553B"
c3 = "#00CC96"
c = c(c1,c2,c3)

# Data
df = read.csv("~/Documents/GitHub/PDM_2022/data/data1.csv")
ll = -100*sapply(df[seq(2,ncol(df))], function(x) log(x[-1])-log(x[-length(df$Date)]))
ll = apply(ll, c(1,2), function(x) max(x,0))
ll = data.frame(ll)

# Sectors
sectors = sapply(colnames(ll)[1:12], function(x) substring(x,5))
sectors = as.vector(sectors)
colnames(ll) = sectors

### Model ###

# Marginal model
marg <- migpd(ll, mth=2, penalty="none", family=gpd) 

# Initial values
start = matrix(
  c(0.5,0.2, 
    0.1,0.2, 
    0.5,0.2,
    0.6,0.2,
    0.6,0.2,
    0.6,0.2,
    0.4,0.2,
    0.6,0.2,
    0.5,0.2,
    0.5,0.2,
    0.5,0.2),
  nrow=2, ncol=11, byrow=F
)

# Market quantile selection
mrf <- mexRangeFit(
  marg, which="Market", margins="laplace", constrain=TRUE, start=start, 
  quantiles=c(0.8,0.85,0.9,0.95), trace=11
)

pdf(file = "~/Documents/GitHub/PDM_2022/figures/cmod_mqu.pdf")
par(mfrow=c(3,2))
plot(mrf, lwd=2, cex=0.2)
dev.off()

# Dependence model - mqu=0.95 - diagnostic
cmod <- mexDependence(
  marg, which="Market", dqu=0.95, margins="laplace", start=start,
  PlotLikDo=T, PlotLikRange=list(a=c(0,1),b=c(-1,1))
)

pdf(file = "~/Documents/GitHub/PDM_2022/figures/cmod_diag.pdf")
par(pty="s", mfrow=c(3,3), mar=c(0,0,0,0), oma=c(4,4,4,4), xaxt="n", yaxt="n")
plot(cmod, lwd=2, cex=0.2)
dev.off()

# Dependence model parameters
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/cmod_params.jpeg",
  width = 1e3, height = 1e3, quality = 100, res = 100
)

par(pty="s")
dqu = c(0.8,0.9,0.95)
for (i in c(1,2,3)) {
  cmod <- mexDependence(
    marg, which="Market", dqu=dqu[i], margins="laplace", start=start, PlotLikDo=F
  )
  params = cmod$dependence$coefficients[1:2,]
  if (i==1) {
    plot(t(params), col=c[i], cex=1.5, lwd=2, 
         cex.axis=1.5, pch=seq(0,10), type="p",
         xlim=c(0.6,1.1), ylim=c(-0.4,0.4), xlab="alpha", ylab="beta")
  } else {
    lines(t(params), col=c[i], cex=1.5, lwd=2, 
          cex.axis=1.5, pch=seq(0,10), type="p")
  }
}
#text(t(params), colnames(params), pos=4, offset=1, cex=1)
grid()
legend(
  "topright", legend=c("q=0.8","q=0.9","q=0.95"), 
  fill=c, border="black", cex=1, bg="white"
)
legend(
  "bottomleft", legend=sectors[2:12], pch=seq(0,10), cex=1, bg="white"
)
dev.off()
