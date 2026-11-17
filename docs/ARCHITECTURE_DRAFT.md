# Architecture Draft (Quantum Parse Syntax Grammar Engine)

## High-Level Pipeline
1. Ingest Text (raw, PDF -> text normalization)
2. Preprocess (sentence split, tokenization, casing, punctuation tagging)
3. Lexical Classification (map tokens to candidate categories 0–9 + meta features)
4. Phrase Assembly (detect/preposition-article-noun triplets, flag dangling constructs)
5. Syntax Validation (rule engine verifying mathematical interface constraints)
6. Transformation (rewrite into Correct-Sentence-Structure-Communication format)
7. Scoring & Diagnostics (per sentence: validity, violations, ambiguity index)
8. Output (annotated text, JSON graph, human report, CLI summary)

## Core Components
| Component | Purpose |
|-----------|---------|
| Tokenizer | Deterministic split preserving indices |
| Lexicon Store | Fast lookup of base category candidates + morphological hints |
| Classifier | Heuristic + statistical backoff (later ML) |
| Rule Engine | Encodes sequence & dependency constraints (5>6>7 etc.) |
| Transformer | Applies canonical ordering / inserts missing positional terms |
| Validator | Aggregates rule checks into scores |
| CLI / API | User interface surfaces |

## Data Model (Sentence Graph)
Nodes: tokens (surface, lemma, base_cat_set, chosen_cat, position)
Edges: (DEP, PHRASE_GROUP, MODIFIES, VIOLATION_REF)
Metadata: sentence_id, original_text, transformed_text, scores{}

## Rule Encoding Strategy
Represent each rule as JSON:
```
{
  "id": "RULE_PREP_ART_NOUN",
  "pattern": [5,6,7],
  "must_be_contiguous": true,
  "description": "Preposition must be followed by Article then Noun",
  "severity": 0.9
}
```
Evaluation engine slides a window; mismatches produce violation objects.

## Extensibility
Phase 1: Deterministic heuristics
Phase 2: Confidence scoring (probabilistic re-ranking)
Phase 3: Active learning with annotated corpus (feedback loop)

## Assumptions (Draft)
1. English focus first; multilingual later.
2. No external heavy NLP libs required for MVP (keeps reproducibility simple).
3. Original source material retained unmodified under `source-materials/`.

## Next Build Steps
Short-term: (a) finalize lexicon schema, (b) implement tokenizer & lexicon loader, (c) minimal rule engine, (d) sample annotated tests.
