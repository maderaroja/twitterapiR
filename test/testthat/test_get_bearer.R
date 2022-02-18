library(testthat)
library(twitterapiR)

test_that("API key is retreived", {
    expect_type(get_bearer(), "list")
})

test_that("Invalid bearer key correctly fails", {
    # invalid key and secret
    Sys.setenv(key = 'xxxxxxxxxxxxxxxxx')
    Sys.setenv(secret = 'xxxxxxxxxxxxxxxxxxx')
    expect_error(get_bearer())
    # invalid key and secret
    Sys.unsetenv("key")
    Sys.unsetenv("secret")
    expect_error(get_bearer())
})
