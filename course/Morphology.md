# Morphology

- Type : an entry in a vocabulary (or a lexicon)
- Mention or token : an instance of a type in some text

- Morphology is the study of the ways that words are built up from smaller units called morphemes

  - morphemes are the minimal meaning-bearing units in a language

- We can divide morphemes into two classes

  - Stems: The core meaning-bearing units
  - Affixes: Bits and pieces that adhere to stems to change their meanings and grammatical function
  - So with "star_s", "star" is a stem and "s" is an affix that signals a plural. Both are morphemes

- Inflectional Morphology

  - Inflectional morphology concerns the combination of stems and affixes where the resulting word...
    - has the `same word class` as the original
    - And serves grammatical/semantic purpose that is
      - Different from the original
      - But is nevertheless transparently related to the original
        - walk + ing = walking
        - cat + s = cats

- Word Classes / Parts of Speech

  - Traditional parts of speech

    - Noun, verb, adjective, preposiotion, adverb...
      - there are various names for this notion

  - Three sources of evidence for part of speech categories
    1. Semantic
    2. Morphological evidence
    - walk, walking, walked, walks, -> probably verb?
    3. Distributional evidence
    - The crash, A crash, Two crashes, The big crash..
      - probably a noun since nouns follow determiners and adjectives
      - also followed by verbs.

- Derivational Morphology

  - Derivational morphology is the messy stuff that no one ever taught you ( at least not very well). It is charecterized by

    - Quasy-systematicity
    - Irregular menaing change
    - Change of word class

    - Example
      - Compute -> computer -> computerize -> computerization
      - But not all possibilities seems equally good (acceptable?)
        - Clue
          - Clue -> clueless
          - Clue -> clueful(?)

- Morphological Typology

  - How many morphems per word?
    - Isolating(analytics) vs Synthetic
      - Isolating tends toward one morpheme per word
      - Synthetic languages can jam lots of morphemes into a single word
        - Polysynthetic languages jam entire sentences into single words
  - How hard is to find the morphemes?
    - Agglutinating vs Fusional
      - Agglutinating form words by concatenating stems with affixes to form words(with prefixes, infixes or suffixes).
        Fusional languages allow the morphemes to change their form upon attachment, making it difficult to isolate them.

- Computational Morphology

  - Morphological analysis takes a surface form and returns the stem with a set of morphological features rather than just segmenting the surface form
    - Cats -> Cat + PL
    - Ate -> eat + PAST
  - Computationally capturing the morphology of any language is very very difficult and involves the use of probabilistic/weighted state machines and recurrent neural network
  - But for many languages like English and Chinese you can get away with simple approches.

- Recap
  - Morphology is the study of the ways that words are built up from smaller units called morphemems.
    Morphemes are minimal meaning-bearing units in a language.
  - Languages vary in how morphemes are combined to form surface words. These languages difference impact how NLP systems are designed and
    how likely those designs are to generalize across languages.
