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

# Plot All Pairs
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/fbvevd_density.jpeg",
  width = 2000, height = 2000, quality = 100, res = 100
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
             labels = sectors[i],
             cex=1, font=2, col=c1, srt=0)
      } else{
        
        fitbv <- fbvpot(
          ll[,c(i,j)], threshold=c(2,2), model="log", 
          likelihood="poisson", std.err=FALSE
        )
        
        par(pty="s")
        plot(fitbv, which=1, p=c(0.8,0.85,0.9,0.95), col=c2, main="")
        
      }
    }
    
  }
}

dev.off()

# Plot technology vs other sectors
jpeg(
  file = "~/Documents/GitHub/PDM_2022/figures/fbvevd_density_tech.jpeg",
  width = 2000, height = 2000, quality = 100, res = 100
)

par(mfrow=c(3,4), pty="s", mar=rep(5,4))

for (i in c(6)){
  for (j in seq(1,11)){
    if (j!=6){
      
      fitbv <- fbvpot(
        ll[,c(i,j)], threshold=c(2,2), model="log", 
        likelihood="poisson", std.err=FALSE
      )
      
      par(pty="s")
      plot(fitbv, which=1, p=c(0.8,0.85,0.9,0.95), col=c2, main="")
      
    }
  }
}

dev.off()