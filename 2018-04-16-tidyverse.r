
date()

library(readr)

data <- read.csv("R_short_course/data/plantHeight5Spp.csv")

head(data)

library(dplyr)

data %>% select(site) %>% head()

data %>% filter(Country == "Australia")

data %>% arrange(Country, Genus_species)

data %>% rename(species = Genus_species)

data %>% mutate(log_ht = log(height))

data %>% summarise(ht_mn = mean(height), ht_sd = sd(height), n = n())

data$height %>% mean()

20 %>% seq(1, 4, length.out = .)

data %>% 
    filter(Country == "Australia") %>% 
    select(Family, Genus_species, height) %>% 
    mutate(log_height = log(height))

data %>% 
    summarise(ht_mn = mean(height), n = n())

data %>% 
    group_by(Country) %>% 
    summarise(ht_mn = mean(height), ht_sd = sd(height), n = n())

data %>% 
    group_by(Country) %>% 
    count(Family)

data %>% 
    select_if(is.numeric) %>% 
    skimr::skim()

plantHeight <- read_csv("R_short_course/data/plantHeight5Spp.csv")

str(plantHeight)

plantHeight %>% 
    group_by(Country) %>% 
    summarise(ht_mn = mean(height), ht_sd = sd(height), n = n())

plantHeight %>% 
    group_by(Country) %>% 
    summarise(avg_height = mean(height)) -> plt_ht

library(ggplot2)

options(repr.plot.height = 4, repr.plot.width = 8)

plantHeight %>% 
    ggplot(aes(x = lat, y = height, colour = Country)) + 
    geom_point()

plantHeight %>% 
  filter(Country == "Australia") %>% 
  ggplot(aes(x = lat, y = height, col = Country)) + 
  geom_point()

plantHeight %>% 
  filter(Country == "Australia"|Country=="New Zealand") %>% 
  ggplot(aes(x = lat, y = height, col = Country)) + 
  geom_point()


plantHeight %>% 
  ggplot(aes(x = lat, y = height, col = Country)) + 
  geom_point() + 
  geom_smooth(method = "lm")


plantHeight %>% 
  ggplot(aes(x = lat, y = height)) + 
  geom_point(aes(col = Country)) + 
  geom_smooth(method = "lm")


plantHeight %>% 
  ggplot(aes(x = lat, y = height)) + 
  geom_point(aes(col = Country)) + 
  geom_smooth(method = "loess")

plantHeight %>% 
  filter(Country %in% c("Australia", "New Zealand", "Mexico")) %>% 
  ggplot(aes(x = lat, y = height)) + 
  geom_point() + 
  geom_smooth(method = "loess") + 
  facet_grid(.~Country)

plantHeight %>% 
  filter(Country %in% c("Australia", "New Zealand", "Mexico")) %>% 
  ggplot(aes(x = lat, y = height)) + 
  geom_point() + 
  geom_smooth(method = "loess") + 
  facet_grid(Country~.)

