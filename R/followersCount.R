followersCount <- function(screen_name){
    #' followersCount
    #' 
    #' @description This function will accept the screen name of a user and output the total number of followers of that user
    #' 
    #' @param screen_name character. A string of one Twitter screen name. 
    #' 
    #' @usage followersCount(screen_name)
    #' @return A dataframe containing the following columns:
    #' screen_name: The screen name of the user
    #' followers_count: The number of followers of user
    #' 
    #' @references <https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-followers-list>
    #' @examples
    #' followersCount(screen_name ="BarackObama")
    #' 
    #' @export
    #' 
    
    # raise an errors if the number characters of the inputted screen name is greater than 100 and if the number characters of the inputted screen name is 0.
    if (nchar(screen_name) > 100) {
        stop("screen_name can only be up to 100 characters")
    } else if (nchar(screen_name) == 0) {
        stop("screen_name cannot be empty")
    }
    
    # get the bearer key
    bearer = get_bearer()

    # retreive information from Twitter
    screen_name <- URLencode(screen_name, reserved = TRUE) # encode characters in URLs
    base <- "https://api.twitter.com/1.1/users/show.json?screen_name="
    url <- paste0(base, screen_name)
    res = httr::GET(url, httr::add_headers(Authorization=paste0("Bearer ", bearer$access_token)))
    
    #check connection
    if (res$status_code != '200'){
    stop(paste("Connection Failed! Please see the following detail: \n",res))
    }
    
    obj <- httr::content(res, as = "text")
    
    json_data <- jsonlite::fromJSON(obj, flatten = TRUE)
    
    # ouput the screen_name and followers count as a data frame.
    screen_name <- as.data.frame(json_data$screen_name)
    followers_count <- as.data.frame(json_data$followers_count)
    data <- merge(screen_name, followers_count)
    colnames(data) <- c('screen_name', 'followers_count')
    

    return(data)
    
}

