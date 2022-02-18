\name{searchTweets}
\alias{searchTweets}
\title{Search tweets}
\description{
  This function will search for related tweets that match the specified string.
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
If not NULL, restricts the maxumin number of tweets return. Default is 5.
}
}
\details{
This function will return any authorized tweets that match the search conditions. Authorized tweets are public tweets, as well as those protected tweets that are authenticated by registerTwitterOAuth, which users can use. Please note that Twitter's search service and, by extension, the Search API is not meant to be an exhaustive source of Tweets. 


The \code{searchString} is always required. It can contain hashtag in order to search some tag in Twitter.

The \code{resultType} Specifies what type of search results you would prefer to receive. The current default is "mixed." Valid values include:

  \code{mixed} : Include both popular and real time results in the response

  \code{recent} : return only the most recent results in the response

  \code{popular} : return only the most popular results in the response

}
\value{
A dataframe contains following columns:

\item{created_time}{When this tweet was created}

\item{user_name}{The name of the user}

\item{user_screen_name}{The screent name of the user}

\item{user_followers_count}{The number of followers of the user}

\item{text}{The text of this tweet}

\item{truncated}{Whether this tweet was truncated}

\item{favorited}{Whether this tweet has been favorited}

\item{retweeted}{Whether this tweet has been retweeted}

\item{favorite_count}{The number of times this tweet has been favorited}

\item{retweet_count}{The number of times this tweet has been retweeted}

}
\references{
https://developer.twitter.com/en/docs/twitter-api/v1/tweets/search/api-reference/get-search-tweets
}
\author{
Ao Tang
}

\examples{
##search for hashtag #canada

# searchTweets('#canada', resultType = "popular", count = 15)
}

