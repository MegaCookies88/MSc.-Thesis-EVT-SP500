## Pickands Plot

library("ismev")
source("../R_Scripts/EL_pickands_function.R")

# Color Map
c1 = "#636EFA"
c2 = "#EF553B"
c3 = "#00CC96"

# Data
df = read.csv("~/Documents/GitHub/PDM_2022/data/data1.csv")
ll = -100*sapply(df[seq(2,ncol(df))], function(x) log(x[-1])-log(x[-length(df$Date)]))
ll = data.frame(ll)

# Sectors
sectors = sapply(colnames(ll)[1:12], function(x) substring(x,5))
sectors = as.vector(sectors)

# Scaling Functions
fst_correct = function(x,xe,r,sc,sh,u){
  if(x>u){-1/log(1-r*(max(1+sh*(x-u)/sc,0)^(-1/sh)))} else{xe}
}

gpd_rescale = function(x,u){
  # Empirical transformation to Frechet scale
  xe = -1/log(rank(x)/(length(x)+1))
  # Fit gpd to exceedances and correct their transformation
  fit = gpd.fit(x, threshold=u, npy=251, show=FALSE)
  z = mapply(function(a,b) fst_correct(a,b,fit$rate,fit$mle[1],fit$mle[2],u), x, xe)
  z
}

sll = apply(ll, 2, function(x) gpd_rescale(x,2))

# Output Parameters
size = 3000

# Plot All Pairs
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/pickands_diag.jpeg",
  width = size, height = size, quality = 100, res = 100
)

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
             cex=3, font=2, col="black", srt=0)
      } else{
        
        bll = sll[,c(j,i)] #apply(ll[,c(j,i)], 2, function(x) gpd_rescale(x,2))
        
        t = seq(0,1,0.01)
        A = A_tild(t,bll,0.95,F)
        
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
        
        par(cex.axis=1.5)
        
        plot(t, A_tild(t,bll,0.8,F), xlim=c(0,1), ylim=c(0.5,1), type='l', lwd=2, col=c1)
        lines(t, A_tild(t,bll,0.9,F), xlim=c(0,1), ylim=c(0.5,1), type='l', lwd=2, col=c2)
        lines(t, A, xlim=c(0,1), ylim=c(0.5,1), type='l', lwd=2, col=c3)
        lines(t,rep(1,length(t)), lty=3)
        lines(t,sapply(t, function(x) max(x,1-x)), lty=3)
        lines(rep(0.5,length(t[t>=0.5])), t[t>=0.5], lty=2)
        points(t[which.min(A)],min(A), pch=19, lwd=3)
        
      }
    }
    
  }
}

dev.off()