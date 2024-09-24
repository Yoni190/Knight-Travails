require_relative 'lib/adjacency_list'

ad_list = AdjacencyList.new

ad_list.addNode("A")
ad_list.addNode("B")
ad_list.addNode("C")
ad_list.addNode("D")
ad_list.addNode("E")

ad_list.addEdge(0, 1)
ad_list.addEdge(1, 2)
ad_list.addEdge(1, 4)
ad_list.addEdge(2, 3)
ad_list.addEdge(2, 4)
ad_list.addEdge(4, 0)
ad_list.addEdge(4, 2)

#ad_list.to_s
puts ad_list