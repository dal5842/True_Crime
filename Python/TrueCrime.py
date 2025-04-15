import os
import nltk
from nltk.tokenize import word_tokenize
from nltk import pos_tag

nltk.download('punkt')
nltk.download('averaged_perceptron_tagger')

directory_path = "/Users/dannikalove/Documents/GitHub/True_Crime/EpisodesTxtFiles"

adjective_tags = {"JJ", "JJR", "JJS"}
verb_tags = {"VB", "VBD", "VBG", "VBN", "VBP", "VBZ"}

def extract_adjectives_and_verbs(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        text = file.read()
    tokens = word_tokenize(text)
    tagged = pos_tag(tokens)

    adjectives = [word for word, tag in tagged if tag in adjective_tags]
    verbs = [word for word, tag in tagged if tag in verb_tags]

    return adjectives, verbs

def main():
    for filename in os.listdir(directory_path):
        if filename.endswith(".txt"):
            file_path = os.path.join(directory_path, filename)
            adjectives, verbs = extract_adjectives_and_verbs(file_path)
            print(f"\nFile: {filename}")
            print(f"Adjectives ({len(adjectives)}): {', '.join(adjectives)}")
            print(f"Verbs ({len(verbs)}): {', '.join(verbs)}")

if __name__ == "__main__":
    main()