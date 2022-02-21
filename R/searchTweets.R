searchTweets <- function(searchString, resultType = "mixed", count = 5){

    
    #' searchTweets
    #' 
    #' @description This function will search for related tweets that match the specified string.
    #' 
    #' @param searchString character. A search string of 100 characters maximum, including operators.
    #' @param resultType character. If not NULL, returns filtered tweets as per value. See details for allowed values.
    #' @param count integer. If not NULL, restricts the maximum number of tweets return. 
    #' Default is 5, up to a maximum of 100
    #' 
    #' 
    #' @usage searchTweets(searchString, resultType = "mixed", count = 5)
    #' @return A DataFrame that contains the following columns:
    #' created_time: the time the tweet was created
    #' user_name: the name of the user
    #' user_screen_name: the screen name of the user
    #' user_followers_count: the number of followers of the user
    #' text: the text of the tweet
    #' truncated: if the tweet is truncated
    #' favorited: if the tweet was favorited
    #' retweeted: if the tweet was retweeted
    #' favorite_count: the number of times the tweet was favorited
    #' retweet_count: the number of times the tweet was retweeted
    #' 
    #' @details This function will return any authorized tweet that matches the search conditions. 
    #' Authorized tweets are public tweets as well as protected tweets that are authenticated by 
    #' registerTwitterOAuth, which users can use. Please note that Twitter's search service and, 
    #' by extension, the Search API is not meant to be an exhaustive source of Tweets.
    #' 
    #' The searchString is always required. It can contain hashtags in order to search specific tags in Twitter.
    #' The resultType specifies the type of search results that you want. 
    #' The current default is "mixed." Valid values include:
    #' mixed : includes both popular and real time results in the response
    #' recent : returns only the most recent results in the response
    #' popular : returns only the most popular results in the response
    #' 
    #' @references <https://developer.twitter.com/en/docs/twitter-api/v1/tweets/search/api-reference/get-search-tweets>
    #' @examples
    #' ##search for hashtag #canada
    #' searchTweets('#canada', resultType = "popular", count = 15)
    #' 
    #' @export
    #' 
    
    
    #check searchString
    if (nchar(searchString) > 100) {
        stop("searchString can only be up to 100 characters!")
    } else if (nchar(searchString) == 0) {
        stop("searchString can not be empty!")
    }
    
    #check count
    count <- as.integer(count)
    if (count <= 0) {
        stop("Count must be positive!")
    } else if(count > 100){
        stop("Count must less than 100!")
    }
    
    #check resultType
    if (!(resultType %in% c("mixed", "recent", "popular"))){
        stop("resultType can only be mixed or recent or popular!")
    }
    
    # get key and secret
    bearer <- get_bearer()
    
    searchString <- utils::URLencode(searchString, reserved = TRUE) # encode characters in URLs
    
    base <- "https://api.twitter.com/1.1/search/tweets.json?q="
    
    url <- paste0(base,searchString,"&count=",count,"&resultType=",resultType)
    
    #get from API
    res = httr::GET(url, httr::add_headers(Authorization=paste0("Bearer ", bearer$access_token)))
    
    #check connection
    if (res$status_code != '200'){
        stop(paste("Connection Failed! Please see the following detail: \n",res))
    }
    
    obj <- httr::content(res, as = "text")
    
    json_data <- jsonlite::fromJSON(obj, flatten = TRUE) #convert to json
    
    data <- as.data.frame(json_data) #convert json to dataframe
    
    statuses.created_at <- NULL
    statuses.user.name  <- NULL
    statuses.user.screen_name  <- NULL
    statuses.user.followers_count <- NULL
    statuses.text <- NULL
    statuses.truncated <- NULL
    statuses.favorited <- NULL
    statuses.retweeted <- NULL
    statuses.favorite_count <- NULL
    statuses.retweet_count <- NULL
    
    #select columns that we are interested
    data <- dplyr::select(data, 
                          statuses.created_at,
                          statuses.user.name, 
                          statuses.user.screen_name,
                          statuses.user.followers_count,
                          statuses.text, 
                          statuses.truncated, 
                          statuses.favorited,
                          statuses.retweeted,
                          statuses.favorite_count,
                          statuses.retweet_count)
    
    data <- dplyr::rename(data,
                          created_time = statuses.created_at,
                          user_name = statuses.user.name,
                          user_screen_name = statuses.user.screen_name,
                          user_followers_count = statuses.user.followers_count,
                          text = statuses.text,
                          truncated = statuses.truncated,
                          favorited = statuses.favorited,
                          retweeted = statuses.retweeted,
                          favorite_count = statuses.favorite_count,
                          retweet_count = statuses.retweet_count)
    
    return(data)
}