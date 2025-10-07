# N-Gram Based Language Models

## Learning Objective

In which, we learn to implement language models using N-grams.

## N-Gram Language Models

N-Gram language models are a method for computing the probability of sequences using:

- Counts of sequences of length N gather from a corpus.
- Along with a simple independence assumtion applied to the chain rule view of sequence possibilities.

## Language Modeling

How do we acquire the probabilities we need to instantiate this factored model?

- start with the definition of contitnal probability
- and then look for counts from a corpus to support them.

P(wi|wi-1) = P(w1:i) / P(w1:i-1) = Count(w1:i)/M / Count(w1:i-1)/M = Count(w1:i) / Count(w1:i-1)

## N-Gram Counts

- For most longer sequences, and for most text collections, we won't get good estimates using simple counting.
  - We'll get a lot of 0 counts, leading to 0 probabilities for sequences that are entirly plausible.
- To see difficulty of our task, consider how many N-grams are possible given a fixed vocabulary size |V|, say on the order of 30K.
- For bigrams, there are 900M possibilities. For trigrams, there are 27Trillion possibilities.
  With a corpus of 1M words, we couldn't possibly come up with counts for all but a small fractoin of the bigrams.
- Clearly, we'll have to be more clever to make this counting approach work.

## Independence Assumption

Let's assume the probability of the next word is independent of some of its earlier history.
The probability is dependent only on a history of a fixed length.

## Markov Assumption

Replace every component in the chain rule product with an approximation using a fixed size immediatly preceding history.

- Bigram: P(wi|w1:i-1) ≈ P(wi|wi-1)
- Trigram: P(wi|w1:i-1) ≈ P(wi|wi-2,wi-1)
- General case: P(wi|w1:i-1) ≈ P(wi|wi-N+1:i-1)

## Autoregressive Generation

An illuminating(and very useful) way to employ a language model is to use it to generate random sentences that reflect the statistics of the data from which the model was derived. This idea was proposed by Claude Shannon in 1951 as part of his work on Information Theory and especially the notion of Entropy.

- Sample a random bigram `(<s>, wi)` according to Model's probability distribution over bigrams.
- Next sample a new bigram `(wi, x)` where the prefix `wi` matches the suffix of the previously sampled bigram.

### Sampling vs. Greedy Selection

**Sampling (probabilistic):**

- Pick words randomly, but **weighted by their probabilities**
- If `P("the"|<s>) = 0.3` and `P("a"|<s>) = 0.1`, then "the" is 3x more likely to be chosen
- Lower-probability words can still be selected sometimes, creating variety

**Greedy/Argmax (deterministic):**

- Always pick the **highest probability** word: `argmax P(wi | wi-1)`
- Produces the same output every time

**Example:** If after `<s>` you have:

- `P("The"|<s>) = 0.4`
- `P("I"|<s>) = 0.3`
- `P("A"|<s>) = 0.2`
- `P("Hello"|<s>) = 0.1`

With sampling: Generate "The" 40% of the time, "I" 30% of the time, etc. → Different sentences each run
With greedy: Always pick "The", then always the next highest word → Same sentence every time

Shannon's approach uses **probability-weighted sampling** to reflect corpus statistics and generate diverse outputs.

## Shakespear Example

- N=884,647 tokens, V=29,066
- Shakespeare' produced 300,000 bigram types out of V^2 = 844 million possible bigrams.
  - So 99.96% of the possible bigrams were not seen in the corpus.
  - This is the biggest problem with using N-gram models for language generation.
- 4 grams are worse : What's coming out looks like Shakespeare because it is Shakespeare.

### How Bigrams Are Extracted

Bigrams are collected by sliding a window of size 2, moving by 1 token at a time:

**Example:** `"To be or not to be"`

1. Tokenize: `<s> To be or not to be </s>`
2. Slide window:
   - `(<s>, To)`
   - `(To, be)`
   - `(be, or)`
   - `(or, not)`
   - `(not, to)`
   - `(to, be)`
   - `(be, </s>)`

With 884,647 tokens, you get ~884,646 bigrams, but only 300,000 **unique types** (99.96% of possible combinations never appeared).

### Why 4-grams "Memorize"

With longer n-grams, the **sparsity problem** gets much worse:

**Bigrams (more creative):**

```
P(x | "be") has many options:
  P("or" | "be") = 0.15
  P("not" | "be") = 0.10
  P("a" | "be") = 0.08
  ...  (many nonzero options)
```

✓ Sampling produces variety and novel combinations

**4-grams (memorization):**

```
P(x | "To be or") typically has only one option:
  P("not" | "To be or") = 1.0   ← Only seen once in corpus
  P(everything else) = 0
```

✗ When sampling, you're forced to pick "not" (100% probability)

**The key insight:** Longer contexts → more sparsity → fewer alternative continuations → less randomness when sampling → more memorization of exact corpus sequences.
