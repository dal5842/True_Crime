import pandas as pd
import networkx as nx
from pyvis.network import Network

# Load the data
df = pd.read_csv('../TSV/dialougeoutputTSV/dialogues.tsv', sep='\t')

# Initialize a graph
G = nx.Graph()

# Create sets to distinguish node types
word_nodes = set()
nodeType_nodes = set()

# Add nodes and edges
for _, row in df.iterrows():
    word = str(row['word']).strip()
    node_type = str(row['nodeType']).strip()
    synset_count = row['synsetCount']
    unit = str(row['unit']).strip()

    # Add the word (target node) with synsetCount
    if word not in G:
        G.add_node(word, type='word', synsetCount=synset_count)
        word_nodes.add(word)

    # Add the nodeType (source node) with unit as attribute
    node_id = f"{node_type}_{unit}"
    if node_id not in G:
        G.add_node(node_id, type='nodeType', nodeType=node_type, unit=unit)
        nodeType_nodes.add(node_id)

    # Add edge between nodeType and word
    G.add_edge(node_id, word)

# Create interactive visualization
net = Network(height='750px', width='100%', bgcolor='#222222', font_color='white')
net.from_nx(G)

# Optionally improve layout
net.repulsion(node_distance=150, central_gravity=0.2)

# Save and show the network
net.show('word_network.html')