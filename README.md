# Companies-customer-clustering
I developed a tool to cluster and show the data related to the clients health information and behavior during the year 2020 using R coding and a data visualization tool.

##To determine the best way to group companies by behavior, I tested different clustering models. 

One model I tried was the hierarchical clustering model, also known as a decision tree.

I used the "silhouette" method to find the ideal number of groups (K). This method suggested either 2 or 5 groups.

I faced limitations with our computer's processing power. We were able to analyze:

1,200 companies successfully.
12,000 companies, but our computer couldn't create visual graphs of the results.
54,000 companies, but our computer couldn't handle this amount of data.

Ultimately, we decided not to use the hierarchical clustering model because it took too long to process the data. Our computer would have needed to run for many hours, even overnight, which isn't practical for real-world use.
