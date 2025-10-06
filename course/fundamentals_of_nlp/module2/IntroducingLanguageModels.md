# Introducing Language Models

## Learning Objective

In which, we learn the basis for probablistic language models.

## Language Models

A Language Model is a model that can assign a probability to a linguistic sequence.

- Characters, phonemes, words, sentences, etc. In this disscusion we'll stick to sequences of words to keep things simple.

## Word Prediction

We can formalize this predictoin task as a discrete probability problem that will lead us back to probablisies of sequences.

- Given a context and a fixed vocabulary, we'd like to compute the probability distribution over the vocabulary given the preceding context. That is, compute the following for all the words in your vocabulary.

  - P(wn|w1:n-1)

- As we'll see, if we can perfrom this calculation, we can also assign probabilites to entire sequences.
  - But this formulation has some useful properties on its own.

## Contextual Generation

These applicatoins make use of a language model's ablity to assign a probability to a text, and then use that text to score the various options.

But where do those options come from? It turns out we can use a language models for the generator part as well, by exploiting the ability to predict the next word.

- Given some context,

1. Generate a distribution of the possible next words.
2. Randomly pick a word from the distribution respecting the various probabilities.
3. Add that word to the context and iterate.

## The chain rule

`P(w1:n) = P(w1) * P(w2|w1) * P(w3|w1:2) * ... * P(wn|w1:n-1)`

Consider each word in the sentence incrementally, conditioning each on the previous words.

The probability of the resulting sequence is the product of each choice in the chain.

## Candidate Models

Over the rest of our NLP sequence, we'll consider 4 ways of implementing language models, each with its own strengths and weaknesses.

1. N-gram models

- Models based on counts from a corpus

2. Feedforward neural models
3. Recurrent neural models
4. Transformer models
