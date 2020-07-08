library(tidyverse)

coffee_ratings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv')

summary <- coffee_ratings %>%
  group_by(country_of_origin) %>%
  summarise(count = n()) %>%
  arrange(-count) %>%
  head(20)

coffee_ratings %>%
  mutate(Region = case_when(country_of_origin %in% c('Ethiopia', 'Uganda', 'Kenya', 'Uganda', 'Tanzania, United Republic Of', 'Malawi') ~ 'Africa',
                            country_of_origin %in% c('Mexico', 'Colombia', 'Honduras', 'Costa Rica', 'El Salvador', 'Peru', 'Nicaragua', 'Guatemala', 'Brazil') ~ 'Latin America',
                            country_of_origin %in% c('United States (Hawaii)') ~ 'USA',
                            country_of_origin %in% c('Thailand', 'China', 'India', 'Taiwan', 'Indonesia') ~ 'Asia')) %>%
  filter(country_of_origin %in% summary$country_of_origin & cupper_points > 0) %>%
  mutate(country_of_origin = as.character(country_of_origin)) %>%
  ggplot(aes(y = cupper_points, x = reorder(country_of_origin, cupper_points), fill = Region)) +
  geom_boxplot(colour =  'beige', outlier.shape = NULL) +
  coord_flip() +
  custom_theme() +
  scale_fill_manual(values = c('#2C1503', '#9A7B4F', '#4A2512', '#7E481C')) +
  labs(y = 'Coffee Rating', x = '',
       title = 'Which Country Produces the Best Coffee?',
       subtitle = 'Distributions of coffee rankings by country and region')
