\name{searchTweets}
\alias{searchTweets}
\title{Search tweets}
\description{
  This function will search for related tweets that match a specified string.
}
\usage{
searchTweets(searchString, resultType = "mixed", count = 5)
}
\arguments{

  \item{searchString}{
A search string of 100 characters maximum, including operators.
}
  \item{resultType}{
If not NULL, returns filtered tweets as per value. See details for allowed values.
}

  \item{count}{
If not NULL, restricts the maxumin number of tweets to return. Default is 5, up to a maximum of 100
}
}
\details{
This function will return any authorized tweets that matches the search conditions. Authorized tweets are public tweets, as well as those protected tweets that are authenticated by registerTwitterOAuth, which users can use. Please note that Twitter's search service and, by extension, the Search API are not meant to be exhaustive. 


The \code{searchString} is always required. It can contain hashtags in order to search specified tags in Twitter.

The \code{resultType} specifies the type of search results you want. The current default is "mixed." Valid values include:

  \code{mixed} : includes both popular and real time results in the response

  \code{recent} : returns only the most recent results in the response

  \code{popular} : returns only the most popular results in the response

}
\value{
A DataFrame that contains the following columns:

\item{created_time}{The date and time the tweet was created}

\item{user_name}{The name of the user}

\item{user_screen_name}{The screen name of the user}

\item{user_followers_count}{The number of followers of the user}

\item{text}{The text of the tweet}

\item{truncated}{Indicates if the tweet is truncated}

\item{favorited}{Indicates if the tweet is favorited}

\item{retweeted}{Indicates if the tweet is retweeted}

\item{favorite_count}{The number of times the tweet was favorited}

\item{retweet_count}{The number of times the tweet was retweeted}

}
\references{
https://developer.twitter.com/en/docs/twitter-api/v1/tweets/search/api-reference/get-search-tweets
}
\author{
Ao Tang
}

\examples{
##search for the hashtag #canada

# searchTweets('#canada', resultType = "popular", count = 15)
}

