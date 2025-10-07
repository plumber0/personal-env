# Evaluating Language Models

## Learning Objective

In which, we learn how to evaluate language models.

- The best evaluation for a LM is an extrinsic evaluation. How well does it work when embedded into the applicatoin you are building
  - put model A into an application
  - Evaluate the performance of the application with model A
  - put model B into application and evaluate
  - Compare performance of applicatoin with the two methods
    - Extinsic evaluation
    - A/B testing
- an alternative, to run rapid experiments, we can evaluate language models with an intrinsic evaluation.

## Intrinsic Evaluation

- Given some evaluation text and several alternative language models,the model that assign a higher probability to the test text is the better model.

- Standard method

  - Train parameters of our model on training set.
  - Evaluate the model on some new data : an unseen validation or test set.
    - a dataset which is differnt than our training set, but is drawn from the same source.

- More specifically in our setting,
  - the training set will be the body of the text that we use to gather the counts needed for our N-gram model.
  - the test set consists of text from the same source, but not included in the training set. This test set consists of a set of sentance that we can assign probabilities to.
  - The probability of a test set is then the product of the probabilities of the sentences within it.
  - Given multiple models, the one that assigns the higher probability to a test set is preferred.

But using probabilities directly isn't practical as an evaluation measure.

- Probabilities are inherently related to the length of the sequences and the number of sentences in the test set. We'd like a measure that's independent of length.
- Sentences probabilities can get very very small very quickly. Test sets consisting of even a modest number of sentences would quickly results in numerical underflow.

## Log Probability

to avoid these issues, we'll instead

1. Use logs of probabilities of sentences.
2. Normalize those log probabilities by length of the sentences.
3. Treat entire test set as a single long sequence.

Of course if we can not compute P(T) because of underflow, using log doesn't help.
So instead we'll apply the chain rule and push the log into the probabilities.

## Perplexity

Perplexity has been the traditional instrinsic measure used to evaluate language models, especially in the context of speech recognition and machine translation.

The perplexity of a model is just 2 raised to the entropy of the model.

Perplexity is roughly the average number of choices that a model would have to make in guessing the next item in a sequence.

- if it is 100% certain of the next word than the perplexity is 1(enthropy of 0; since log 1 = 0), since there's no choice.
- if it has no information and there are M options, then the perplexity is M. So for word prediciton, with a vocab of 30k, no information would correspond to perplexity of 30k.

## Recap

Rigorous and replicable methos are critical in evaluating language models - both as standalone systems but also as components in larger systems.

Cross Entropy and Perplexity are standard metrics for intrinsic language model evaluatoin.
Even with standard metrics, evaluation of language models is a tricky process.
