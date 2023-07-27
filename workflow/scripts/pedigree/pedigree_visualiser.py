import pandas as pd
import graphviz

def create_pedigree_graph(df):
    graph = graphviz.Digraph(format='pdf', engine='dot', graph_attr={'rankdir': 'TB', 'ranksep': '5'})

    # Add the parent nodes
    for parent in df["parent1"].unique().tolist() + df["parent2"].unique().tolist():
        graph.node(str(parent), str(parent))

    # Create the offspring nodes and connect them to the parent nodes
    for _, row in df.iterrows():
        offspring = row["offspring"]
        parent1 = row["parent1"]
        parent2 = row["parent2"]

        graph.node(str(offspring), str(offspring))
        graph.edge(str(parent1), str(offspring))
        graph.edge(str(parent2), str(offspring))

    return graph

if __name__ == "__main__":
    # Load the data from the tab-delimited file into a DataFrame
    filename = "/Users/josephinelovemachine/pedigree/sbpa_pedigree.txt"  
    df = pd.read_csv(filename, sep='\t')

    graph = create_pedigree_graph(df)

    # Save the pedigree graph as a PNG image
    output_file = "pedigree_graph.png"
    graph.attr(size='1000,2000')
    graph.render(output_file, view=True, cleanup=True)