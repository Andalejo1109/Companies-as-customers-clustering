# Companies Customer Clustering (2022)

This repository contains R code and related materials developed for clustering and visualizing health information and behavioral data of company clients during 2022. The project explores different clustering methodologies to identify distinct customer segments, ultimately focusing on practical solutions given computational constraints.

## Project Overview

The primary objective was to develop a tool for customer segmentation to understand and analyze company behavior based on health-related data. The project explored various clustering algorithms, with a focus on hierarchical clustering initially.

Key aspects of the project include:

* **Data Analysis:** Processing and analyzing customer health and behavioral data from 2022.
* **Clustering Models:** Experimenting with hierarchical clustering and other models to identify customer segments.
* **Silhouette Analysis:** Utilizing the silhouette method to determine the optimal number of clusters (K).
* **Visualization:** Creating visualizations to represent the identified clusters and their characteristics, including Power BI dashboards.
* **Computational Limitations:** Addressing and documenting the challenges encountered due to computational constraints.

## Contents

* `Clustering Empresas v1.R`: R script for general clustering analysis.
* `Clustering Jerarquico Empresas v2.R`: R script for hierarchical clustering implementation.
* `Codigo correlación + kmeans.R`: R script containing correlation analysis and k-means clustering.
* `Clustering data analysis.pdf`: Document containing analysis results and findings.
* `k5 herarchical clustering 800obs.png`: Image showing the results of hierarchical clustering with 5 clusters using 800 observations.
* `radar chart Segmentos.pbix`: Power BI file containing radar chart visualizations of the identified segments.
* `README.md`: This file.

## Methodology

### Initial Exploration: Hierarchical Clustering

* The initial approach involved using hierarchical clustering to group companies based on their behavioral data.
* The silhouette method was employed to determine the optimal number of clusters, suggesting 2 or 5 clusters.
* Computational limitations were encountered when processing larger datasets:
    * Successfully analyzed 1,200 companies.
    * Processed 12,000 companies but faced issues generating visualizations.
    * Failed to process 54,000 companies due to excessive computational demands.
* Due to the long processing times, hierarchical clustering was deemed impractical for large datasets.

### Alternative Approaches: K-Means and Correlation Analysis

* The repository also includes `Codigo correlación + kmeans.R`, indicating the exploration of k-means clustering and correlation analysis.
* Further details about the results of K-means can be found in the `Clustering data analysis.pdf` file.
* The `Clustering Empresas v1.R` file contains other general clustering experiments.

### Visualization

* The identified clusters are visualized using a radar chart in the `radar chart Segmentos.pbix` Power BI file.
* The `k5 herarchical clustering 800obs.png` file provides a visual representation of the hierarchical clustering results for a subset of the data.

## Technologies Used

* **R:** For data analysis and clustering.
* **Power BI:** For data visualization and dashboard creation.

## Computational Limitations

* The project encountered significant computational limitations when processing large datasets with hierarchical clustering.
* This highlights the importance of considering computational resources when selecting clustering algorithms.

## References

* Analisis de cluster, M. Vargas, Fuente: [https://www.ugr.es/~mvargas/2.RESUMENANLISISCLUSTER.pdf](https://www.ugr.es/~mvargas/2.RESUMENANLISISCLUSTER.pdf)
* Clustering de variables categóricas, Luis Villa Perez: [https://oa.upm.es/57968/1/TFG_LUIS_VILLA_PEREZ.pdf](https://oa.upm.es/57968/1/TFG_LUIS_VILLA_PEREZ.pdf)
* Codificación de variables categóricas en aprendizaje automático, Adrián Rocha Iñigo: [https://idus.us.es/bitstream/handle/11441/108887/M1909%20Rocha%20%C3%8D%C3%B1igo%2C%20Adri%C3%A1n.pdf?sequence=1](https://idus.us.es/bitstream/handle/11441/108887/M1909%20Rocha%20%C3%8D%C3%B1igo%2C%20Adri%C3%A1n.pdf?sequence=1)
* clustMixType: User-Friendly Clustering of Mixed-Type Data in R, Gero Szepannek: [https://journal.r-project.org/archive/2018/RJ-2018-048/RJ-2018-048.pdf](https://journal.r-project.org/archive/2018/RJ-2018-048/RJ-2018-048.pdf)
* Extensions to the k-Means Algorithm for Clustering Large Data Sets with Categorical Values , ZHEXUE HUANG: [https://cse.hkust.edu.hk/~qyang/Teaching/537/Papers/huang98extensions.pdf](https://cse.hkust.edu.hk/~qyang/Teaching/537/Papers/huang98extensions.pdf)
* kamila: Clústering con variables categóricas, CARLOS J. GIL BELLOSTA: [https://www.datanalytics.com/2018/07/20/kamila-clustering-con-variables-categoricas/](https://www.datanalytics.com/2018/07/20/kamila-clustering-con-variables-categoricas/)

## Usage

1.  Clone the repository: `git clone [repository URL]`
2.  Open the R scripts in RStudio or another R IDE.
3.  Review the `Clustering data analysis.pdf` to understand the data analysis and results.
4.  Open the `radar chart Segmentos.pbix` file with Power BI to explore the visualizations.
5.  View the `k5 herarchical clustering 800obs.png` image for a visualization example.
6.  Run the R scripts to replicate or modify the analysis.

## Contact

[Alejandro Rodriguez Lozano] 

[alejo1109@gmail.com] 

[https://www.linkedin.com/in/andalejo/]

