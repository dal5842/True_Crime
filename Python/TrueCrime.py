import spacy
import pandas as pd
import os
import nltk
from nltk.corpus import wordnet as wn

# Load spaCy language model
nlp = spacy.load("en_core_web_md")

# Set the directory containing your .txt files
directory_path = "../dialogue-only-text"

# Function to extract adjectives, verbs, proper nouns, and named entities
def extract_features(words, unit):
    wordList = []
    node_types = []
    synset_counts = []
    units = []

    # Adjectives, verbs, and proper nouns
    for token in words:
        if token.pos_ in ["ADJ", "VERB", "PRON"]:
            lemma = token.lemma_ if token.pos_ != "PRON" else token.text
            wn_pos = wn.ADJ if token.pos_ == "ADJ" else wn.VERB if token.pos_ == "VERB" else None
            synsets = len(wn.synsets(lemma, pos=wn_pos)) if wn_pos else 0
            wordList.append(lemma)
            node_types.append(token.pos_)
            synset_counts.append(synsets)
            units.append(unit)

    # Named entities
    for ent in words.ents:
        wordList.append(ent.text)
        node_types.append(f"ENTITY:{ent.label_}")
        synset_counts.append(0)
        units.append(unit)

    return pd.DataFrame({
        "word": wordList,
        "nodeType": node_types,
        "synsetCount": synset_counts,
        "unit": units
    })

# Main logic to process all files
all_data = []

for filename in os.listdir(directory_path):
    if filename.endswith(".txt"):
        filepath = os.path.join(directory_path, filename)
        with open(filepath, 'r', encoding='utf-8') as file:
            text = file.read()
            words = nlp(text)
            unit_name = os.path.splitext(filename)[0]
            df = extract_features(words, unit_name)
            all_data.append(df)

# Combine into one DataFrame
combined_df = pd.concat(all_data, ignore_index=True)

# Save to output TSV
output_folder = os.path.join(directory_path, "output")
os.makedirs(output_folder, exist_ok=True)

output_path = os.path.join(output_folder, "dialogues.tsv")
combined_df.to_csv(output_path, sep='\t', index=False)

print(f"✅ TSV with adjectives, verbs, proper nouns, and entities saved to: {output_path}")