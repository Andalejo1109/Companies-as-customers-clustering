#conectar R con Tableau
#Ver video https://youtu.be/TNgY6pcb0PU

#install.packages("Rserve")
#library(Rserve)
#Rserve()

#Cargar y utilizar funci?n IPAK
#ver video https://www.youtube.com/watch?v=UjQz9SxG9rk

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

#cargar dataset
packages <- c("tidyverse","cluster","factoextra","NbClust","tidyr", "rlang")
ipak(packages)


library(readr)
Empresas_clustering <- read_delim("D:/clustering v3.csv", 
                                     delim = "|", escape_double = FALSE, col_types = cols(IdCliente = col_character()), 
                                     trim_ws = TRUE)

#IdCliente as rownames
library(tidyverse)
Empresas_clustering <- Empresas_clustering %>% remove_rownames %>% column_to_rownames(var="IdCliente")


View(Empresas_clustering)



#normalizar las puntuaciones

Empresas_clustering<- na.omit(Empresas_clustering)
Empresas_clustering <- scale(Empresas_clustering)
head(Empresas_clustering)



#calcular la matriz de distacias
m.distancia <- get_dist(Empresas_clustering, method = "euclidean") #el m?todo aceptado tambi?n puede ser: "maximum", "manhattan", "canberra", "binary", "minkowski", "pearson", "spearman" o "kendall"
#el grafico matriz de correlaciones es muy pesado para graficar de forma local (vector de 11.2GB)
#fviz_dist(m.distancia, gradient = list(low = "blue", mid = "white", high = "red"))


library(NbClust)
library(rlang)
#estimar el numero de clusters
#Elbow, silhouette o gap_stat  method
#fviz_nbclust(Empresas_clustering, kmeans, method = "wss")
fviz_nbclust(Empresas_clustering, kmeans, method = "silhouette")
#fviz_nbclust(Empresas_clustering, kmeans, method = "gap_stat")




############################
#con esta funci?n se pueden calcular:
#the index to be calculated. This should be one of : "kl", "ch", "hartigan", "ccc", "scott",
#"marriot", "trcovw", "tracew", "friedman", "rubin", "cindex", "db", "silhouette", "duda",
#"pseudot2", "beale", "ratkowsky", "ball", "ptbiserial", "gap", "frey", "mcclain", "gamma",
#"gplus", "tau", "dunn", "hubert", "sdindex", "dindex", "sdbw", "all" (all indices except GAP,
#Gamma, Gplus and Tau), "alllong" (all indices with Gap, Gamma, Gplus and Tau included).

resnumclust<-NbClust(Empresas_clustering, distance = "euclidean", min.nc=2, max.nc=10, method = "kmeans", index = "alllong")
fviz_nbclust(resnumclust)


#calculamos los dos cl?sters
k5 <- kmeans(Empresas_clustering, centers = 5, nstart = 25)
k5
str(k5)

######################
#plotear los cluster
fviz_cluster(k5, data = Empresas_clustering)
#fviz_cluster(k5, data = Empresas_clustering, ellipse.type = "euclid",repel = TRUE,star.plot = TRUE) #ellipse.type= "t", "norm", "euclid"
#fviz_cluster(k5, data = Empresas_clustering, ellipse.type = "norm")
fviz_cluster(k5, data = Empresas_clustering, ellipse.type = "norm",palette = "Set2", ggtheme = theme_minimal())

res2 <- hcut(df, k = 2, stand = TRUE)
fviz_dend(res2, rect = TRUE, cex = 0.5,
          k_colors = c("red","#2E9FDF"))

res5 <- hcut(df, k = 5, stand = TRUE)
fviz_dend(res4, rect = TRUE, cex = 0.5,
          k_colors = c("red","#2E9FDF","green","black"))
######################

#pasar los cluster a mi df inicial para trabajar con ellos
df <- read_delim("D:/QCSCONS5/Desktop/Empresas clustering v3.csv", 
                                  delim = "|", escape_double = FALSE, col_types = cols(IdCliente = col_character()), 
                                  trim_ws = TRUE)

#IdCliente as rownames
library(tidyverse)
df <- df %>% remove_rownames %>% column_to_rownames(var="IdCliente")

df<- na.omit(df)
View(df)

df %>%
  mutate(Cluster = k5$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")


#normalizar las puntuaciones
df <- scale(df)
df<- as.data.frame(df)
df$clus<-as.factor(k5$cluster)
df

#df <- Empresas_clustering
#df <- scale(df)
#df<- as.data.frame(df)
#df$clus<-as.factor(k5$cluster)
#df

write.csv(df,"D:/QCSCONS5/Desktop/Empresas clustering v5 seg.csv", row.names = TRUE)

library(ggplot2)
df$clus<-factor(df$clus)
data_long <- gather(df, caracteristica, valor, factor_key=TRUE)
data_long

ggplot(data_long, aes(as.factor(x = caracteristica), y = valor,group=clus, colour = clus)) + 
  stat_summary(fun = mean, geom="pointrange", size = 1)+
  stat_summary(geom="line")
geom_point(aes(shape=clus))
