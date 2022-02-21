set_bearer <- function(key, secret){
    
    #' set_bearer
    #' 
    #' @description This function will set key, and secret as environment variables.
    #' 
    #' @param key character. Twitter API key is used to authenticate requests.
    #' @param secret character. Twitter API secret is used to authenticate requests.
    #' 
    #' @usage set_bearer(key, secret)
    #' @return If the key and secret are successfully set, the function will return TRUE, otherwise, return FALSE.
    #' 
    #' @details The key and secret are always required, which are essentially the username and password for your API. 
    #' To generate this key do so via https://developer.twitter.com/
    #' 
    #' @examples
    #' key = 'YOUR-KEY-HERE'
    #' secret = 'YOUR-SECRET-HERE'
    #' result <- set_bearer(key, secret) 
    #' print(result)
    #' 
    #' @export
    #' 
    
    if (key == "" || secret == "" ) {
        stop("You must provide an API key to the function!!")
    }
    
    #set key and secret as environment variable
    Sys.setenv("key"= key) 
    Sys.setenv("secret" = secret)
    
    tryCatch(
        expr = {
            my_key <- Sys.getenv("key")
            my_secret<-Sys.getenv("secret")
        },
        error = function(e){
            message('Can not set key and secret!') #if we can not get key and secret
            print(e)
            return(FALSE)
        },
        finally = {
            if (my_key == key && my_secret == secret){
                return(TRUE)
            } else {  #if key or secret are not match
                message('Error in set key and secret!')
                return(FALSE)
                
            }
        }
    )    
}