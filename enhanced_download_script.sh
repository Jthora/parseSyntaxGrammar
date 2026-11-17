#!/bin/bash

# Enhanced Download Script for Parse Syntax Grammar Research
# This script downloads materials from the comprehensive sources we've identified

set -e

PROJECT_DIR="/Users/jono/Documents/GitHub/parseSyntaxGrammar"
SOURCE_DIR="$PROJECT_DIR/source-materials"

echo "Enhanced Parse Syntax Grammar Materials Download..."

# Create detailed subdirectories
mkdir -p "$SOURCE_DIR/smallchangebigprofits-archive"
mkdir -p "$SOURCE_DIR/study-guides"
mkdir -p "$SOURCE_DIR/court-transcripts"
mkdir -p "$SOURCE_DIR/video-audio-materials"
mkdir -p "$SOURCE_DIR/international-sources"
mkdir -p "$SOURCE_DIR/war-castles-materials"
mkdir -p "$SOURCE_DIR/technical-implementations"

# Function to download with better error handling and logging
download_with_logging() {
    local url=$1
    local output_path=$2
    local description=$3
    
    echo "=== Downloading: $description ==="
    echo "URL: $url"
    echo "Output: $output_path"
    echo "Timestamp: $(date)"
    
    # Try multiple methods for downloading
    if command -v wget >/dev/null 2>&1; then
        if wget -O "$output_path" "$url"; then
            echo "✓ SUCCESS (wget): $description"
            echo "File size: $(wc -c < "$output_path") bytes"
        else
            echo "✗ FAILED (wget): $description"
            return 1
        fi
    elif command -v curl >/dev/null 2>&1; then
        if curl -L -o "$output_path" "$url"; then
            echo "✓ SUCCESS (curl): $description"
            echo "File size: $(wc -c < "$output_path") bytes"
        else
            echo "✗ FAILED (curl): $description"
            return 1
        fi
    else
        echo "✗ ERROR: No download tool available (wget or curl needed)"
        return 1
    fi
    echo "================================================="
    echo ""
}

# SmallChangeBigProfits.com Articles - Key Learning Materials
echo "Phase 1: Core Learning Materials from SmallChangeBigProfits.com"

# Core foundational articles
download_with_logging \
    "https://smallchangebigprofits.com/learning-quantum-grammar-parse-syntax-part-one/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/learning-quantum-grammar-part-one.html" \
    "Learning Quantum Grammar - Part One"

download_with_logging \
    "https://smallchangebigprofits.com/what-is-and-why-learn-quantum-grammar/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/what-is-why-learn-quantum-grammar.html" \
    "What is, and Why Learn Quantum Grammar?"

download_with_logging \
    "https://smallchangebigprofits.com/quantum-syntax-grammar-empowers-you-in-any-contracts/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/quantum-syntax-grammar-empowers-you.html" \
    "Quantum Syntax Grammar Empowers You"

download_with_logging \
    "https://smallchangebigprofits.com/parse-syntax-grammar-to-correct-laws-empowers-you/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/parse-syntax-grammar-to-correct-laws.html" \
    "How To Use Parse Syntax Grammar To Correct Laws"

download_with_logging \
    "https://smallchangebigprofits.com/certify-correct-sentences-in-quantum-using-mathematical-interface/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/certify-correct-sentences-mathematical-interface.html" \
    "Certify Correct Sentences in Quantum using Mathematical Interface"

download_with_logging \
    "https://smallchangebigprofits.com/dwm-secrets-of-syntax-proving-there-is-no-such-thing-as-a-legal-contract/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/dwm-secrets-of-syntax.html" \
    "DWM Secrets of Syntax"

download_with_logging \
    "https://smallchangebigprofits.com/brain-changes-by-learning-quantum-grammar-csscpsg/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/brain-changes-learning-quantum-grammar.html" \
    "Brain Changes By Learning Quantum Grammar"

download_with_logging \
    "https://smallchangebigprofits.com/quantum-parse-syntax-grammar/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/high-school-english-vs-quantum-grammar.html" \
    "High School English Vs Quantum Grammar"

# Legal and Court Applications
echo "Phase 2: Legal and Court Applications"

download_with_logging \
    "https://smallchangebigprofits.com/how-to-handle-lawyers-insurance-claims-with-parse-syntax-grammar/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/handle-lawyers-insurance-claims.html" \
    "How To Handle Lawyers & Insurance Claims"

