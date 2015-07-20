complete <- function(directory = "specdata", id = 1:332) {
        
        path_files <- paste(directory,"//*.csv", sep = "")
        
        files <- (Sys.glob(path_files))
        nobs <- c();
        
        for (index in id) {
                db <- read.csv(files[index], sep = ",");
                complete_cases <- db[complete.cases(db),];
                nobs <- c(nobs, nrow(complete_cases));
        }
        
        return(data.frame(cbind(id, nobs)));
}


