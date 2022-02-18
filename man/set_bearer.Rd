\name{set_bearer}
\alias{set_bearer}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Set Bearer for Twitter API
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This function will set key, and secret key as environment variable.
}
\usage{
set_bearer(key, secret)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
%%     ~~Describe \code{x} here~~
  \item{key}{
Twitter API key are used to authenticate requests.
}
  \item{secret}{
Twitter API key secret are used to authenticate requests.
}

}
\details{
%%  ~~ If necessary, more details than the description above ~~

The \code{key and secret} is always required, that is essentially the username and password for your API. To generate this key via \url{https://developer.twitter.com/}

If the key and secret are successfully set, the function will return TRUE, otherwise, return FALSE.

}
\value{
%%  ~Describe the value returned
\item{TRUE }{key and secret are successfully set}

\item{FALSE }{key and secret are not successfully set}
%% ...

}

\author{
Ao Tang
}

\examples{

# key = 'YOUR-KEY-HERE'

# secret = 'YOUR-SECRET-HERE'
# result <- set_bearer(key, secret) 
# print(result)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
