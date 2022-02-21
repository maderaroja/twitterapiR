get_bearer <- function() {
     #' get_bearer
     #' 
     #' @description This function is a helper function that can be used to help to generate the bearer key using API key and API secret key.
     #' 
     #' @usage get_bearer()
     #' @return If the key and secret are valid, the function will return a list of the type and key.
     #' 
     #' @details The key and secret are required to use in the functions within the twitterapiR package in order to query information from Twitter.
     #' 
     #' @examples
     #' key = 'YOUR-KEY-HERE'
     #' secret = 'YOUR-SECRET-KEY-HERE'
     #' get_bearer()
     #' 
     #' @export
     #' 
     
    # get the key and secret from the system environment
    key <- Sys.getenv("key")
    secret<-Sys.getenv("secret")
     
    # raise an error if there are no environment variables named "key" or "secret"
    if (key == "" | secret == "") {
        stop("You must provide an API key to the function or use `Sys.setenv(key = 'your_key_here')`, `Sys.setenv(secret = 'your_secret_key_here')`")
    }
     
    # concatenate key and secret as a bearer key.
    app_keys <- openssl::base64_encode(paste0(key, ":", secret))
    r <- httr::POST("https://api.twitter.com/oauth2/token",
                    httr::add_headers(Authorization = paste0("Basic ", app_keys)),
                    body = list(grant_type = "client_credentials"))
    bearer <- httr::content(r, encoding = "UTF-8")
    
     # raise an error if the bearer key is invalid. Otherwise return the bearer key as a list.
    if (!is.null(bearer$errors)){
        stop("Invalid key or secret, please see the following details: https://developer.twitter.com/en/docs/twitter-api/getting-started/getting-access-to-the-twitter-api")
    }else{
        return(bearer)
    }
}
