install.packages("readr")
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}


#cargar dataset
packages <- c("tidyverse","cluster","factoextra","NbClust","tidyr", "rlang")
ipak(packages)


Empresas_clustering_sample <- read_delim("C:/Users/Ideapad 3/Downloads/Empresas clustering sample.csv", 
                                         delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Empresas_clustering_sample)

#IdCliente as rownames
library(tidyverse)
Empresas_clustering <- Empresas_clustering_sample %>% remove_rownames %>% column_to_rownames(var="IdCliente")


View(Empresas_clustering)



#normalizar las puntuaciones

Empresas_clustering<- na.omit(Empresas_clustering)
head(Empresas_clustering)


datos <- scale(Empresas_clustering)

# Matriz de distancias euclídeas
mat_dist <- dist(x = datos, method = "euclidean")

# Dendrogramas con linkage complete y average
hc_euclidea_complete <- hclust(d = mat_dist, method = "complete")
hc_euclidea_average  <- hclust(d = mat_dist, method = "average")

cor(x = mat_dist, cophenetic(hc_euclidea_complete))
#0.8769389

cor(x = mat_dist, cophenetic(hc_euclidea_average))
#0.9492292

#árbol para generar los clusters

set.seed(101)

hc_euclidea_completo <- hclust(d = dist(x = datos, method = "euclidean"),
                               method = "complete")

fviz_dend(x = hc_euclidea_completo, k = 2, cex = 0.6) +
  geom_hline(yintercept = 5.5, linetype = "dashed") +
  labs(title = "Herarchical clustering",
       subtitle = "Distancia euclídea, Lincage complete, K=2")

fviz_dend(x = hc_euclidea_completo, k = 5, cex = 0.6) +
  geom_hline(yintercept = 3.5, linetype = "dashed") +
  labs(title = "Herarchical clustering",
       subtitle = "Distancia euclídea, Lincage complete, K=5")


