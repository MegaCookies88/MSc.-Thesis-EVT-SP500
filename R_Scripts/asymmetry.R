## Coefficient Of Extremal Asymmetry

library(RColorBrewer)

# Color Map
c1 = "#636EFA"
c2 = "#EF553B"
pal = brewer.pal(10,"RdYlGn")

# Data
df = read.csv("~/Documents/GitHub/PDM_2022/data/data1.csv")
ll = -100*sapply(df[seq(2,ncol(df))], function(x) log(x[-1])-log(x[-length(df$Date)]))
ll = data.frame(ll)

# Sectors
sectors = sapply(colnames(ll)[1:12], function(x) substring(x,5))
sectors = as.vector(sectors)

# Extremal Asymmetry
rho = function(c,q){
  sc = apply(c,2,rank)/(nrow(c)+1)
  u = sc[,1]
  v = sc[,2]
  r = (sum(v>u & u>q) - sum(v<u & v>q)) / (sum(v>u & u>q) + sum(v<u & v>q))
  r
}

# Output Parameters
size = 3000

# Plot All Pairs
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/asymmetry.jpeg",
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
        
        q = seq(0.01,0.99,0.01)
        rho_q = sapply(q, function(t) rho(ll[,c(j,i)],t))
        
        par(pty="s", xaxt="n", yaxt="n")
        plot(x=q, y=rho_q, type="l", xlim=c(0,1), ylim=c(-0.5,0.5), 
             lwd=2, cex.axis=1.5)
        abline(h=0, col=c2, lty=3, lwd=2)
        
      }
    }
    
  }
}

dev.off()