# Text Normalization

## Learning objective

In which, we learn the difficulties involved in simple text pre-processing and normalization.

## Corpora and Text Normaliztion

Every NLP application needs to do some form of text normalization.

Not terribly glamorous but critical to further processing and often the source of numerous headaches.

- segmanting running text into sentences
- Tokeninzing sentences into words
- Normalizing word formts
- Recognizing differnt scripts/languages

- Producing consistent steram of tokens given raw text inputs
- Determining a fixed useful vocabulary

## Simple Tokenization in UNIX

- Given a corpus as a single text file, output all the unique word types and their asscociated frequencies.
- Turns out unix shell has many commands to deal with basic text processing operations. Making this a pretty easy task to do in a crude fashion.

```bash
# Count the number of lines, words, and characters in the file
wc shakespeare.txt
```

```bash
# Output all the words in the file. by translate all non-alphanumeric characters to newlines.
tr -sc A-Za-z '\n' < shakespeare.txt
```

```bash
# Output all the unique words in the file. by translate all non-alphanumeric characters to newlines.
tr -sc A-Za-z '\n' < shakespeare.txt | sort | uniq | head
```

```bash
# Output the number of unique words in the file. by translate all non-alphanumeric characters to newlines.
tr -sc A-Za-z '\n' < shakespeare.txt | sort | uniq | wc -l
```

```bash
# Output the number of unique words in the file. by translate all non-alphanumeric characters to newlines.
tr -sc 'a-z' '\n' < shakespeare.txt | sort | uniq -c
```

```bash
# Output the 25 most frequent words in the file. by translate all non-alphanumeric characters to newlines.
tr -sc 'a-z' '\n' < shakespeare.txt | sort | uniq -c | sort -rn | head -25
```

## Corpora

Words don't just appear out of nowhere.

- In building NLP systems, we make use of representative texts(Corpora) - either generically, for use with diverse applcations, or designed for a specific domain or application.
- But texts are produced by specific writer(s), at a specific times, in a variety of languages, for specific functions. All of which combine combinatorially. All of these factors matter for system design.

## Dimension of Corpora

- Language

  - 7097 languages in the world (not all have written form)
  - Dialects, creoles, pidgins, etc.

- Demographic

  - Writer's age, gender, race, socioeconomic status, etc.

- Provenance

  - How wad it obtained? Was there consent? Was it collected legally?

- Medium
  - Spoken, written, captioned, etc

## How many words are there?

N = number of tokens
V = vocabulary = set of types
|V| is the size of the vocabulary

| Corpus                          | Tokens      | Types |
| ------------------------------- | ----------- | ----- |
| Switchboard phone conversations | 2.4 million | 20K   |
| Shakespeare's plays             | 884,000     | 23K   |
| Common Crawl                    | 600 billion | 1.9M  |
| Google N-gram corpus            | 1 trillion  | 13M   |

## Heaps' Law

- Roughly, the size of the vocabulary grows somewhat faster than the square root of the corpus size.

- `|V| = k \* N^b`

- where `k` and `b` are free variables. Usually `k` is between 10 and 100, and `b` is between 0.6 and 0.7.
- which really means that thee rate of growth of the vocabulary tails off as the corpus grows in size but never flattens out.

## Sentence Segmentation

- Tokenization, morphology and further syntactic processing first requires sentence segmentation.
- In English, punctuation is used to mark sentence boundaries.
- !, ? are relatively unambiguous.
- period . is quite ambiguous.
  - numbers like 0.2
  - abbreviations like Dr.
  - Acronyms like U.N

## Multilingual Issues in Normalization

Thus far our disscussion have focused on written English texts.
But English is not the only language out there and even applications focused on English need to deal with other languages.
Among the issues to be faced:

- Code switching
  - Mixing languages in the same utterance
  - ex) Spanish-English
  - ex) Hindi-English
- Wtring systems

  - Unicode supports
  - Latin, Chinese, Arabic, Greek, Korean, Japanese, etc.

- Complex morphology

  - Many languages require complex morphological analysis. Turkish for example is highly agglutinating.
  - Simply taking each space-delimited surface form as a word is not be a reasonable for agglutinating languages.

- Word segmantation
  - Meanwhile Chinese/thai/japanes do not use spaces to separate words.
  - use maximum matching word segmantation is a reasonable approach.
  - greedy maximum matching is a simple approach.

## Recap

NLP applications need to do some pre-processing, or normalization, of text to standardize it prior to any further processing.
This requires attention to myriad facts about language, writing systems, and text encoding standards.
