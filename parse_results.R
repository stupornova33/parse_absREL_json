install.packages("jsonlite")
library(jsonlite)
# R version 3.5.1 (2018-07-02) -- "Feather Spray"
# parses multiple json files and returns list of species and branch under selection
# must be used in directory with all the json files
# remember to replace Inf values with "Inf" using
# sed -i 's/inf/"inf"/'
# run using <Rscript parse_results.R>



files <- list.files(full.names = TRUE, pattern = '*.json$')

for(file in files){
print(file) 
 simplejson <- fromJSON(file)
  index <- 1
  branchnames <- list()
  branchnames <- simplejson$`branch attributes`$`0`
  for(i in branchnames){
    local_results <- data.frame(branches = character(0), name = character(0), stringsAsFactors = FALSE)
    branch <- i$`original name`
     name <- file
    if (i$`Corrected P-value` <= 0.05){
      if(length(branch) > 0){
      local_results[index, 1] <- name
      local_results[index, 2] <- branch 
      } else {
        local_results[index, 1] <- name
        local_results[index, 2] <- "Node"
      }
      results <- na.omit(local_results)
      write.table(results, file = "parsed_absrel_json.txt", sep = "\t", row.names = FALSE, col.names = FALSE, append = TRUE, quote = FALSE)
      index <- index + 1
      rm(results, local_results)
    }
     
     
     
          
   } 
 
}


