# Logistic Regression

## Learning Objective

- In which, we learn a principled approach to classification based on numerical features and weights.

## Logistic Regression

- Logistic regression models estimate the conditional probability of a class assignment given a text:

- A scoring function that makes use of
  - features representing the text
  - numerical weights associated with those features
- A supervised scheme that allows us to learn the weights

## Scoring

- given features and weights, we can assign a score to each class for a given document using an affine function. An affine function is just a linear function with an offset, or intercept.

$$ z = b + w_1x_1 + w_2x_2 + ... + w_nx_n $$
$$ z = \sum_{i=1}^{n} w_i x_i + b $$
$$ z = w^T x + b $$

- for now let's assume we're dealing with binary classification problem. whether a test belong to a class or not.

  - the score z then represents a document's score as a member of the positive class.

- for purpose of binary classification, we could just use the score directly and set a threshold such that if the score is exceeds the threshold, then we consider it to be in the class, otherwise it's not.


- the real power of logistic regression comes from its conversion of that the score into a probability.

$$ P(c|t) $$

- this allow us to handle uncertainty in our classifications
  - useful in downstream applications
  - and as we'll see, it faciliates learning.

- for binary classification, we'll squash the scores to between 0 and 1 using the logistic sigmoid function.

$$ y = \frac{1}{1 + e^{-z}} $$

$$ p(y=1|x) = \frac{1}{1 + e^{-z}}  = \frac{1}{1 + e^{-(w^T x + b)}} $$

$$ p(y=0|x) = 1 - p(y=1|x) $$


## Features
- as mentioned in the last video, we're not really classifying texts directly, we're classifying texts based on their representations
- Here we'll represent texts as sets of features. Logistic regression uses these features as clues as to the correct class. 

## Multiclass Models

- Most practical applications have more than 2 classes, so we need to adjust our scoring function

- the easiest way to think about the multiclass case is as a set of binary classifications. where Each class has its own set of feature weights to asses the score for its class.
- The resulting scores can then be normalized to produce probability distribution over all the classes.
  - Softmax
- Note by multiclass, we mean choosing a single class from a set of classes. NOT the same as assigning multiple lables to a text.

## Softmax

- We maintain the same set of features as in  the binary setting.
- but now each class has its own set of weight for those features.
- We can capture the weights as a k * n matrix where k is the number of classes and n is the number of features.
- Multiplying that matrix by the input vector gives us a vector of scores(one for each class)

$$ P(y=c|x) = \frac{e^{z_c}}{\sum_{j=1}^{k} e^{z_j}} $$

- nominator is the exponential of the score for the class
- denominator is the sum of the exponentials of the scores for all the classes
- this ensures that the sum of the probabilities for all the classes is 1


