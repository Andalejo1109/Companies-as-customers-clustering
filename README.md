# Companies-customer-clustering
I developed a tool to cluster and show the data related to the clients health information and behavior during the year 2022 using R coding and a data visualization tool.

## To determine the best way to group companies by behavior, I tested different clustering models. 

One model I tried was the hierarchical clustering model, also known as a decision tree.

I used the "silhouette" method to find the ideal number of groups (K). This method suggested either 2 or 5 groups.

I faced limitations with our computer's processing power. We were able to analyze:

1,200 companies successfully.
12,000 companies, but our computer couldn't create visual graphs of the results.
54,000 companies, but our computer couldn't handle this amount of data.

Ultimately, we decided not to use the hierarchical clustering model because it took too long to process the data. Our computer would have needed to run for many hours, even overnight, which isn't practical for real-world use.


## References:

Analisis de cluster, M. Vargas, Fuente:
https://www.ugr.es/~mvargas/2.RESUMENANLISISCLUSTER.pdf

Clustering de variables categóricas, Luis Villa Perez
https://oa.upm.es/57968/1/TFG_LUIS_VILLA_PEREZ.pdf

Codificación de variables categóricas en aprendizaje automático, Adrián Rocha Iñigo, Fuente:
https://idus.us.es/bitstream/handle/11441/108887/M1909%20Rocha%20%C3%8D%C3%B1igo
%2C%20Adri%C3%A1n.pdf?sequence=1

clustMixType: User-Friendly Clustering of Mixed-Type Data in R, Gero Szepannek, Fuente:
https://journal.r-project.org/archive/2018/RJ-2018-048/RJ-2018-048.pdf

Extensions to the k-Means Algorithm for Clustering Large Data Sets with Categorical Values ,
ZHEXUE HUANG, Fuente
https://cse.hkust.edu.hk/~qyang/Teaching/537/Papers/huang98extensions.pdf

kamila: Clústering con variables categóricas, CARLOS J. GIL BELLOSTA, Fuente:
https://www.datanalytics.com/2018/07/20/kamila-clustering-con-variables-categoricas/

