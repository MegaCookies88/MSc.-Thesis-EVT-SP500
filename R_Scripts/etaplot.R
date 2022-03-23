## Eta Plot

library("evd")

# Color Map
c1 = "#636EFA"
c2 = "#EF553B"

# Data
df = read.csv("~/Documents/GitHub/PDM_2022/data/data1.csv")
ll = -100*sapply(df[seq(2,ncol(df))], function(x) log(x[-1])-log(x[-length(df$Date)]))
ll = data.frame(ll)

# Sectors
sectors = sapply(colnames(ll)[1:12], function(x) substring(x,5))
sectors = as.vector(sectors)

# Output Parameters
size = 3000

# Plot All Pairs
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/etaplot.jpeg",
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
             cex=3, font=2, col=c1, srt=0)
      } else{
        
        ula = apply(ll[,c(i,j)],2,rank)/(nrow(ll)+1)
        fla = apply(-1/log(ula),1,min)
        u_fla = quantile(fla, probs=c(0.025,0.975))
        
        par(pty="s", xaxt="n", yaxt="n")
        tcplot(fla, u_fla, nt=25, pscale=TRUE, which=2, vci=FALSE, cilty=2, 
               type="l", ylim=c(0.5,1.2), ylab="", xlab="", lwd=2)
        abline(h=1, col=c2, lty=3, lwd=2)
        axis(side=1, labels = FALSE)
        axis(side=2, labels = FALSE)
        
      }
    }
    
  }
}

dev.off()