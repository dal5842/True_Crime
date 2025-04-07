import xml.etree.ElementTree as ET
from xml.sax.saxutils import escape

# Load and parse XML
tree = ET.parse("GlennCoded.xml")
root = tree.getroot()

# Extract all speaker lines
lines_collected = []
for scene in root.findall(".//scene"):
    for speaker_elem in scene.findall("speaker"):
        line_text = scene.findtext("line", default="")
        if line_text:
            speaker = speaker_elem.text.strip() if speaker_elem.text else "Unknown"
            lines_collected.append((speaker, line_text.strip()))

# Sort by line length, get top 3
top_quotes = sorted(lines_collected, key=lambda x: len(x[1]), reverse=True)[:3]

# Generate SVGs
for i, (speaker, quote) in enumerate(top_quotes, start=1):
    speaker = escape(speaker)
    quote = escape(quote)
    svg_content = f'''<svg width="800" height="400" xmlns="http://www.w3.org/2000/svg">
  <style>
    .quote {{ font: italic 20px serif; fill: #333; }}
    .speaker {{ font: bold 24px sans-serif; fill: #005; }}
    .background {{ fill: #f9f9f9; }}
  </style>
  <rect width="100%" height="100%" class="background"/>
  <text x="50%" y="60" class="speaker" text-anchor="middle">{speaker}</text>
  <foreignObject x="50" y="100" width="700" height="280">
    <div xmlns="http://www.w3.org/1999/xhtml" style="font-family:serif; font-size:18px; color:#333; text-align:center;">
      <p>{quote}</p>
    </div>
  </foreignObject>
</svg>
'''
    # Save each as a different file
    filename = f"quote_{i}.svg"
    with open(filename, "w", encoding="utf-8") as f:
        f.write(svg_content)
    print(f"Saved: {filename}")
