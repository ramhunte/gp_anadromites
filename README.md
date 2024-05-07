# Data Archival for Economic Cost Modeling of Chinook Habitat Restoration in the Stillaguamish River Basin

<https://doi.org/10.5061/dryad.c59zw3rgr>

Give a brief summary of dataset contents, contextualized in experimental procedures and results.

**Stream line (STL)** - GDB containing tabular and spatial environmental data for stream reaches within the Stillaguamish River Basin. This data was used in our analysis to generate cost estimate model inputs pertaining to the terrain of the streams in a given subbasin (such as its slope and width). These parameters were used throughout the 3 habitat restoration action scenarios as they all required stream reach attributes as input for the cost estimates.

**Floodplain (STL)** - GDB containing information on polgyons of floodplain habitat in the Stillaguamish River Basin. Polygons were used in the analysis of quantifying the total floodplain habitat in each subbasin and the amount that needed to be restored. If a `hab_unit` was labeled as `curr`, then it is a current floodplain habitat. If labeled `hist` then it was historical. If labeled `both` then it used to be floodplain habitat and it still is. We used this to determine whether or not restoration was needed and how much. This data was not used in assessing engineered log jams or riparian planting actions.

**NOAA subbasins (STL)** - GDB of all of the subbasins within the Stillaguamish River Basin. Polygons were used in all aspects of analysis to crop floodplain habitat, streams, elevation, land use polygons, and other physical characteristics of the basin to individual subbasins. All cost estimates were created at a subbasin level using this data set. It was also used to visualize our final results in map making. Overall, this data was used to segment our analysis into individual subbasins that we then used to compare to oneanother.

**Elevation** - A folder with DEM files of elevation raster data for the Stillaguamish River Basin. Raster data is shown at a 10m resolution across the basin. It was cropped to the basin and used in the riparian planting analyses to estimate the steepness of terrain and difficulty of accessing riparian vegetation. The raster data was cropped to each stream reach within each subbasin where there was proposed riparian planting restoration

**land_use** - A GDB with shape files on the land use of land parcels throughout Snohomish county. These parcels were clipped to the Stillaguamish River Basin and the polygons were intersected with those of each subbasin. We used this to estimate the total area and percent land uses throughout the basin and identify areas of existing agricultural land that intersect with historical floodplain habitat that could potentially be utilized for restoration

**benefits** - a folder containing a CSV file with the estimated increases in Chinook, Steelhead, and Coho salmon from each of the 3 different restoration actions by subbasin. It highlights the current population and the modeled change in population following restoration of the subbasin to historical conditions as modeled by the HARP model.

**roads** -

**POC_WA** -

**Poverty_WA** -

**Unemployment_WA -**

## Description of the data and file structure

This is a freeform section for you to describe how the data are structured and how a potential consumer might use them. Be as descriptive as necessary. Keep in mind that users of your data might be new to the field and unfamiliar with common terminology, metrics, etc.

Describe relationships between data files, missing data codes, other abbreviations used. Be as descriptive as possible.

**Streamline (STL)** - Key variables used were:

`noaaid` Unique reach identifier

`Habitat Description` of reach habitat type. Large and small non-tidal streams are reclassified by width within the HARP model

`Area_km2` Area of catchment draining to reach (National Elevation Dataset, NED) (km2)

`slope` Stream gradient (National Elevation Dataset, NED) (m/m)

`BF_width` Bankfull width, modeled by NOAA (m)

`length` Reach length (m)

`fpw` Width of floodplain at reach (WDNR LiDAR and National Elevation Dataset, NED) (m)

`can_ang` Current canopy opening angle, modeled by NOAA, NOAA riparian condition dataset (°)

`hist_ang` Historical canopy opening angle, modeled by NOAA, NOAA riparian condition dataset (°)

`geometry` line strings of the streams

**Floodplain (STL)** - Key variables used were:

`HabUnit Code` indicating habitat type

`Period Code` indicating time period in which feature exists or existed

`Hab_cond` Code indicating whether feature appears to be natural in origin, manmade, or natural in origin with human modification

`noaaid` Numeric code of nearby reach

`Area_ha` Area of feature ha

`geometry` Polygons of the floodplain habitat

**Subbasins (STL)** - Key variables used were:

`noaa_subba` Name of subbasin

`geometry` Polygons of the subbasins

**Elevation** - Key variables used were:

`elevation` elevation of the raster pixel (m)

**land_use** - Key variables used were:

`MASTER_CAT` category of land use

`geometry` polygons of the land use parcels

**benefits** - Key variables used were:

`pop` the population of salmon

