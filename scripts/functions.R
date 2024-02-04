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






# discounting function
#Get ratio by dividing number of salmon per year by the cost per year


ann_cost_ben <- function(C, f) {
  #no calculation for fish = 0 
  # annual cost per fish 
  # calculate annual cost (a) by total cost (C) x discount rate (0.03) divided by number of fish
  a <- ifelse(f == 0, NA, (C*0.03)/f) 
    return(a)
}





