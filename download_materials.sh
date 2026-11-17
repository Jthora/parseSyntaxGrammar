#!/bin/bash

# Download Script for Parse Syntax Grammar Research Materials
# This script downloads publicly available materials related to David Wynn Miller's work

set -e

PROJECT_DIR="/Users/jono/Documents/GitHub/parseSyntaxGrammar"
SOURCE_DIR="$PROJECT_DIR/source-materials"
ACADEMIC_DIR="$PROJECT_DIR/academic-analysis"
LEGAL_DIR="$PROJECT_DIR/legal-documents"

echo "Starting download of Parse Syntax Grammar research materials..."

# Create subdirectories
mkdir -p "$SOURCE_DIR/academic-papers"
mkdir -p "$SOURCE_DIR/legal-documents" 
mkdir -p "$SOURCE_DIR/historical-archives"
mkdir -p "$SOURCE_DIR/primary-sources"

# Function to download with error handling
download_file() {
    local url=$1
    local output_path=$2
    local description=$3
    
    echo "Downloading: $description"
    echo "URL: $url"
    echo "Output: $output_path"
    
    if curl -L -o "$output_path" "$url"; then
        echo "✓ Successfully downloaded: $description"
    else
        echo "✗ Failed to download: $description"
    fi
    echo "---"
}

# Download academic papers
echo "Phase 1: Academic Papers and Legal Analysis"

# Alberta Law Review paper (if accessible)
download_file \
    "https://albertalawreview.com/index.php/ALR/article/download/2485/2470/2629" \
    "$SOURCE_DIR/academic-papers/alberta-law-review-opca-analysis.pdf" \
    "Alberta Law Review - Organized Pseudolegal Commercial Arguments"

# Download from Archive.org
echo "Phase 2: Historical Archives"

download_file \
    "https://archive.org/stream/hyper_number_5_5/hyper_number_5_5_djvu.txt" \
    "$SOURCE_DIR/historical-archives/hypercomplex-number-list.txt" \
    "Hypercomplex Number List with Miller references"

# Try to download some Scribd documents (public domain ones)
echo "Phase 3: Legal Documents"

# Note: Scribd documents may require authentication, these are fallback attempts
download_file \
    "https://ro.scribd.com/doc/29314671/David-Wynn-Miller-Flag-Jurisdiction" \
    "$SOURCE_DIR/legal-documents/flag-jurisdiction.html" \
    "David Wynn Miller Flag Jurisdiction Document"

# Wikipedia page for reference (publicly available)
echo "Phase 4: Reference Materials"

download_file \
    "https://en.wikipedia.org/wiki/David_Wynn_Miller" \
    "$SOURCE_DIR/primary-sources/wikipedia-david-wynn-miller.html" \
    "Wikipedia article on David Wynn Miller"

# Create a list of additional materials to investigate
cat > "$PROJECT_DIR/ADDITIONAL_MATERIALS_TO_INVESTIGATE.md" << 'EOF'
# Additional Materials Requiring Manual Investigation

## Scribd Documents (May Require Account)
1. David Wynn Miller - Flag Jurisdiction PDF
   - URL: https://ro.scribd.com/doc/29314671/David-Wynn-Miller-Flag-Jurisdiction
   - Content: Legal jurisdiction analysis using Parse Syntax Grammar

2. Postal Application Documents
   - URL: https://www.scribd.com/doc/256112707/Postal-Application
   - Content: Applications using Parse Syntax Grammar format

## Academic Databases
1. ResearchGate Papers
   - Search for: "David Wynn Miller" + "pseudolaw"
   - Multiple academic papers analyzing the phenomenon

2. CanLII Legal Database
   - URL: https://www.canlii.org/en/commentary/doc/2018CanLIIDocs90
   - Content: Legal commentary and case analysis

## Primary Source Websites
1. David Wynn Miller Book Website
   - URL: https://www.davidwynnmillerbook.com
   - Content: Official study materials and tools

2. Leonardo Edwards Study Guide
   - Website: www.leonardoedwards.com
   - Content: DAVID-WYNN: MILLER Study-Guide materials

## Court Documents and Legal Filings
1. PACER Database (US Federal Courts)
   - Search for cases involving David Wynn Miller
   - Look for documents using Parse Syntax Grammar

2. State Court Databases
   - Search for filings using the grammar system
   - Collect examples of practical applications

## Video and Audio Materials
1. YouTube Lectures and Seminars
   - Search: "David Wynn Miller Parse Syntax Grammar"
   - Educational content and explanations

2. Podcast Interviews and Discussions
   - Various platforms may have archived interviews
   - Look for technical explanations of the system

## International Sources
1. Canadian Legal Databases
   - Additional CanLII documents
   - Provincial court records

2. Other English-speaking Jurisdictions
   - Australia, New Zealand, UK legal databases
   - International applications of the system

## GitHub and Open Source
1. Additional Repositories
   - Search GitHub for "parse syntax grammar"
   - Look for implementations or analysis tools

2. Code Analysis Tools
   - Existing implementations to study
   - Verification algorithms

## Libraries and Archives
1. University Law Libraries
   - Academic theses on the subject
   - Specialized legal collections

2. National Archives
   - Government documents mentioning the system
   - Historical correspondence or analysis
EOF

echo "Download script completed!"
echo "Check the ADDITIONAL_MATERIALS_TO_INVESTIGATE.md file for materials requiring manual collection."
echo ""
echo "Next steps:"
echo "1. Review downloaded materials"
echo "2. Manually investigate additional sources"
echo "3. Begin mathematical analysis"
echo "4. Document findings systematically"
