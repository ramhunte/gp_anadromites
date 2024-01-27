# stream energy calculator ----

# Create a new column "energy" based on conditions

assign_energy_width <- function(input_df, slope) {
filtered_df <- input_df %>%
  mutate(energy = case_when(
    
    # low 
    (slope >= 0 & slope <= 1 & 
       habitat == "SmStream" ) ~ "low",
    
    # medium
    (slope > 0 & slope <= 1 & 
       habitat == "LgStream" ) |
      (slope > 1 & slope <= 4 & 
         habitat == "SmStream" ) |
      (slope > 4 & slope <= Inf & 
         habitat == "SmStream" ) ~ "medium",
    
    # high 
    (slope > 1 & slope <= 4 & 
       habitat == "LgStream" ) |
      (slope > 4 & slope <= Inf & 
         habitat == "LgStream" ) ~ "high",
    
    TRUE ~ "Unknown"  # Handle any other cases
  ))

return(filtered_df)
}

