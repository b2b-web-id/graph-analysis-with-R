library(ggplot2)
thm <- theme_minimal() +
  theme(legend.position = "none", axis.title = element_blank(),
        axis.text = element_blank(), panel.grid = element_blank(),
        panel.grid.major = element_blank())
theme_set(thm)

library(ggraph)
graph_routes %>% 
  ggraph(layout = "kk") +
  geom_node_point() +
  geom_edge_diagonal()
graph_routes %>% 
  ggraph(layout = "kk") +
  geom_node_text(aes(label=label, color=name), size=3) +
  geom_edge_diagonal(color="gray", alpha=0.4)
