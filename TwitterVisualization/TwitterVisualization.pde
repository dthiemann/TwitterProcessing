static String OAuthConsumerKey = "";
static String OAuthConsumerSecret = "";
static String AccessToke = "";
static String AccessTokenSecret = "";

TwitterStream twitter = new TwitterStreamFactory().getInstance();

// Initial connection
void connectTwitter() {
  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  
  AccessToken accessToken = loadAccessToken();
  twitter.setOauthAccessToken(accessToken);
}

//Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}

// Exception notice
public void onException(Exception ex) {
  ex.printStackTrace();
}

void setup() {
  
}

void draw() {
  
}