download_with_logging \
    "https://smallchangebigprofits.com/quantum-lawsuits-writing-with-correct-sentence-structure-grammar/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/writing-quantum-lawsuits.html" \
    "Writing Quantum Lawsuits"

download_with_logging \
    "https://smallchangebigprofits.com/how-to-syntax-justice-avoids-traps-in-court-legal-system/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/how-to-syntax-justice.html" \
    "How to Syntax Justice"

download_with_logging \
    "https://smallchangebigprofits.com/bill-clinton-using-parse-syntax-grammar/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/bill-clinton-using-parse-syntax-grammar.html" \
    "Bill Clinton Using Parse Syntax Grammar"

# Banking and Commercial Applications  
echo "Phase 3: Banking and Commercial Applications"

download_with_logging \
    "https://smallchangebigprofits.com/post-office-banking-parse-syntax-grammar-contracts/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/post-office-banking-parse-syntax-grammar.html" \
    "Post Office Banking & Parse Syntax Grammar"

download_with_logging \
    "https://smallchangebigprofits.com/mortgage-arrears-default-notices-to-get-the-bank-stressing/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/get-bank-stressing-over-mortgage.html" \
    "How To Get The Bank Stressing Over Your Mortgage"

download_with_logging \
    "https://smallchangebigprofits.com/dangers-of-dodgy-bank-contracts/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/qualified-for-bank-compensation.html" \
    "Qualified For Bank's $750,000 Compensation"

# Philosophical and Analysis Articles
echo "Phase 4: Deep Analysis and Philosophical Materials"

download_with_logging \
    "https://smallchangebigprofits.com/deep-state-mafia-dominates-governments-all-around-the-world/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/deep-state-mafia-dominates-governments.html" \
    "Deep State Mafia Dominates Governments Globally"

download_with_logging \
    "https://smallchangebigprofits.com/post-office-controls-all-government-and-militaries-planet-wide/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/post-office-controls-all-government.html" \
    "Post Office Controls All Government"

download_with_logging \
    "https://smallchangebigprofits.com/quantum-grammar-facts-good-bad-ugly/" \
    "$SOURCE_DIR/smallchangebigprofits-archive/quantum-grammar-facts-good-bad-ugly.html" \
    "Quantum Grammar Facts, Good Bad & Ugly"

# War Castles Materials
echo "Phase 5: War Castles Documentary Materials"

download_with_logging \
    "https://smallchangebigprofits.com/war-castles-documentary-series-by-robert-leroy-horton/" \
    "$SOURCE_DIR/war-castles-materials/war-castles-documentary-overview.html" \
    "War Castles Documentary Series Overview"

download_with_logging \
    "https://smallchangebigprofits.com/birth-certificate-system-war-castles/" \
    "$SOURCE_DIR/war-castles-materials/birth-certificate-system-war-castles.html" \
    "Birth Certificate System – War Castles"

download_with_logging \
    "https://smallchangebigprofits.com/quantum-fraud-grammar-revealed-war-castles-part-3/" \
    "$SOURCE_DIR/war-castles-materials/quantum-grammar-fraud-war-castles.html" \
    "Quantum Grammar Fraud [War Castles]"

# Court Transcripts and Legal Documents
echo "Phase 6: Court Transcripts and Legal Analysis"

download_with_logging \
    "https://smallchangebigprofits.com/dwms-correct-sentence-structure-frees-you-from-bondage-by-grammar/" \
    "$SOURCE_DIR/court-transcripts/dwm-court-transcript-analysis.html" \
    "DWM Court Transcript Analysis"

# International and Academic Sources
echo "Phase 7: International Academic Sources"

# Try to download additional academic papers if accessible
download_with_logging \
    "https://www.canlii.org/en/commentary/doc/2018CanLIIDocs90" \
    "$SOURCE_DIR/international-sources/canlii-pseudolegal-analysis.html" \
    "CanLII Pseudolegal Commercial Arguments Analysis"

# Try alternate download methods for academic papers
download_with_logging \
    "https://freemandelusion.com/wp-content/uploads/2020/09/history-opca-canada.pdf" \
    "$SOURCE_DIR/international-sources/history-opca-canada.pdf" \
    "History of OPCA in Canada"

# Create a comprehensive index of all downloaded materials
echo "Phase 8: Creating Material Index"

