

fish_data <- read.csv("data/Gaeta_etal_CLC_data_1.csv.csv")

library(dplyr)
#this creates a new table catergorizing fish by size
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 300, "big", "small")) %>% 
  filter(scalelength > 1)

library(ggplot2)

ggplot(data = fish_data_cat, mapping = aes(length, scalelength, color = lakeid)) +
  geom_point()

ggsave("plots/scatter_length_scalelength.jpg", plot = last_plot())

#Plot histogram of scale length by fish categorical size
ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram()

#fixed so that there is a fixed bin
scale_hist_by_length <- ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) + 
  geom_histogram(mapping = NULL, stat = "bin", bins = 80)

ggsave("plots/scale_hist_by_length.jpg", plot = last_plot())
