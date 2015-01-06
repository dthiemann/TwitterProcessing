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

//This listens for new tweet
StatusListener listener StatusListener() {
  
  public void onStatus(Status status) {}
  public void onStallWarning(StallWarning stallWarning) {}
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
  public void onScrubGeo(long userId, long upToStatusId) {}
  System.out.println("Got scrub_geo event userId:" + userId + "upToStatusId:" + upToStatusId);
  
}

void setup() {
  
}

void draw() {
  
}
