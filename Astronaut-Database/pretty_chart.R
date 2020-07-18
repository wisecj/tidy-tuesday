library(tidyverse)
library(ggridges)

astronauts <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-14/astronauts.csv')

astronauts %>%
  group_by(nationality, mission_title, year_of_mission) %>%
  summarise(total_hrs_mission = mean(hours_mission)) %>%
  mutate(nation = case_when(nationality == 'U.S.S.R/Russia' ~ 'Russia',
                            TRUE ~ 'Worldwide - excl. Russia')) %>%
  mutate(decade = ordered(floor(year_of_mission/10)*10, levels = rev(c('1960', '1970', '1980', '1990', '2000', '2010', '2020')))) %>%
  ggplot(aes(x = total_hrs_mission, y = decade, fill = nation, group == nation, colour = nation)) +
  geom_density_ridges(alpha = 0.7, quantiles = 2) +
  custom_theme_black() +
  scale_color_manual(values = c("#FF2D21", "#22FF00")) + 
  scale_fill_manual(values = c("#FF2D21", "#22FF00")) +
  labs(title = 'Development of Russian Space Travel',
       subtitle = 'How Russian space missions became longer before the rest of the world',
       y = 'Decade',
       x = 'Average time astronauts spent in space per mission')
