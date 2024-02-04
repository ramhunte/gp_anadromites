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


ann_cost <- function(a, C, r) {
  
  #original final equation from andrew
  C=sum(t=0 to infinity) [a]/(1+r)^t
  
  # take out "t" b/c infinity and divide by just r?
  C=[a]/(r)
  
  #rearrange to find "a"?
  a = C*r
  
  e
  
  return(a)
}






