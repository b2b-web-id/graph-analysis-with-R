from <- which(stations == "Arras")
to <- which(stations == "Nancy")

shortest <- graph_routes %>% 
  morph(to_shortest_path, from, to, weights=journey_time)
shortest

shortest %>% 
  mutate(selected_node=TRUE) %>% 
  unmorph()

shortest <- shortest %>% 
  mutate(selected_node=TRUE) %>% 
  activate(edges) %>% 
  mutate(selected_edge=TRUE) %>% 
  unmorph()
shortest

shortest <- shortest %>% 
  activate(nodes) %>% 
  mutate(selected_node=ifelse(is.na(selected_node),1,2)) %>% 
  activate(edges) %>% 
  mutate(selected_edge=ifelse(is.na(selected_edge),1,2)) %>% 
  arrange(selected_edge)
shortest

shortest %>% 
  ggraph(layout="kk") +
  geom_edge_diagonal(aes(alpha=selected_edge), color="gray") +
  geom_node_text(aes(label=label, color=name, alpha=selected_node),
                 size=3)

shortest %>% 
  activate(edges) %>% 
  filter(selected_edge == 2) %>% 
  as_tibble() %>% 
  summarise(total_stops=n()-1,
            total_time=round(sum(journey_time)/60))
