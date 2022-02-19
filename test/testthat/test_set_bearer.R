library(testthat)
#library(twitterapiR)

test_that("API key is set successfully", {
    key <- Sys.getenv("TWITTER_API_KEY")
    secret <- Sys.getenv("TWITTER_API_SECRET")
    expect_true(set_bearer(key, secret))
})

test_that("Invalid API key setted", {
    # invalid key and secret
    expect_error(set_bearer('',''))
})

