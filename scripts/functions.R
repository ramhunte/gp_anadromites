# stream energy calculator ----

# Create a new column "energy" based on conditions

assign_energy_width <- function(input_df) {
filtered_df <- input_df %>%
  mutate(energy = case_when(
    
    # low 
    (slope_gradient >= 0 & slope_gradient <= 1 & 
       habitat == "SmStream" ) ~ "low",
    
    # medium
    (slope_gradient >= 0 & slope_gradient <= 1 & 
       habitat == "LgStream" ) |
      (slope_gradient > 1 & slope_gradient <= 4 & 
         habitat == "SmStream" ) |
      (slope_gradient > 4 & slope_gradient <= Inf & 
         habitat == "SmStream" ) ~ "medium",
    
    # high 
    (slope_gradient > 1 & slope_gradient <= 4 & 
       habitat == "LgStream" ) |
      (slope_gradient > 4 & slope_gradient <= Inf & 
         habitat == "LgStream" ) ~ "high",
    
    TRUE ~ "Unknown"  # Handle any other cases
  ))

return(filtered_df)
}





################################## Discounting ##########################

# discounting function
#Get ratio by dividing number of salmon per year by the cost per year


ann_cost_ben <- function(C, f) {
  #no calculation for fish = 0 
  # annual cost per fish 
  # calculate annual cost (a) by total cost (C) x discount rate (0.03) divided by number of fish
  a <- ifelse(f == 0, NA, (C*0.03)/f) 
    return(a)
}


################################## FIGURES ##########################

########### Dumb Bell

# making a function that makes figure of costs
# df is input dat frame
# rest_type is restoration type from data frame in quotes
# title is how you want the restoration type to show in title (also quotes)
cost_graph_fun <- function(df, rest_type, title) {
  
  df_filtered <- df %>% 
    filter(pop == "fall_chinook",
           restoration_type == paste(rest_type))
  
  # initialize plot (we'll map our aesthetics locally for each geom, below) ----
  ggplot(data = df_filtered, aes(group = restoration_type
  )) +
    # create dumbbells ----
  geom_segment(aes(x = total_lower_cost, xend = total_upper_cost,
                   y = fct_reorder(subbasin_name, total_avg_cost), 
                   yend = subbasin_name),
               color = "grey"
  ) + # reorder occupation by avg_salary here
    geom_point(aes(x = total_lower_cost, y = subbasin_name, 
                   color = restoration_type, group = restoration_type), size = 2.5, color = "grey") +
    geom_point(aes(x = total_upper_cost, y = subbasin_name,
                   color = restoration_type, group = restoration_type), size = 2.5, color = "cyan3") +
    # axis breaks & $ labels ----
  scale_x_continuous(labels = scales::label_dollar(scale = 0.000001, suffix = "M")) +
    labs(x = "Total Cost ($ million)",
         y = "",
         title = paste(title, "Habitat Restoration Costs")) +
    theme_minimal() 
}




########### Tables

summary_table_builder<-function(rest_type) {
  
  
  all_cost_benefit %>% 
    filter(pop == "fall_chinook",
           restoration_type == rest_type) %>% 
    arrange(desc(total_avg_cost)) %>% 
    transmute("Subbasin Name" = subbasin_name,
              # "Restoration Type" = restoration_type,
              "Lower Cost" = paste("$", format(round(total_lower_cost), big.mark = ",")),
              # "Lower Cost" = paste("$", format(round(total_lower_cost), big.mark = ",")),
              "Upper Cost" = paste("$", format(round(total_upper_cost), big.mark = ",")),
              "Average Cost" = paste("$", format(round(total_avg_cost), big.mark = ",")),
              "Spawners" = round(n_diff, digits = 2),
              "CB Ratio" = paste("$", format(round(cb_ratio, digits = 2), big.mark = ","))) %>% 
    st_drop_geometry() %>% 
    as.data.frame() %>% 
  kable() %>%
    kable_styling(bootstrap_options = c("striped", "hover", "condensed")) 
 
}

