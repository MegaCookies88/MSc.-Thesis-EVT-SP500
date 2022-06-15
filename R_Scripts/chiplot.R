## Chi / Chi Bar Plot

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
  file = "~/Documents/GitHub/PDM_2022/figures/chiplot.jpeg",
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
        
        evd::chiplot(
          ll[,c(j,i)], which=1, 
          main1="", xlab="Quantile", ylab1="Chi / Chi Bar", ylim1=c(0,1),
          col=c1, cicol=c1, lwd=2, cex=2
        )
        
        par(new=TRUE)
        
        evd::chiplot(
          ll[,c(j,i)], which=2, 
          main2="", xlab="", ylab2="", ylim2=c(0,1),
          col=c2, cicol=c2, lwd=2, cex=2
        )
        
      }
    }
    
  }
}

dev.off()