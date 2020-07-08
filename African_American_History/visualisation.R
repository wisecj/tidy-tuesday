
library(tidyverse)

census <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-06-16/census.csv')

h <- 2630782

census %>%
  filter(region %in% c('USA Total')) %>%
  gather(black_slaves, black_free, key = 'status', value = 'value') %>%
  ggplot(aes(x = year, y = value, fill = status)) +
  geom_area() +
  scale_fill_manual(values = c('green', 'maroon')) +
  custom_theme() +
  geom_hline(aes(yintercept=h)) +
  geom_text(aes(1850, h,label = h, vjust = -1)) +
  scale_y_continuous(label = scales::'comma') + 
  geom_vline(xintercept = 1865) +
  labs(title = "Growth of Slavery in the USA Between 1790 and 1870",
       subtitle = "Against the population of numerous capital cities at the same time")
