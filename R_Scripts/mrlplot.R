## Mean Residual Life Plot

library("ismev")

# Data
df = read.csv("~/Documents/GitHub/PDM_2022/data/data1.csv")
ll = -100*sapply(df[seq(2,ncol(df))], function(x) log(x[-1])-log(x[-length(df$Date)]))
ll = data.frame(ll)

# Sectors
sectors = sapply(colnames(ll)[1:12], function(x) gsub("\\."," ",substring(x,5)))
sectors = as.vector(sectors)

# Output Parameters
size = 2000

# Plot All Sectors
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/mrlplot.jpeg",
  width = 4*size/3, height = size, quality = 100, res = 100
)

par(mfrow=c(3,4), pty="m", mar=rep(6,4), cex.lab=2, cex.axis=2, lwd=2)

for (i in seq(1,12)){
  mrl.plot(ll[,i], conf=0.95, umin=0, umax=10)
  title(main=sectors[i], cex.main=2.5)
}

dev.off()