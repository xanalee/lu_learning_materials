# Possible answer final challenge lecture 2

library(ggplot2)

ggplot(data = mtcars,
       mapping = aes(x = disp,
                     y = mpg,
                     shape = as.factor(cyl),
                     color = hp,
                     size = wt)) + 
  geom_point() + # no lines around the shapes
  labs(
    x = "displacement (cu. in.)",
    y = "fuel efficiency (mpg)",
    shape = "cylinders",
    color = "power (hp)",
    size = "weight (1000lbs)"
  ) + 
  scale_shape_manual(values = c(18,17,19)) + 
  scale_radius(range = c(1,4)) + 
 scale_color_gradient(low = "darkcyan", high = "greenyellow") + # colors are approximate
theme_bw() + 
  theme(legend.position = c(0.7,0.85),
        legend.box = "horizontal",
        legend.box.background = element_rect(fill = "white", #white background behind legend
                                             linewidth = 0),
        panel.border = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line()) + 
 guides(shape = guide_legend(order = 3, override.aes = list(color = "darkcyan")),
        color = guide_colorbar(order = 1),
        size = guide_legend(order = 2, override.aes = list(color = "darkcyan")))
