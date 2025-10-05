# Subword Tokenization

## Learning objective

In which, we learn to construct vocabularies from corpora using subword tokenization.

## Vocabulary Learning

- We are faced with the prospect of dealing with open-vocabulary applications using fixed vocablary resources.

  - Names, numbers, misspellings, etc.
  - Agglutinating and compounding languages

- So how do we effectively use fixed-size vocabularies, knowing that out-of-vocabulary (OOV) words will occur with considerable frequency?

## Subword Tokenization

Given a training corpus, Subword Tokenization algorithms idnetify the base words and subwords in a vocabulary empirically.

- in these approaches, we call both normal words, and subwords, tokens.
- Tokens will serve as a convenient approximation to what we've been calling morphemes: they are the minimal units to which our NLP systems can expect to find meanings.
- OOV words are decomposed into sequence of tokens (words and subwords) that do exist in the vocabulary.

- 3 commonly used algorithms:
  - Byte Pair Encoding (BPE)
  - WordPiece
  - Unigram Language Model
- All 3 algorithms provide 3 basic methods:
  - A learner that takes a raw training corpus and induces a vocabulary consisting of N tokens, where N is specified by the user.
  - A tokenizer (or encoder) that takes a pre-segmented input and tokenizes it according to a given vocabulary.
    - the output is a sequence of integer indexes into the vocabulary.
  - A decoder that takes a list of integer indexes and generates a surface form.

## Byte Pair Encoding (BPE)

- Given a traning corpus,
- Let an inital vocabulary be the set of all individual characters in the corpus.( either from the training set, or from an outside resource like Unicode).
  = {A, B, C, ...}
- Repeat
  - Choose the most frequently occuring adjacent pair of vocabulary items in the training corpus (Say `AB`)
  - Add a new merged symbol `AB` to the vocabulary
  - Replace every adjacent pair of `A` and `B` in the training corpus with `AB`
- Until k merges have been done.

## BPE Tokenization (Encoding)

On input,

1. Add white-space separate the surface tokens and add \_
2. Separate out the characters
3. Greedily in the order in which they were learned, apply merges until no applicable merges are left.

## Byte-Pair Encoding: Summary

- With BPE(and other subword approaches) there are effectively no out of vocabulary words.
- Every word can be decomposed into a sequence of known vocabulary items(sequences of words and subwords, or worst case, characters)
- Depending on the encoding you may run into characters that are out of vocabulary.
  - common approach is to start with a version of Unicode as the initial set of characters.
  - Resort to byte encoding for unknown characters.

## Byte-Pair Encoding: Preprocessing

- Practical implemantations of subword algorithms require some pre-processing of training corpus and handling of special cases on a language and domain specific basis.

- Segmantation into words.
- Treatment of spaces / word boundaries.
  - Additoin of special tokens to mark begin/end of words.
- Regex to capture pairs that should not be merged.
  - Typically preventing merging of characters from differing `classes`. Letters with numbers, alpha-numerics with punctuation, etc.

## Variants: Learning

- Byte-pair encoding employs the `most frequent pair` metric as a heuristic for choosing the next merge.
  - Frequency of `xy`.
- Wordpiece uses a global measure based on choosing the merge that maximizes the likelihood of the training data (requires a language model over training data).
  - an approximation to this is mutal information

## Variants: Tokenization

- Byte-pair uses the learned list of merges to guide tokenization.

  - Apply the merges in the order they were learned.
  - The vocabulary doesn't play a direct role in this process.

- Wordpiece uses the vocabulary directly and doesn't keep the merges around.
  - Apply our earlier MaxMatch algorithm to the input to tokenize.
    - Find the longest matcing token at the start . Choose it.
    - Advance the pointer to character beyond the previous choice.
    - Continue

## Tradeoffs in Vocabulary Construction

- Smaller vocabularies have lower memory requirements. As we'll see later in the course associating `meanings` with vocabulary items has a high memory impact. So smaller vocabularies are preferred.

- But smaller vocabularies lead to longer input sequences, as words are tokenized into smaller units. Commercial LLMs charged based on token count. Also, computational costs tend to grow quadratically with sequence length.

## Recap

Modern NLP systems and especially LLM make use of fixed vocabularies derived using either BPE, Wordpiece, or Unigram Language Model.
Subword tokenization algorithms allow us to address open vocabulary problems with fixed vocabulary resources.