`subbasin` name of the subbasin

`scenario` proposed intervention or restoration action

`n` modeled population following restoration

`n_curr` modeled current population

`perc_change` percent change in population of salmon

**roads** - Key variables used were:

**POC_WA** - Key variables used were:

`percent_people_of_color` percent people of color

**Poverty_WA** - Key variables used were:

`percent_living_in_poverty` percent fo population living in poverty

**Unemployment_WA** - Key variables used were:

`percent_unemployed` percent of population unemployed

## File Strucutre

All data is stored in subfolders underneath the `Data` folder in the repository. Relevant folders include:

`elevation` which includes elevation data

`HARP` which includes all of the `Flowline_STL`, `Floodplain_stl`, `Subbasins_STL`, and `benefits` data

`roads` which includes all the public road data

`land_use` which includes all land use data in Snohomish county

`POC_WA` which includes all of the data pertaining to demographics

`Poverty_WA` which contains data pertaining to poverty rates

`Unemployment_WA` which contains unemployment data

These data area primarily raw data folders pulled from the specified online sources. However, as annotated in the scripts, certain data frames were read in, modified, and re-written to minimize computation and time spent on the analyses. Other data folders may not have a specified purpose as they were used in unrelated analyses or just used in the exploration of the analyses.

## Sharing/Access information

This is a section for linking to other ways to access the data, and for linking to sources the data is derived from, if any.

Links to other publicly accessible locations of the data:

Data and data description for **Streamline (STL)**, **Floodplain (STL)**, and **Subbasins (STL)** data are publicly available at:

<https://www.fisheries.noaa.gov/resource/tool-app/habitat-assessment-and-restoration-planning-harp-model>

Data and data description for the **Elevation** data are publicly available at:

<https://gis.ess.washington.edu/data/raster/tenmeter/byquad/info.html>

Data and data description for the **land_use** data are publicly available at:

<https://geo.wa.gov/datasets/a0ddbd4e0e2141b3841a6a42ff5aff46_0/explore?filters=eyJOQU1FIjpbIlNub2hvbWlzaCJdfQ%3D%3D&location=46.750570%2C-117.609917%2C6.00>

Data and data description for the **benefits** data are publicly available at:

Data and data description for the **roads** data are publicly available at:

<https://geo.wa.gov/datasets/a12a43c5b10b498ca6612454616bc7fa/about>

Data and data description for the **POC_WA** data are publicly available at:

<https://geo.wa.gov/datasets/bb24b4accb974940ab4bf2784b9b4a6a_0/explore?location=47.181638%2C-120.811974%2C6.94>

Data and data description for the **Poverty_WA** data are publicly available at:

<https://geo.wa.gov/datasets/WADOH::population-living-in-poverty-current-version/about>

Data and data description for the **Unemployment_WA** data are publicly available at:

<https://geo.wa.gov/datasets/67c699681b4f49c0adb1b5cada9e1919_0/explore>

## Code/Software

This is an optional, freeform section for describing any code in your submission and the software used to run it.

Describe any scripts, code, or notebooks (e.g., R, Python, Mathematica, MatLab) as well as the software versions (including loaded packages) that you used to run those files. If your repository contains more than one file whose relationship to other scripts is not obvious, provide information about the workflow that you used to run those scripts and notebooks.

All analyses were performed in R Studio using Version 2023.12.1+402. Annotated code, scripts, final products, and data are provided in the the following GitHub repository:

<https://github.com/ramhunte/gp_anadromites>

**Notes on the Analysis:**

Analyses and code are annotated throughout the scripts explaining the data wrangling, cleaning, and analyses process. The repository contains mainly RMD files with annotated code and some sourced R files as well for common functions and data sources used throughout the analyses. Some files were written in R and generated into specified subfolders. Raw data is stored in the `Data` folder, common functions and data read in throughout the analyses are written in the `common.R` file, and the `scripts` folder contains all of our working analyses divided into actions (floodplain (`cost_floodplain.Rmd`), engineered log jams (`cost_elj.Rmd`), and riparian planting (`cost_rp.Rmd`)) as well as demogrpahic analyis (`demographic_overlap.Rmd`), land use (`landuse.Rmd`). Our figures were constructed in the `figures.Rmd` file, and a common `functionsR` script was used to source common functions across the analyses in the scripts folder. `Benefit_data.Rmd` wrangles and generates HARP model benefits (increased number of Chinook) that are used throughout the analyses, and the `cost_data.Rmd` reads in and wrangles the costs associated with land use and agriculture. Note that the variables in the raw data files look different than in the individual analyses as names were modified in the `common.R` file.
