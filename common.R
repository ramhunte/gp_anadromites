library(tidyverse)
library(sf)
library(terra)
library(ggspatial)
library(tmap)
library(here)
library(janitor)
library(ggplot2)

######################################### Reading Data ##########################################


                                ################ HARP #################
#flowline stillaguamish without distance to nearest road
flow_stl <- st_read(here("data", "HARP", "Flowline_STL", "Flowline_STL_20220928.shp")) %>%
  clean_names()
flow_stl <- st_zm(flow_stl, what = "ZM") #removing z

# #flowline stillaguamish with distance to nearest road (created in the cost_elj document)
# flow_stl <- st_read(here("data", "HARP", "flow_stl_mod.shp")) %>%
#   clean_names()
# flow_stl <- st_zm(flow_stl, what = "ZM") #removing z

#floodplain stillaguamish
flood_stl <- st_read(here("data", "HARP", "Floodplain_STL", "Floodplain_STL_20220928.shp")) %>% 
  clean_names()
flood_stl <- st_zm(flood_stl, what = "ZM") #removing z

#subbasins stillaguamish
subs_stl <- st_read(here("data", "HARP", "Subbasins_STL", "Subbasins_STL_20220928.shp")) %>% 
  clean_names()
subs_stl <- st_zm(subs_stl, what = "ZM") #removing z

## side channel multiplier stillaguamish 
side_channel_mult_stl<-read_csv(here("data", "HARP", "HARP_Side_Channel_Mult_STL.csv"))

                                ################ HARP Benefits #################

stilly_bens <- read.csv(here("data", "HARP", "benefits", "ind_subbasin_rest_20s_2023-09-21 - ind_subbasin_rest_20s_2023-09-21.csv"))



                                 ################ Washington #################

## land use data Snohomish County 
# link: https://geo.wa.gov/datasets/a0ddbd4e0e2141b3841a6a42ff5aff46_0/explore?filters=eyJOQU1FIjpbIlNub2hvbWlzaCJdfQ%3D%3D&location=46.980958%2C-117.609917%2C6.41
snoho_lu <- st_read(here("data", "Washington_data", "Snoho_Land_Use", "General_Land_Use_Final_Dataset.shp"))


roads_stl <- st_read(here("data", "Washington_data", "WA_roads_thin.gpkg"))



