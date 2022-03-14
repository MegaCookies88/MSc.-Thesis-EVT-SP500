## Transformation To Frechet Scale Plot

# Color Map
c1 = "#636EFA"
c2 = "#EF553B"

# Data
df = read.csv("~/Documents/GitHub/PDM_2022/data/data1.csv")
ll = -100*sapply(df[seq(2,12)], function(x) log(x[-1])-log(x[-length(df$Date)]))
ll = data.frame(ll)
ll$Date = df$Date[-1]

# Sectors
sectors = sapply(colnames(ll)[1:11], function(x) substring(x,5))
sectors = as.vector(sectors)

# Output Parameters
size = 3000

# Plot All Pairs
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/scatter_frechet.jpeg",
  width = size, height = size, quality = 100, res = 100
)

par(mfrow=c(11,11), pty="s", mar=c(0,0,0,0), oma=c(4,4,0,0))

for (i in seq(1,11)){
  for (j in seq(1,11)){
    
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
        
        if (i<11){
          par(xaxt="n")
        } else{
          par(xaxt="s")
        }
        
        if (j>1){
          par(yaxt="n")
        } else{
          par(yaxt="s")
        }
        
        par(pty="s")
        plot(-1/log(apply(ll[,c(i,j)],2,rank)/(nrow(ll)+1)), log="xy",
             xlim=c(0.1,1e4), ylim=c(0.1,1e4), lwd=2, cex.axis=1.5)
        
      }
    }
    
  }
}

dev.off()