#install.packages("jsonlite")
require(jsonlite)
# R version 3.5.1 (2018-07-02) -- "Feather Spray"
# parses multiple json files and returns list of species and branch under selection
# must be used in directory with all the json files


# remember to replace Inf values with "Inf" using
# sed -i 's/inf/"inf"/'
<<<<<<< HEAD
# run using <Rscript parse_results.R>
#setwd("C:/Users/path/to/json/files")
=======
setwd("C:/Users/path/to/json/files"")
>>>>>>> eb9498e6f6fb1967fb11bff82076be6e46ae536a


files <- list.files(full.names = TRUE, pattern = '*.json$')
print(files)

string <- "p2n.ABSREL.json"

for(file in files){
  global_results <- data.frame(name = character(0), branch = character(0), omega1 = character(0), percent1 = character(0), omega2 = character(0),
                               percent2 = character(0), omega3 = character(0), percent3 = character(0), stringsAsFactors = FALSE)
  name <- strsplit(paste(file), split = string)
  simplejson <- fromJSON(file)
  index <- 1
  branchnames <- list()
  branchnames <- simplejson$`branch attributes`$`0`
  for(i in branchnames){
    branch <- names(branchnames[index])
    local_results <- data.frame(name = character(0), branch = character(0), omega1 = character(0), percent1 = character(0), omega2 = character(0),
                                percent2 = character(0), omega3 = character(0), percent3 = character(0), stringsAsFactors = FALSE)
    if(i$`Corrected P-value` > 0.05){
      index <- index + 1
      next
    } else if(i$`Corrected P-value` <= 0.05){
      local_results[1, 1] <- name
      local_results[1, 2] <- branch
      if (i$`Rate classes` == 2){
        local_results[1, 3] <- i$`Rate Distributions`[1,1]
        local_results[1, 4] <- i$`Rate Distributions`[1,2]
        local_results[1, 5] <- i$`Rate Distributions`[2,1]
        local_results[1, 6] <- i$`Rate Distributions`[2,2]
        local_results[1, 7] <- "NA"
        local_results[1, 8] <- "NA"
      } else if(i$`Rate classes` == 3){
        local_results[1, 3] <- i$`Rate Distributions`[1,1]
        local_results[1, 4] <- i$`Rate Distributions`[1,2]
        local_results[1, 5] <- i$`Rate Distributions`[2,1]
        local_results[1, 6] <- i$`Rate Distributions`[2,2]
        local_results[1, 7] <- i$`Rate Distributions`[3,1]
        local_results[1, 8] <- i$`Rate Distributions`[3,2]
      }
    }
    global_results <- dplyr::bind_rows(global_results, local_results)
    rm(local_results)
    index <- index + 1
    
  }
  global_results <- na.omit(global_results)
  
  if (nrow(global_results) > 0) {
    write.table(global_results, file = "parsed_absrel_json.txt", sep = "\t", row.names = FALSE, col.names = FALSE, append = TRUE, quote = FALSE)
  }
}
