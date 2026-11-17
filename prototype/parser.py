"""Minimal prototype for Quantum Parse Syntax Grammar processing.

Pipeline (MVP): tokenize -> classify (heuristic) -> apply rules -> report.
"""
from __future__ import annotations
from dataclasses import dataclass, field
from pathlib import Path
import json, re, sys

LEXICON_PATH = Path(__file__).parent.parent / "data" / "lexicon" / "seed_v0.json"
RULES_PATH = Path(__file__).parent.parent / "data" / "rules" / "ruleset_v1.json"


@dataclass
class Token:
    text: str
    lower: str
    candidates: list[int] = field(default_factory=list)
    chosen: int | None = None


def load_lexicon():
    data = json.loads(LEXICON_PATH.read_text())
    lex = {}
    for entry in data:
        lex[entry["token"]] = [c["code"] for c in entry["candidates"]]
    return lex


def load_rules():
    return json.loads(RULES_PATH.read_text())


WORD_RE = re.compile(r"[A-Za-z']+|\d+|[^\w\s]")


def tokenize(text: str) -> list[Token]:
    return [Token(t, t.lower()) for t in WORD_RE.findall(text)]


def classify(tokens: list[Token], lexicon):
    for tok in tokens:
        tok.candidates = lexicon.get(tok.lower, [])
        # naive heuristic: choose first if exists else None
        tok.chosen = tok.candidates[0] if tok.candidates else None
    return tokens


def apply_rules(tokens: list[Token], rules):
    violations = []
    codes = [t.chosen for t in tokens]
    for rule in rules:
        if rule.get("pattern") == [2] and rule.get("constraint") == "NOT_AT_END":
            if tokens and tokens[-1].chosen == 2:
                violations.append({"rule": rule["id"], "index": len(tokens)-1})
            continue
        pat = rule.get("pattern")
        if not pat:
            continue
        win = len(pat)
        found = False
        for i in range(len(codes) - win + 1):
            segment = codes[i:i+win]
            if None in segment:
                continue
            if segment == pat:
                found = True
                break
        if not found:
            violations.append({"rule": rule["id"], "index": None})
    return violations


def report(text: str, tokens: list[Token], violations):
    lines = []
    lines.append(f"Original: {text}")
    lines.append("Tokens:")
    lines.append(" ".join(f"{t.text}/{t.chosen if t.chosen is not None else '-'}" for t in tokens))
    if violations:
        lines.append("Violations:")
        for v in violations:
            lines.append(f" - {v['rule']} at {v['index']}")
    else:
        lines.append("No violations detected (MVP rule set).")
    return "\n".join(lines)


def process(text: str) -> str:
    lex = load_lexicon()
    rules = load_rules()
    toks = classify(tokenize(text), lex)
    viol = apply_rules(toks, rules)
    return report(text, toks, viol)


def main():
    if len(sys.argv) < 2:
        print("Usage: parser.py 'Sentence to analyze.'")
        return 1
    text = " ".join(sys.argv[1:])
    print(process(text))
    return 0


if __name__ == "__main__":  # pragma: no cover
    raise SystemExit(main())
