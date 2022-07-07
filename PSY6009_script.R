# Loading data set

library(here)
data <- read.csv(here('Data', 'CrowdstormingDataJuly1st.csv'))

# Remove NA values
data <- na.omit(data)

# Take average of rater scores for player skin tone
data$avrate <- data$rater1 + ((data$rater2 - data$rater1) / 2)

########################## Beginning Multiverse Analysis

# Create list of potential covariates
covariates_list <- list(position = c(NA, 'position'),
                        height = c(NA, 'height'),
                        weight = c(NA, 'weight'),
                        refNum = c(NA, 'refNum'),
                        player = c(NA, 'player'))



# Create list of all possible combinations
library(tidyverse)
covariate_grid <- expand.grid(covariates_list) %>%
  tidyr::unite(formula, position:player, sep = '+', na.rm = TRUE)
  
covariate_grid <- covariate_grid[-1,]
  
              
  
