library("evd")

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
  file = "~/Documents/GitHub/PDM_2022/figures/chiplot.jpeg",
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
        
        par(pty="s", xaxt="n", yaxt="n")
        
        evd::chiplot(
          ll[,c(i,j)], which=1, 
          main1="", xlab="Quantile", ylab1="Chi / Chi Bar", ylim1=c(0,1),
          col=c1, cicol=c1, lwd=2, cex=2
        )
        
        par(new=TRUE)
        
        evd::chiplot(
          ll[,c(i,j)], which=2, 
          main2="", xlab="", ylab2="", ylim2=c(0,1),
          col=c2, cicol=c2, lwd=2, cex=2
        )
        
      }
    }
    
  }
}

dev.off()

# Plot Technology vs Other Sectors
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/chiplot_tech.jpeg",
  width = size, height = size, quality = 100, res = 100
)

par(mfrow=c(3,4), pty="s")

for (i in c(6)){
  for (j in seq(1,11)){
    if (j!=6){
      
      evd::chiplot(
        ll[,c(i,j)], which=1,
        main1=paste(sectors[i],sectors[j],sep="/"), 
        xlab="Quantile", ylab1="Chi / Chi Bar",
        col=c1, cicol=c1, ylim1=c(0,1), lwd=2, cex.main=2
      )
      
      par(new=TRUE)
      
      evd::chiplot(
        ll[,c(i,j)], which=2, 
        main2="", xlab="", ylab2="",
        col=c2, cicol=c2, ylim2=c(0,1), lwd=2
      )
      
      legend("bottomright", c("Chi","Chi Bar"), col=c(c1,c2), cex=2, fill=c(c1,c2))
      
    }
  }
}

dev.off()