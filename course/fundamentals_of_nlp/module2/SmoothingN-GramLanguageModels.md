# Smoothing N-Gram Language Models

## Learning Objective

In which, we learn to overcome sparse models with smoothing, backoff and interpolation methods.

## Smoothing

- N-gram models rely on counts from a corpus to derive required probabilities. But corpora are never big enough and the counts are too sparse to be useful without additional processing.
- Smoothing address this problem by moving some probability mass from N-gram with high occurences to those with lower.

- Let's go back to Shakespear example. He produced 300,000 bigram types out of possible V^2 = 844 million bigrams, meaning 99.96% of the bigrams that were possible given his vocabulary were never observed.

- This is unsurprising since Shakespear's entire corpus is only 840k words. That's an upper bound on the total number of bigrams that could have produced.

Consequnence of this saparsity:

- In assessing the probability of test sentences, any sentence containing one of those unseen bigrams will have a probability of 0.
- And for sampling-based generation, it means we will never emit sentences containing those bigrams --- severely limiting the diversity of any output.

## Zero Counts

- Some of those zeros are really zeros.
  - Events that aren't likely to ever happen.
  - On the other hand, somf of them are just corpus had been a little bigger they would
- Zipf's law (long tail phenomenon)
  - A small number of events occur with high frequency.
  - A large number of events occur with low frequency.
  - With a corpus we can quickly collect statistics on the high frequency events.
  - But we might have to wait a very long time to get statistics on the low frequency events.
- Result
  - Our estimiates are sparse! We have no counts at all for the vast number of things we want to estimate!

## Overcoming Sparsity in N-gram Models

Sparsity doesn't only come in the form of zero-counts. The estimates for small-count N-grams are likely to be poor as well.
To overcome sparsity, we can use a combination of methods:

- Discounting
  - Steal from the rich, re-distribute the wealth.
- Backoff
  - Avoid zero counts by resorting to shorter N-grams.
- Interpolation
  - Combining information from N-gram models of differnt lengths.

## Additive Smoothing

- Add a little bit to all the counts and the zeroes go away!
- if we + 1, it's called Add-1 smoothing.

For unigrams:

```
P(wi) = (C(wi) + 1) / (M+ |V|)
why add V? because we add vocabulary size to the denominator to corpus size
```

For bigrams:

```
P(wn|wn-1) = (C(wn-1,wn) + 1) / (C(wn-1) + |V|)
```

Add-1 moves a large portion of the probability distribution from items that were observed a lot to items that were not observed at all.

- Despite this, adding smoothing is used to for simple probabilistic models in NLP and IR, especially
  - For initial experiments
  - In document classification using Naive Bayes
  - and domain where the number of zeroes isn't huge.

## Fishing Lesson

- The MLE isn't enough. it doesn't account for all the new N-grams that we're likely to encounter.
- But additive smoothing doesn't help either. it ignores what we know about the number of unique types and the number of types with count of 1! It's not the case that all the unseen N-grams will be seen!

So we need to reserve part of the observed probability mass to give it to the as-yet-unseen N-grams.

- How much to steal?
- How to redistribute it?

## Discounting

- Subtract a small fixed amount from all the observed counts

  - call that amount d
  - Thise reserves some mass for the yet unseen items.

  ```
  P(wn|wn-1) = (C(wn-1,wn) - d) / C(wn-1)
  ```

- Discounting Intuition
  - How much to subtract?
    - Split a training corpus into 2 parts: 50/50
    - collect bigram counts from these 2 parts separately
    - Observe how ofthen on average do bigrams that occured with count N in the first 1/2 occur in the other 1/2 of the training data.

We’re doing this to see how well counts from one half predict the other — basically a way to empirically check how stable our frequency estimates are.

💡 The Observation

In general, you’ll notice that:

- The bigrams that occur N times in Set 1 tend to occur fewer than N times in Set 2, on average.
- This is because the second half of the corpus introduces many new bigrams — unseen before — which "steal" some probability mass.

So, when we take the average difference between `C_1` and `C_2` for all bigrams that appeared N times, we get a sense of how much we “overcounted” in Set 1 — i.e., how much to discount.

That average shortfall is a good estimate of the discount constant d.

## Backoff

- if the N-gram we need has a positive count, we compute the probability using a discounted count in the normal way.
- if the N-gram has a zero count, we step down to a smaller N-gram and recurse from there

## Interpolation

```
Interpolation is a mathematical method for estimating an unknown value that lies between a set of known, discrete data points. It essentially "fills in the blanks" between the data you have, creating a continuous function or curve that passes through all of your known points.
```

- Biagram

```
P(wi|wi-1) = lambda * P(wi|wi-1) + (1 - lambda) * P(wi)
```

- Trigram

```
P(wi|wi-2:i-1) = lambda * P(wi|wi-2:i-1) + (1 - lambda) * P(wi|wi-1)
```

- General case

```
P(wi|wi-N+1:i-1) = lambda * P(wi|wi-N+1:i-1) + (1 - lambda) * P(wi|wi-N+2:i-1)
```

## N-Grams in the Modern Age : InfiniGram

The use of N-Gram models peaked in the mid-2000s for servral reasons:

1. The size of N-gram tables grows exponentially with N. Moving beyond 5 or 6 gram models was viewd as infeasible given the need to store N-gram tables.
2. Neural language models eliminated the need for complext smoothing techniques and allowed for longer contexts with the rise of recurrent neural networks.

Recently innovations have revived interest in N-gram models for:

- using suffix trees to store text collections to generate N-gram counts on-demand
- Novel backoff method allows the use of longer varriable length N-grams
- Easy interpolation with neural language models

- The InfiniGram model introduces a novel approach to the Markov assumtion. Instead of a fixed N-gram it dynamically chooses the longest available N-gram given the available counts
- This would ordinally require an infeasibly large table for the counts. Instead, this approach constructs a suffix tree from the training corpus and retrieves counts as needed.

- This approach can still result in 0 count in the numerator!
- Instead of trying to resolve this through smoothing, It just interpolates the model with a high performing model. In this case, a neural LM.

## Recap

- Smoothing techniques allow N-gram models to overcome data sparsity issues. Advanced techniques use a combination of discounting, interpolation and backoff to obtain reasonable results.

- Large training corpora can overcome smmothing issues with simple method like stupid backoff and infinigram backoff.
