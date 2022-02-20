
test_that("API key is set successfully", {
    key <- "Tds7CCMzPsJbRZH7aikpKiObN"
    secret <- "lPH7pIQIS1pVinxh48xvXWgqzGa9gre4Utb9tIZ2W1U0nSCgrz"
    expect_true(set_bearer(key, secret))
})

test_that("Invalid API key setted", {
    # invalid key and secret
    expect_error(set_bearer('',''))
})

