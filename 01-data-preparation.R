library(dplyr)
routes <- small_trains %>% 
  group_by(departure_station, arrival_station) %>% 
  summarise(journey_time = mean(journey_time_avg)) %>% 
  ungroup() %>% 
  mutate(from=departure_station, to=arrival_station) %>% 
  select(from, to, journey_time)
routes

library(tidygraph)
graph_routes <- as_tbl_graph(routes)
graph_routes

library(stringr)
graph_routes <- graph_routes %>% 
  activate(nodes) %>% 
  mutate(title=str_to_title(name), label=str_replace_all(title, " ", "\n"))
graph_routes
stations <- graph_routes %>% 
  activate(nodes) %>% 
  pull(title)
stations
