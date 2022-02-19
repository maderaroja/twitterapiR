# twitterapiR

<!-- badges: start -->
  [![R-CMD-check](https://github.com/tangaot/twitterapiR/workflows/R-CMD-check/badge.svg)](https://github.com/tangaot/twitterapiR/actions)
[![Codecov test coverage](https://codecov.io/gh/tangaot/twitterapiR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/tangaot/twitterapiR?branch=main)
<!-- badges: end -->

This project is an API wrapper for Twitter in R. This package provides user friendly functions for the users to query information from Twitter. 

Current list of functions included in the wrapper:

* set_bearer("API key", "API secret")
* get_bearer()
* user_friends(screen_name, number)
* searchTweets(searchString, resultType, count)
* followersCount(screen_name)

## Installation

```{r}
remotes::install_github("tangaot/twitterapiR")
```

## Usage
```{r}
library(twitterapiR)
set_bearer("API key", "API secret")
user_friends(screen_name = "BarackObama", number = 10)
searchTweets('#canada', resultType = "popular", count = 15)
followersCount(screen_name ="BarackObama")
```
