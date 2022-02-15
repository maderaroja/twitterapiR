\name{searchTweets}
\alias{searchTweets}
\title{Search tweets}
\description{
  This function will search for related tweets that match the specified string.
}
\usage{
searchTweets(key, secret, searchString, count = 5, resultType = "mixed")
}
\arguments{
  \item{key}{
Twitter API key are used to authenticate requests.
}
  \item{secret}{
Twitter API key secret are used to authenticate requests.
}
  \item{searchString}{
A search string of 100 characters maximum, including operators.
}
  \item{count}{
If not NULL, restricts the maxumin number of tweets return. Default is 5.
}
  \item{resultType}{
If not NULL, returns filtered tweets as per value. See details for allowed values.
}
}
\details{
This function will return any authorized tweets that match the search conditions. Authorized tweets are public tweets, as well as those protected tweets that are authenticated by registerTwitterOAuth, which users can use. Please note that Twitter's search service and, by extension, the Search API is not meant to be an exhaustive source of Tweets. 

The \code{key and secret} is always required, that is essentially the username and password for your API. To generate this key via \code{\link{https://developer.twitter.com/}}

The \code{searchString} is always required. It can contain hashtag in order to search some tag in Twitter.

The \code{resultType} Specifies what type of search results you would prefer to receive. The current default is "mixed." Valid values include:

\item{mixed} : Include both popular and real time results in the response.

\item{recent} : return only the most recent results in the response

\item{popular} : return only the most popular results in the response.

}
\value{
A dataframe 
}
\references{
https://developer.twitter.com/en/docs/twitter-api/v1/tweets/search/api-reference/get-search-tweets
}
\author{
Ao Tang
}

\examples{
##search for hashtag #canada
key = 'your-key-here'
secret= 'your-secret-here

searchTweets(key, secret,'#canada', count = 15)
}

