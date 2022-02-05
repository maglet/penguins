

library(ggplot2)
library(dplyr)
library(readr)

function() {
  print(ggplot(data,
               aes(x=bill_length_mm, 
                   y=bill_depth_mm))+
          geom_point())
}

function(sp) {
  data %>%
    filter(species == sp)
}


