
library(testthat)

test_that("Incorrect inputs", {
    # invalid screen_name
    expect_error(followersCount(screen_name="BarackObamaa"))
})

test_that("output is a data frame",{
    output <- followersCount(screen_name="BarackObama")
    expect_true(is.data.frame(output))
})