## Coefficient Of Extremal Asymmetry

library("RColorBrewer")
library("boot")

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

# Extremal Asymmetry - First > Second 
rho = function(c,q){
  sc = apply(c,2,rank)/(nrow(c)+1)
  u = sc[,1]
  v = sc[,2]
  a = sum(u>v & v>q) - sum(u<v & u>q) 
  b = sum(u>v & v>q) + sum(u<v & u>q)
  if(b==0){r=0} else{r=a/b}
  r
}
rho_nsc = function(c,u){
  x = c[,1]
  y = c[,2]
  a = sum(x>y & y>u) - sum(x<y & x>u)
  b = sum(x>y & y>u) + sum(x<y & x>u)
  if(b==0){r=0} else{r=a/b}
  r
}
rho.ci = function(c,q){
  boot.out = boot(c, function(t,idx) rho(t[idx,],q), R=500, parallel="multicore", ncpus=6)
  ci = boot.ci(boot.out, conf=0.95, type="norm")
  r = ci$normal
  r[c(2,3)]
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
        
        q = seq(0,0.99,0.01)
        u = seq(0,10,0.25)
        rho_q = sapply(q, function(t) rho(ll[,c(j,i)],t))
        #rho_u = sapply(u, function(t) rho_nsc(ll[,c(j,i)],t))
        
        q_ci = seq(0.01,0.99,length.out=20)
        rho_ci = t(sapply(q_ci, function(t) rho.ci(ll[,c(j,i)],t)))
        
        par(pty="s", xaxt="n", yaxt="n")
        plot(x=q, y=rho_q, type="l", ylim=c(-0.5,0.5), lwd=2, cex.axis=1.5)
        #plot(x=u, y=rho_u, type="l", ylim=c(-1,1), lwd=2, cex.axis=1.5)
        abline(h=0, col=c2, lty=3, lwd=2)
        lines(x=q_ci, y=rho_ci[,1], lty=2, lwd=2)
        lines(x=q_ci, y=rho_ci[,2], lty=2, lwd=2)
        
      }
    }
    
  }
  print(paste("row",i,"done!",sep=" "))
}

dev.off()