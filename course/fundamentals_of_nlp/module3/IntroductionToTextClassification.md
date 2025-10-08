# Introduction to Text Classification

## Learning Objective

In which, we learn to frame applications as problems in text classification.

## Classification

- Classification is the task of examining an experience, event or entity and assigning it to a known class, or category.

- Classification, or categorization, is a central element to cognition. Humans perform this task effortlesly and without conscious awareness.

- By placing new instances into known categories, we can reason about instances based on what we know (or think we know) about members of that class.

## Text Classification

- the thing being classified is a piece of text. Some span of tokens for which we need to take some action.
- An action that depends on its membership in some given class.

- Formally, we'll be working with the following setup..

- we have an input text drawn from some set of texts

$$ t \in T $$

- And we have a fixed set of classes

$$ C = \{c_1, c_2, ..., c_n\} $$

- We want as output a single predicted class selected from

$$ c \in C $$

## Machine Learning Approach

- We have available a set of tuples consisting of a representative set of texts with their correct labels.
  $$ {(ti, ci)}^n $$

- From those examples, we'd like to learn a classifier that maps texts to their corresponding classes.

$$ \theta : T -> C $$

## Probabilities

- Instead of a discrete classification we may want a probabilistic decision instead. That is, what is the probability that this text belongs to this calss?
  - For example, the probability that a given email is spam.
    $$ P(c|t) $$
- And when asked to give a definitive answer, we might reply with the class with the highest probability.
  $$ c = \argmax\_{c \in C} P(c|t) $$

## Recap

- Classification is an essential tool in the NLP toolkit.
- Moving on, we'll see problems that aren't obivious candidates for classification approach. But we can re-envision them in a way that allows them to be solved with classification techniques.
