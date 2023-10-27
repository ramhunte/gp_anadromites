library(tidyverse)
library(sf)
library(ggspatial)
library(tmap)
library(here)
library(janitor)
library(ggplot2)

######################################### Reading Data ##########################################

#flowline stillaguamish 
flow_stl <- st_read(here("data", "Flowline_STL", "Flowline_STL_20220928.shp")) %>% 
  clean_names()
flow_stl <- st_zm(flow_stl, what = "ZM") #removing z

#floodplain stillaguamish
flood_stl <- st_read(here("data", "Floodplain_STL", "Floodplain_STL_20220928.shp")) %>% 
  clean_names()
flood_stl <- st_zm(flood_stl, what = "ZM") #removing z

#subbasins stillaguamish
subs_stl <- st_read(here("data", "Subbasins_STL", "Subbasins_STL_20220928.shp")) %>% 
  clean_names()
subs_stl <- st_zm(subs_stl, what = "ZM") #removing z

## side channel multiplier stillaguamish 
side_channel_mult_stl<-read_csv(here("data", "HARP_Side_Channel_Mult_STL.csv"))


