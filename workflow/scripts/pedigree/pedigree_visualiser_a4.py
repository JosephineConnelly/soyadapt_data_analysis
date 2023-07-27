import pandas as pd
import graphviz

def create_pedigree_graph(df, graph_name):
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

    graph.attr(size='210,297')  # Set the size of the graph to A4 dimensions (in millimeters)
    graph.render(filename=graph_name, view=True, cleanup=True)

if __name__ == "__main__":
    # Load the data from the tab-delimited file into a DataFrame
    filename = "/Users/josephinelovemachine/pedigree/sbpa_pedigree.txt"  
    df = pd.read_csv(filename, sep='\t')

    # Create the pedigree graph and save it as a single PDF file that fits an A4 page
    a4_graph_name = "pedigree_graph_a4.pdf"
    create_pedigree_graph(df, a4_graph_name)
