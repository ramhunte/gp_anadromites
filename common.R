library(tidyverse)
library(sf)
library(terra)
library(ggspatial)
#library(tmap)
library(here)
library(janitor)
library(ggplot2)

######################################### Reading Data ##########################################


                                ################ HARP #################
#flowline stillaguamish without distance to nearest road
flow_stl <- st_read(here("data", "HARP", "Flowline_STL", "Flowline_STL_20220928.shp")) %>%
  clean_names()
flow_stl <- st_zm(flow_stl, what = "ZM") #removing z

#csv stillaguamish with distance to nearest road (created in the cost_elj document)
transportation_stl <- read.csv(here("data", "HARP", "stl_transportation.csv")) %>%
  clean_names()

#join the flowline and the transportation column
flow_stl<-full_join(flow_stl, transportation_stl)

#create a slope degrees for flow_stl 
flow_stl$slope_degrees <- atan(flow_stl$slope) * (180/pi)

#create a slope gradient 
flow_stl$slope_gradient <- flow_stl$slope*100

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

## side channel lengths (percent change side historical)
side_channel_length<-read_csv(here("data", "HARP", "side_channel_lengths.csv")) %>% 
  clean_names() %>% rename("curr_sc_km"="curr_sc_kmperc_change") %>% rename("perc_change"="x4")

                                ################ HARP Benefits #################

stilly_bens <- read.csv(here("data", "HARP", "benefits", "ind_subbasin_rest_20s_2023-09-21 - ind_subbasin_rest_20s_2023-09-21.csv"))


                                 ################ Washington #################

## land use data Snohomish County 
# link: https://geo.wa.gov/datasets/a0ddbd4e0e2141b3841a6a42ff5aff46_0/explore?filters=eyJOQU1FIjpbIlNub2hvbWlzaCJdfQ%3D%3D&location=46.980958%2C-117.609917%2C6.41
# snoho_lu <- st_read(here("data", "Washington_data", "Snoho_Land_Use", "General_Land_Use_Final_Dataset.shp"))


# roads_stl <- st_read(here("data", "roads", "WA_roads_thin.gpkg"))



                                ################ Producer Price Index ############
# (PPI used: https://fred.stlouisfed.org/series/WPUSI012011)
# 2003-03-01: 145.200
# 2023-11-01: 327.242
# percent change
ppi_2003<-145.200
ppi_2023<-327.242
ppi_perc<-((ppi_2023-ppi_2003)/ppi_2003)*100
ppi<-1+(ppi_perc/100)

                             ######################### Barriers #################################
# all_barriers<-read_csv(here("data", "barriers", "WSDOT_-_Fish_Passage_Uncorrected_Barriers_Statewide.csv")) %>% 
#   clean_names()
# coordinates <- st_as_sf(all_barriers, coords = c("long_wgs84_meas", "lat_wgs84_meas"), crs = 4326)
# st_write(coordinates, here("data", "barriers","all_barriers.shp"))
# all_barriers <- st_read(here("data", "barriers", "all_barriers.shp"))
# subs_stl_crs <- st_crs(subs_stl)
# all_barriers <- st_transform(all_barriers, crs = subs_stl_crs) #change crs
# stl_barriers <- st_intersection(all_barriers, subs_stl)
# st_write(stl_barriers, here("data", "barriers","stl_barriers.shp"))


####### google basemap ###########

# api key
# google api key free trial ran out 

# ggmap::register_google(key = "AIzaSyAMlAe4fbAxjFToWnpW-28exZtSUC6bXL8")
# api_key <- "AIzaSyAMlAe4fbAxjFToWnpW-28exZtSUC6bXL8"
# 
# # making google map base map 
# basemap <- ggmap::get_googlemap(
#   center = c(lon = -121.9, lat = 48.25),
#   zoom = 9,
#   maptype = "satellite",
#   extent = "panel",
#   source = "google",
#   key = api_key)
