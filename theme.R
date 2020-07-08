
custom_theme <- function() {
  theme(plot.title = element_text(family="serif", face="bold", size=20),
        plot.subtitle = element_text(family = 'serif', size = 10),
        axis.text = element_text(family = 'serif', size = 10),
        panel.border     = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        # show axes
        axis.line      = element_line(colour = "black"),
        # match legend key to panel.background
        legend.key       = element_blank(),
        # simple, black and white strips
        strip.background = element_rect(fill = "white"))
}