cat > "$PROJECT_DIR/DOWNLOADED_MATERIALS_INDEX.md" << 'EOF'
# Comprehensive Index of Downloaded Parse Syntax Grammar Materials

## Date Generated
Generated on: $(date)

## Core Learning Materials (SmallChangeBigProfits.com Archive)

### Foundational Articles
- Learning Quantum Grammar - Part One
- What is, and Why Learn Quantum Grammar?  
- Quantum Syntax Grammar Empowers You
- How To Use Parse Syntax Grammar To Correct Laws
- Certify Correct Sentences in Quantum using Mathematical Interface
- DWM Secrets of Syntax
- Brain Changes By Learning Quantum Grammar
- High School English Vs Quantum Grammar

### Legal Applications
- How To Handle Lawyers & Insurance Claims
- Writing Quantum Lawsuits
- How to Syntax Justice  
- Bill Clinton Using Parse Syntax Grammar
- Court transcript analysis and legal document examples

### Commercial/Banking Applications
- Post Office Banking & Parse Syntax Grammar
- How To Get The Bank Stressing Over Your Mortgage
- Qualified For Bank's $750,000 Compensation

### Analysis and Philosophy
- Deep State Mafia Dominates Governments Globally
- Post Office Controls All Government
- Quantum Grammar Facts, Good Bad & Ugly

## War Castles Materials
- Documentary series overview and analysis
- Birth Certificate System analysis
- Quantum Grammar Fraud investigation

## Academic and Legal Analysis
- CanLII legal database materials
- Court transcripts and judicial responses
- International legal commentary

## Technical Implementation
- Mathematical Interface for Language (GitHub repository)
- C++ implementation and source code
- Algorithmic approaches to grammar parsing

## File Organization
All materials are organized in the following directory structure:

```
/source-materials/
├── MathematicalInterfaceForLanguage/          # GitHub repository
├── smallchangebigprofits-archive/             # Core study materials
├── academic-papers/                           # Scholarly analysis
├── legal-documents/                           # Court filings and transcripts
├── historical-archives/                       # Archive.org materials
├── primary-sources/                           # Wikipedia and reference
├── study-guides/                              # Learning materials
├── court-transcripts/                         # Legal proceedings
├── video-audio-materials/                     # Multimedia content
├── international-sources/                     # Global academic sources
├── war-castles-materials/                     # Related documentary materials
└── technical-implementations/                 # Programming implementations
```

## Research Status

### Successfully Downloaded
✓ Mathematical Interface for Language repository
✓ Alberta Law Review OPCA analysis
✓ Archive.org historical materials  
✓ Wikipedia reference materials
✓ Core SmallChangeBigProfits.com articles
✓ Court transcript materials
✓ International legal analysis

### Pending Manual Collection
□ Official David Wynn Miller book (requires purchase)
□ Audio/video seminar materials
□ Additional court documents from PACER
□ International court database materials
□ Community study group materials

### Analysis Ready
All downloaded materials are ready for:
- Mathematical consistency analysis
- Logical framework verification  
- Institutional bias documentation
- Comparative linguistic study
- Legal effectiveness evaluation

## Next Steps
1. Parse and analyze all downloaded materials
2. Extract key mathematical concepts and rules
3. Identify patterns of institutional resistance
4. Begin formal proof development
5. Cross-reference claims with evidence
EOF

# Statistics and completion summary
echo ""
echo "==============================================="
echo "DOWNLOAD SCRIPT COMPLETION SUMMARY"
echo "==============================================="
echo "Timestamp: $(date)"
echo "Total files in source-materials directory:"
find "$SOURCE_DIR" -type f | wc -l
echo ""
echo "Directory sizes:"
du -sh "$SOURCE_DIR"/* 2>/dev/null || echo "Size calculation pending..."
echo ""
echo "Materials successfully organized for analysis:"
echo "✓ Core educational materials (SmallChangeBigProfits archive)"
echo "✓ Mathematical interface implementation (GitHub)"  
echo "✓ Academic papers and legal analysis"
echo "✓ Court transcripts and applications"
echo "✓ War Castles related materials"
echo "✓ International sources and commentary"
echo ""
echo "Ready to begin mathematical proof development!"
echo "See DOWNLOADED_MATERIALS_INDEX.md for complete inventory."
echo "==============================================="
