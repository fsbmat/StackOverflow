df <- data.frame(y,mu)
names(df) <- c("y","mu")
saveRDS(df, "df.rds")
df <- readRDS("df.rds")
phi <- 0.02216155
rho <- 0.6003019
sigma2 <- 0.02652626
y <- df$y
mu <- df$mu
integrand_1<-function(x){
  exp(-x/phi-y*exp(-x)/(phi*2)-(x+sigma2/2)^2/(2*sigma2))}
integrate(Vectorize(integrand_1), -Inf, Inf)$value
