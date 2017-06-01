# Script to clean and orgaznie the CSVs being passed in

CleanData <- function(dataset){
  
  df<- dataset[-1,]
  colnames(df) <- c('Country', 2015, 2010, 2005, 2000)
  df[df == 'No data'] <- 0
  df <-  genX(df, " [", "]")
  df <- gsub("<", "", df)
  df <- as.data.frame(df)

  gdp.data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv", stringsAsFactors = FALSE)
  colnames(gdp.data)[1] <- "Country"
  pop.data <- read.csv('../data/POP.csv', stringsAsFactors = FALSE)
  gdp.data <- gdp.data %>% filter(CODE %in% pop.data$X)
  pop.data <- pop.data %>% select(X, X.2, X.3) %>% slice(-(1:4)) %>% slice(1:217) %>% arrange(X.2)

  ##find the countries within both data sets whose names are most similar (some countries are spelt differently),
  ##allowing for the binding of those datasets
  dist.name <- adist(pop.data$X.2, df$Country, partial = TRUE, ignore.case = TRUE)
  
  min.name <- apply(dist.name, 1, min)
  match.s1.s2 <- NULL  
  for(i in 1:nrow(dist.name)) {
    s2.i <- match(min.name[i], dist.name[i,])
    s1.i <- i
    match.s1.s2 <- rbind(data.frame(s2.i = s2.i, s1.i= s1.i, s2name = df[s2.i,]$Country, s1name = pop.data[s1.i,]$X.2, adist = min.name[i]),
                         match.s1.s2)

  }
  
  ##filter out outlier countries and countries with the most dissimilar names, so therefore 
  ##dont have data that would line up 
  matched.countries <- as.data.frame(match.s1.s2 %>% filter(adist < 6), stringsAsFactors = FALSE) 
  matched.countries <- matched.countries[-c(40, 69, 100, 102, 103, 112, 126, 128, 130, 139, 150, 152, 156, 161, 164, 172, 179, 191),]
  matched.countries <- matched.countries %>% arrange(s2.i)
  matched.countries <- matched.countries[-c(49, 149), ]
  
  
  df <- df %>% filter(Country %in% matched.countries$s2name)
  pop.data <- pop.data %>% filter(X.2 %in% matched.countries$s1name)
  gdp.data <- gdp.data %>% filter(CODE %in% pop.data$X)
  gdp.data[178, ] = c("NA", "NA", "NA") 
  gdp.data[179, ] = c("NA", "NA", "NA") 
  matched.countries <- matched.countries %>% mutate(Population = gsub(",", "", pop.data$X.3), '2000' = df$`2000`, '2005' = df$`2005`, 
        '2010' = df$`2010`, '2015' = df$`2015`, GDP = gdp.data$GDP, CODE = gdp.data$CODE)
  matched.countries <- matched.countries %>% select("Country" = s2name, 7, 8, 9, 10, Population, GDP, CODE)
  matched.countries[2:6] <- data.frame(lapply(matched.countries[2:6], function(x) {gsub(" ", "", x)}), stringsAsFactors = FALSE)
  matched.countries[2:6] <- data.frame(lapply(matched.countries[2:6], function(x) as.numeric(as.character(x))), stringsAsFactors = FALSE)
  
  return(matched.countries)
}
