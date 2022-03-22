## Transformation To Frechet Scale Using Marginal GPD Plot

library("ismev")
library(RColorBrewer)

# Color Map
c1 = "#636EFA"
c1 = "black"
pal = brewer.pal(10,"RdYlGn")

# Data
df = read.csv("~/Documents/GitHub/PDM_2022/data/data1.csv")
ll = -100*sapply(df[seq(2,ncol(df))], function(x) log(x[-1])-log(x[-length(df$Date)]))
ll = data.frame(ll)

# Sectors
sectors = sapply(colnames(ll)[1:12], function(x) substring(x,5))
sectors = as.vector(sectors)

# Chi Estimation
chi_estimate = function(x,y){
  n = 25*202
  z1 = tapply(x[1:n], rep(1:202,each=25), max)
  z2 = tapply(y[1:n], rep(1:202,each=25), max)
  g1 = ecdf(z1)
  g2 = ecdf(z2)
  nu = 0.5*mean(abs(g1(z1)-g2(z2)))
  chi = 2-(1+2*nu)/(1-2*nu)
  chi
}

# Output Parameters
size = 3000

# Plot All Pairs
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/gpd_frechet.jpeg",
  width = size, height = size, quality = 100, res = 100
)

# Functions Definition
fst_correct = function (x,xe,r,sc,sh,u){
  if(x>u){
    r = -1/log(1-r*(max(1+sh*(x-u)/sc,0)^(-1/sh)))
  }else{
    r = xe
  }
  r
}

# Model Parameters
u1 = 2
u2 = 2

par(mfrow=c(12,12), pty="s", mar=c(0,0,0,0), oma=c(4,4,0,0))

for (i in seq(1,12)){
  for (j in seq(1,12)){
    
    if (j>i){
      plot.new()
    } else{
      if (j==i){
        plot.new()
        text(x = grconvertX(0.5, from = "npc"),
             y = grconvertY(0.5, from = "npc"),
             labels = gsub("\\.","\n",sectors[i]),
             cex=3, font=2, col=c1, srt=0)
      } else{
        
        if (i<12){
          par(xaxt="n")
        } else{
          par(xaxt="s")
        }
        
        if (j>1){
          par(yaxt="n")
        } else{
          par(yaxt="s")
        }
        
        ell = -1/log(apply(ll[,c(i,j)],2,rank)/(nrow(ll)+1))
        fit1 = ismev::gpd.fit(ll[,i], threshold=u1, npy=251, show=FALSE)
        fit2 = ismev::gpd.fit(ll[,j], threshold=u2, npy=251, show=FALSE)
        
        pll = cbind(
          mapply(function(x,xe) fst_correct(x,xe,fit1$rate,fit1$mle[1],fit1$mle[2],u1), ll[,i], ell[,1]),
          mapply(function(x,xe) fst_correct(x,xe,fit2$rate,fit2$mle[1],fit2$mle[2],u2), ll[,j], ell[,2])
        )
        colnames(pll) = colnames(ll[,c(i,j)])
        
        chi = chi_estimate(ll[,i],ll[,j])
        
        par(pty="s")
        plot(pll, log="xy", xlim=c(0.1,1e4), ylim=c(0.1,1e4), 
             lwd=2, cex.axis=1.5,
             col=pal[1+as.integer(10*chi)])
        
      }
    }
    
  }
}

dev.off()