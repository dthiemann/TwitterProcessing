static String OAuthConsumerKey = "DfiAGTR8NjxzSwfRoARqa2klQ";
static String OAuthConsumerSecret = "NCJQHyzSbGjMgYnh7jfebwuz53Q6KdJvS7UjhZI0ulSwLnNIR2";
static String AccessToken = "90955642-3RkC0rHoSEAxfHiLzhA6ybZgJJ8Re3rHNNKC383ZV";
static String AccessTokenSecret = "JB3uaou6yDNAnUrNtPnAqqFE23U1i1KkDGSyQGIfEOU99";

TwitterStream twitter = new TwitterStreamFactory().getInstance();

// Initial connection
void connectTwitter() {
  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);
}

//Loading up the access token
private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}



//This listens for new tweet
StatusListener listener = new StatusListener() {

  public void onStatus(Status status) {
    boolean bool = true;
    while(bool) {
      println("@" + status.getUser().getScreenName() + " - " + status.getText());
      bool = false; 
    }
  }
  
  public void onStallWarning(StallWarning stallWarning) {}
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}

  public void onScrubGeo(long userId, long upToStatusId) {
    System.out.println("Got scrub_geo event userId:" + userId + "upToStatusId:" + upToStatusId);
  }
  
  // Exception notice
  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};

void setup() {
  connectTwitter();
  twitter.addListener(listener);
  twitter.sample();
}

void draw() {
  
}
