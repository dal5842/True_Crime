# SVG Quotes Steps from XML Glenn


This project parses an XML transcript file and generates SVG image files of the 3 longest quotes in the dialogue.

Each quote is:
- Centered visually in an 800×400 SVG canvas
- Styled with the speaker's name at the top
- Displayed in a clean, serif font
- Saved as a separate SVG file (`quote_1.svg`, `quote_2.svg`, `quote_3.svg`)



## How It Works

1. The script loads and parses the XML file (e.g., `GlennCoded.xml`).
2. It extracts all speaker–line pairs.
3. Quotes are sorted by length (in characters).
4. The top 3 longest quotes are selected.
5. For each quote, an SVG file is generated with:
   - Light gray background
   - Speaker's name in bold
   - Quote in centered text block



## Files

- `GlennCoded.xml` — The original transcript file.
- `svgscript.py` — Python script that performs the parsing and SVG generation.
- `quote_1.svg`, `quote_2.svg`, `quote_3.svg` — Output files with the top 3 quotes.





