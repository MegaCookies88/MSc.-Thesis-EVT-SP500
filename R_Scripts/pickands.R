## Pickands Plot

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
  file = "~/Documents/GitHub/PDM_2022/figures/pickands.jpeg",
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
        
        cml = ll[1:5025,c(j,i)]
        xx = rep(1:201, each=25)
        cml = cbind(tapply(cml[,1], xx, max), tapply(cml[,2], xx, max))
        colnames(cml) = colnames(ll[,c(j,i)])
        
        pp = "pickands"
        cc = "cfg"
        
        par(pty="s", xaxt="n", yaxt="n")
        abvnonpar(data = cml, epmar = TRUE, method = pp, plot = TRUE, lty = 1, col=c1, lwd=2)
        abvnonpar(data = cml, epmar = TRUE, method = pp, add = TRUE, madj = 1, lty = 2, lwd=2)
        abvnonpar(data = cml, epmar = TRUE, method = pp, add = TRUE, madj = 2, lty = 4, lwd=2)
        abvnonpar(data = cml, epmar = TRUE, method = cc, add = TRUE, lty = 1, col=c2, lwd=2)
        
      }
    }
    
  }
}

dev.off()