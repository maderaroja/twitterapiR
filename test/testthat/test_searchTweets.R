library(testthat)
#library(twitterapiR)

key <- Sys.getenv("TWITTER_API_KEY")
secret <- Sys.getenv("TWITTER_API_SECRET")
setted <- set_bearer(key, secret)

test_that("Incorrect inputs", {
    expect_error(searchTweets(searchString="#ubc" ,resultType = "all", count = 5))
    expect_error(searchTweets(searchString="#ubc" ,resultType = "mixed", count = -10))
})

test_that("output is a data frame",{
    output <- searchTweets(searchString="#ubc" ,resultType = "mixed", count = 3)
    expect_true(is.data.frame(output))
})