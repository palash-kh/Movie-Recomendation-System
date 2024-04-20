# Movie Recommendation System Analysis

This repository explores different implementations of a movie recommendation system using both collaborative filtering and content-based filtering techniques. The goal is to analyze and compare various machine learning algorithms to provide personalized movie recommendations to users. (Dataset is taken from Kaggle) 

# Collaborative Filtering
Collaborative filtering methods leverage user-item interaction data to generate recommendations. In this analysis, we employ three techniques:

1. K-Means Clustering: Groups users or items into clusters based on their similarities in rating patterns. Recommendations are then made based on the preferences of users within the same cluster.
2. Linear Regression: Predicts user ratings for movies based on historical data. The model learns the relationships between user attributes and movie preferences to make recommendations.
3. K-Nearest Neighbors (KNN): Recommends movies similar to those a user has liked or interacted with based on their features.

# Content-Based Filtering
Content-based filtering recommends items to users based on the attributes or characteristics of the items themselves. Here, we implement four algorithms:

1. The NB classifier is not used to directly predict user preferences but rather to find movies with similar attributes.
2. Support Vector Machine (SVM): Utilizes SVM with different kernels (linear, polynomial with degree 5, and RBF) to classify movies and make recommendations.

# Conclusion
By comparing the effectiveness and efficiency of various algorithms in providing personalized movie recommendations, this analysis aims to help us understand the strengths and weaknesses of different recommendation techniques and make informed decisions when implementing recommendation systems in real-world applications. Feedbacks are appreciated!

