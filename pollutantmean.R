pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) {
  
  path_files <- paste("./",directory,"/", sep = "")
  
  list_files <- list.files(path_files, pattern="*.csv")
  
  files <- paste(path_files,list_files,sep = "")
  
  
  db <- data.frame()
 
  for (i in id) {
    db <- rbind(db, read.csv(files[i]))    
  }     
  
  db_sub <- db[which(db[,"ID"] %in% id),] 
  
  mean(db_sub[,pollutant], na.rm = TRUE)
  
  }
