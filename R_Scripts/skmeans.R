## Perform Spherical K-Means Clustering

library("skmeans")

# Data
df = read.csv("~/Documents/GitHub/PDM_2022/data/data1.csv")
ll = -100*sapply(df[seq(2,ncol(df))], function(x) log(x[-1])-log(x[-length(df$Date)]))
ll = data.frame(ll)

# Sectors
sectors = sapply(colnames(ll)[1:12], function(x) substring(x,5))
sectors = as.vector(sectors)

# Standardization
ll = apply(ll, 2, function(x) 1/(1-rank(x)/(length(x)+1)))

# Angular Measure
r = apply(ll, 1, function(x) norm(as.matrix(x), type="2"))
w = ll/r

# Parameters : Threshold / Number of clusters
r0 = quantile(r,0.95)
K = c(2,3,4,5,6,7)

for (k in K) {
  # Clustering
  set.seed(1234)
  skm <- skmeans(w[r>r0,], k=k, method=NULL, m=1, weights=1)
  labels = skm$cluster
  centers = skm$prototypes
  
  # Save
  write.csv(centers, paste("~/Documents/GitHub/PDM_2022/data/skmeans",k,"_centers.csv",sep=""))
  write.csv(labels, paste("~/Documents/GitHub/PDM_2022/data/skmeans",k,"_labels.csv",sep=""))
}