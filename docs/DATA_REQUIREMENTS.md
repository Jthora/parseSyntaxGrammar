# Data Requirements & Acquisition Plan

## 1. Lexicon
Purpose: Map surface forms to candidate numeric categories (0–9) + attributes.
Fields (see schema JSON in `data/lexicon/schema_v1.json`):
- token (lowercase)
- candidates: [ { code, weight, notes } ]
- morphological: { suffixes, prefixes, is_plural, is_past }
- flags: { time_marker, positional, article_like }

Sources:
1. Curated list from Mathematical Interface definitions.
2. Frequency-based augmentation (top N words) flagged for manual review.
3. User feedback additions (append-only log then curated merge).

## 2. Annotated Sentences
Goal: 100 seed sentences with gold category sequences and violation annotations.
Format: JSON Lines -> one object per sentence including: original, tokens[], gold_codes[], violations[].

## 3. Rule Set JSON
Separate file `data/rules/ruleset_v1.json` capturing minimal required constraints.

## 4. Evaluation Metrics
- Validity ratio (# fully valid / total)
- Average violations per sentence
- Ambiguity score (mean branching factor during classification)

## 5. Provenance Tracking
Each lexicon entry includes `source` & optional `added_by` with timestamp.

## Acquisition Todo
1. Draft seed lexicon (core functional words) -> v0.
2. Add 20 sample sentences (cover each category) -> tests.
3. Encode core rules (sequence + no dangling verb endings) -> ruleset.
