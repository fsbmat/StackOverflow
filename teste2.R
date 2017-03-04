##Box-Plot dos valores simulados dos parâmetros.

library(ggplot2)
library(dplyr)
library(readr)
df1 <- read.csv(url("https://cdn.rawgit.com/fsbmat/StackOverflow/58046aff/d1.csv"), sep = ";")
#df1 <- read_delim("D:/Downloads/d1.csv", ";", escape_double = FALSE, col_types = cols(val_Sim = col_number()),trim_ws = TRUE)
attach(df1)
df1$parametros <- factor(df1$parametros,
                         levels = c("gamma0","gamma1","gamma2","beta0","beta1","beta2","phi1", "rho"), ordered = TRUE)
head(df1)

g1 <- ggplot(df1, aes(x = parametros,y = val_Sim)) +
  geom_boxplot(aes(fill = parametros),alpha = .6,size = .5)+
  stat_boxplot(geom ='errorbar') +
  guides(fill=FALSE)+geom_point()+
  ggtitle("Boxplot com os valores estimados") +   xlab("Parâmetros")+
  scale_y_continuous(name = "Valores Estimados",
                     breaks = seq(-0.5, 2, 0.5),
                     limits=c(-0.5, 2))+
  theme(plot.title = element_text(hjust = 0.5))

library(readr)
df2 <- read.csv(url("https://cdn.rawgit.com/fsbmat/StackOverflow/58046aff/d2.csv"), sep = ";")

attach(df2)
df2$parametros <- factor(df2$parametros,
                         levels = c("gamma0","gamma1","gamma2"), ordered = TRUE)

#df2 <- read_delim("D:/Downloads/d2.csv", ";", escape_double = FALSE, col_types = cols(val_Sim = col_number()),trim_ws = TRUE)

g2 <- ggplot(df2, aes(y = val_Sim, x = parametros)) +
  geom_boxplot(aes(fill = parametros),alpha = .6,size = .5)+
  stat_boxplot(geom ='errorbar') +
  guides(fill=FALSE)+geom_point()+
  ggtitle("Boxplot com os valores estimados") +   xlab("Parâmetros") +
  scale_y_continuous(name = "Valores Estimados",
                     breaks = seq(-0.5, 2, 0.5),
                     limits=c(-0.5, 2))+
  theme(plot.title = element_text(hjust = 0.5))

library(readr)

df3 <- read.csv(url("https://cdn.rawgit.com/fsbmat/StackOverflow/58046aff/d3.csv"), sep = ";")
attach(df3)
df3$parametros <- factor(df3$parametros,
                         levels = c("beta0","beta1","beta2"), ordered = TRUE)
#df3 <- read_delim("D:/Downloads/d3.csv", ";", escape_double = FALSE, col_types = cols(val_Sim = col_number()),trim_ws = TRUE)

g3 <- ggplot(df3, aes(y = val_Sim, x = parametros)) +
  geom_boxplot(aes(fill = parametros),alpha = .6,size = .5)+
  stat_boxplot(geom ='errorbar') +
  guides(fill=FALSE)+geom_point()+
  ggtitle("Boxplot com os valores estimados") +   xlab("Parâmetros") +
  scale_y_continuous(name = "Valores Estimados",
                     breaks = seq(-0.5, 2, 0.5),
                     limits=c(-0.5, 2))+
  theme(plot.title = element_text(hjust = 0.5))

library(readr)

df4 <- read.csv(url("https://cdn.rawgit.com/fsbmat/StackOverflow/58046aff/d4.csv"), sep = ";")
attach(df4)
df4$parametros <- factor(df4$parametros,
                         levels = c("phi1", "rho"), ordered = TRUE)

#df4 <- read_delim("D:/Downloads/d4.csv", ";", escape_double = FALSE, col_types = cols(val_Sim = col_number()),trim_ws = TRUE)


g4 <- ggplot(df4, aes(y = val_Sim, x = parametros)) +
  geom_boxplot(aes(fill = parametros),alpha = .6,size = .5)+
  stat_boxplot(geom ='errorbar') +
  guides(fill=FALSE)+geom_point()+
  ggtitle("Boxplot com os valores estimados") +   xlab("Parâmetros") +
  scale_y_continuous(name = "Valores Estimados",
                     breaks = seq(-0.5, 2, 0.25),
                     limits=c(-0.5, 2))+
  theme(plot.title = element_text(hjust = 0.5))
library(gridExtra)
grid.arrange(g1,g2, g3, g4)

