user_friends <- function(screen_name, number = 195){
     #' user_friends
     #' 
     #' @description This function will accept a screen name of an user and output the name, screen name, and description of the user's friends.
     #' 
     #' @param screen_name character. A string of one Twitter screen name. 
     #' @param number integer. The number of friends to output. Default is 195.
     #' 
     #' 
     #' @usage user_friends(screen_name, number = 195)
     #' @return A dataframe contains following columns:
     #' name: The name of the friends
     #' screen_name: The screen name of the friends
     #' description: The description of the friends
     #' 
     #' @details This will only work correctly with users who have their profile public, or you are authenticate or granted access.
     #' 
     #' The screen_name is always required and it must be a public profile which you can see the number of followers the user has.
     #' The number is default to 195 and limit to 195.
     #' 
     #' @references <https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/follow-search-get-users/api-reference/get-friends-list>
     #' @examples
     #' user_friends(screen_name ="BarackObama", 10)
     #' 
     #' @export
     #' 
    
    # raise an error if the maximum number of user is more than 195.
    if (number > 195){
        stop("The number of users to return per page, up to a maximum of 195")
    }
    
    # get the bearer key
    bearer = get_bearer()
    
    base_url = "https://api.twitter.com/1.1/friends/list.json?"
    
    full_url = glue(base_url, 'screen_name={screen_name}&count={number}')
    
    # retrieve information from Twitter
    res=GET(full_url, add_headers(
        Authorization=paste0("Bearer ", bearer$access_token))
    )
    
    #check connection
    if (res$status_code != '200'){
        stop(paste("Connection Failed! Please see the following detail: \n",res))
    }
    
    obj <- httr::content(res, as = "text")
    
    json_data <- fromJSON(obj, flatten = TRUE)
    
    name <- NULL
    description <- NULL
    
    # output the 3 columns as a data frame
    data <- json_data$users  %>% select(name,screen_name, description) %>% as.data.frame()
    
    return(data)
}
