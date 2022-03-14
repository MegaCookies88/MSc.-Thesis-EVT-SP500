## BEVD Density Plot

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
  file = "~/Documents/GitHub/PDM_2022/figures/fbvevd_density.jpeg",
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
        
        fitbv <- fbvpot(
          ll[,c(i,j)], threshold=c(2,2), model="log", 
          likelihood="poisson", std.err=FALSE
        )
        
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
        plot(fitbv, which=1, p=c(0.8,0.85,0.9,0.95), col=c2, main="",
             xlim=c(0,20), ylim=c(0,20), lwd=2, tlty=3, cex.axis=1.5)
        
      }
    }
    
  }
}

dev.off()

# Plot Technology vs Other Sectors
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/fbvevd_density_tech.jpeg",
  width = size, height = size, quality = 100, res = 100
)

par(mfrow=c(3,4), pty="s", mar=rep(6,4))

for (i in c(6)){
  for (j in seq(1,11)){
    if (j!=6){
      
      fitbv <- fbvpot(
        ll[,c(i,j)], threshold=c(2,2), model="log", 
        likelihood="poisson", std.err=FALSE
      )
      
      plot(fitbv, which=1, p=c(0.8,0.85,0.9,0.95), col=c2, main="",
           xlim=c(0,20), ylim=c(0,20), cex.lab=3, cex.axis=2, lwd=2, tlty=3)
      
    }
  }
}

dev.off()