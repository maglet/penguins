#
# This is a Plumber API for filtering and visualizing penguin data
#

library(plumber)
library(pins)
library(ggplot2)
library(dplyr)
library(readr)

board <- board_rsconnect()
data<-pin_read(board, "lares/palmerpenguins")

#* @apiTitle The penguin API

#* Plot bill depth vs bill length, return png plot
#* @serializer png
#* @get /plot
function() {
   print(ggplot(data,
           aes(x=bill_length_mm, 
               y=bill_depth_mm))+
    geom_point())
}

#* Subset penguin data by species, return csv
#* @param sp the species to subset by
#* @serializer csv
#* @post /subset
function(sp) {
  data %>%
    filter(species == sp)
}


