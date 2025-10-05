# Morphology

## Learning objective

In which, we learn about the internal life of words.

## Key Terminology

- **Type**: An entry in a vocabulary (or a lexicon)
- **Mention or Token**: An instance of a type in some text
  - Example: In "the cat sat on the mat", the type "the" has 2 tokens

## What is Morphology?

Morphology is the study of the ways that words are built up from smaller units called **morphemes**.

- **Morphemes** are the minimal meaning-bearing units in a language
  - They cannot be broken down further without losing meaning
  - Example: "unbreakable" has 3 morphemes: un- + break + -able

## Types of Morphemes

We can divide morphemes into two main classes:

1. **Stems (or Roots)**: The core meaning-bearing units
   - Example: "book", "walk", "happy"
2. **Affixes**: Bits and pieces that adhere to stems to change their meanings and grammatical functions
   - **Prefixes**: Added before the stem (un-, re-, pre-)
   - **Suffixes**: Added after the stem (-s, -ing, -ed)
   - **Infixes**: Inserted within the stem (less common in English)
   - Example: In "stars", "star" is a stem and "-s" is an affix that signals plural. Both are morphemes

### Free vs Bound Morphemes

- **Free morphemes**: Can stand alone as words (cat, book, happy)
- **Bound morphemes**: Must attach to other morphemes (-s, -ing, un-, -ness)

## Inflectional Morphology

Inflectional morphology concerns the combination of stems and affixes where the resulting word:

- Has the **same word class** as the original
- Serves a grammatical/semantic purpose that is:
  - Different from the original
  - But nevertheless transparently related to the original

**Examples:**

- walk + -ing = walking (both verbs)
- cat + -s = cats (both nouns)
- big + -er = bigger (both adjectives)
- she + her = her (both pronouns)

**In English, inflectional affixes include:**

- Noun: -s (plural), -'s (possessive)
- Verb: -s (3rd person), -ed (past), -ing (progressive)
- Adjective: -er (comparative), -est (superlative)

## Word Classes / Parts of Speech

Traditional parts of speech include:

- **Noun**, **verb**, **adjective**, **preposition**, **adverb**, **pronoun**, **conjunction**, **determiner**, **interjection**
  - Various names exist for this notion: POS tags, word classes, syntactic categories

### Three Sources of Evidence for Part of Speech Categories

1. **Semantic Evidence**: Meaning-based classification

   - Nouns typically refer to people, places, things
   - Verbs typically refer to actions or states
   - Adjectives typically describe properties

2. **Morphological Evidence**: Based on affixes they can take

   - walk, walking, walked, walks → probably a verb (takes verbal inflections)
   - happy, happiness, unhappy, happier → probably an adjective

3. **Distributional Evidence**: Based on where they occur in sentences
   - "The crash", "A crash", "Two crashes", "The big crash"
     - Probably a noun since nouns follow determiners and adjectives
     - Also typically precede verbs in English sentences

## Derivational Morphology

Derivational morphology is the messy stuff that no one ever taught you (at least not very well). It is characterized by:

- **Quasi-systematicity**: Rules apply in some cases but not others
- **Irregular meaning change**: The meaning shift can be unpredictable
- **Change of word class**: Unlike inflection, derivation often changes POS

**Examples:**

- compute (V) → computer (N) → computerize (V) → computerization (N)
- But not all possibilities are equally acceptable:
  - happy → happiness ✓
  - happy → happyness ✗
  - clue → clueless ✓
  - clue → clueful ✗ (not standard)

**Common derivational affixes in English:**

- Noun-forming: -ness, -tion, -er, -ity, -ment
- Verb-forming: -ize, -ify, -en
- Adjective-forming: -able, -ful, -less, -ous, -al
- Adverb-forming: -ly

## Morphological Typology

Languages can be classified by how they use morphemes:

### 1. How many morphemes per word?

**Isolating (Analytic) vs Synthetic**

- **Isolating**: Tend toward one morpheme per word
  - Example: Mandarin Chinese, Vietnamese
  - "我 看 了 书" (I see PAST book) = "I saw a book"
- **Synthetic**: Can combine many morphemes into a single word
  - Example: Turkish, Finnish, Russian
  - Turkish: "evlerimizden" = ev-ler-imiz-den = house-PL-our-from = "from our houses"
- **Polysynthetic**: Extreme synthetic languages that can express entire sentences in single words
  - Example: Inuktitut, Mohawk
  - Inuktitut: "Tusaatsiarunnanngittualuujunga" = "I can't hear very well"

### 2. How easy is it to find the morphemes?

**Agglutinating vs Fusional**

- **Agglutinating**: Form words by concatenating stems with affixes (with prefixes, infixes, or suffixes)
  - Morpheme boundaries are clear and regular
  - Each affix has one clear meaning
  - Example: Turkish "ev-ler-de" = house-PL-at = "at houses"
- **Fusional**: Morphemes change their form upon attachment, making it difficult to isolate them
  - Multiple meanings may be fused into one affix
  - Example: Latin "amo" (I love), "amas" (you love) – the -o/-as endings combine person, number, and tense

## Computational Morphology

### Goals

Morphological analysis takes a surface form and returns the stem with a set of morphological features (rather than just segmenting the surface form):

- cats → cat + PLURAL
- ate → eat + PAST
- running → run + PROGRESSIVE
- better → good + COMPARATIVE

### Approaches

1. **Rule-based approaches**:

   - Finite State Transducers (FSTs)
   - Two-level morphology
   - Work well for well-studied languages with regular morphology

2. **Data-driven approaches**:

   - Machine learning models
   - Neural sequence-to-sequence models
   - Subword tokenization (BPE, WordPiece, SentencePiece)

3. **Hybrid approaches**: Combining rules and statistics

### Challenges

- Computationally capturing the morphology of any language is very difficult and involves:
  - Probabilistic/weighted finite state machines
  - Recurrent neural networks (RNNs, LSTMs)
  - Transformer models
- However, for morphologically simpler languages like English and Chinese, you can get away with simpler approaches
  - Basic stemming algorithms (Porter, Lancaster)
  - Lemmatization with lookup tables
  - Simple affix-stripping rules

## Recap

- Morphology is the study of the ways that words are built up from smaller units called **morphemes**. Morphemes are minimal meaning-bearing units in a language.

- Languages vary in how morphemes are combined to form surface words. These language differences impact how NLP systems are designed and how likely those designs are to generalize across languages.

- Understanding morphology is crucial for:
  - Text normalization and preprocessing
  - Information retrieval and search
  - Machine translation
  - Language generation
  - Cross-lingual NLP applications
