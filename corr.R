corr <- function(directory = "specdata", threshold = 0) {
        
        path_files <- paste(directory,"//*.csv", sep = "")
        
        files <- (Sys.glob(path_files))
        
        correlations <- c()
        
        for (file in files) {
                
                db <- read.csv(file, sep = ",");
                complete_cases <- db[complete.cases(db),];
                
                if (nrow(complete_cases) > threshold) {
                        correlations <-
                                c(correlations, cor(complete_cases$sulfate, complete_cases$nitrate))
                }
        }
        
        return(correlations)
}
