static String OAuthConsumerKey = "DfiAGTR8NjxzSwfRoARqa2klQ";
static String OAuthConsumerSecret = "NCJQHyzSbGjMgYnh7jfebwuz53Q6KdJvS7UjhZI0ulSwLnNIR2";
static String AccessToken = "90955642-3RkC0rHoSEAxfHiLzhA6ybZgJJ8Re3rHNNKC383ZV";
static String AccessTokenSecret = "JB3uaou6yDNAnUrNtPnAqqFE23U1i1KkDGSyQGIfEOU99";

TwitterStream twitter = new TwitterStreamFactory().getInstance();
boolean bool = true;

// Football Variables
String team1 = "Lions";
String team2 = "Cowboys";
int team1_counter = 0;
int team2_counter = 0;
color team1_color = color(0, 109, 176);
color team2_color = color(0, 35, 68);

//Other variables
int width = 1366;
int height = 768;

PFont f;
PImage img;

/* Must haves for Processing */
void setup() {
  connectTwitter();
  twitter.addListener(listener);
  
  //Filter tweets
  String keywords[] = {team1, team2};
  twitter.filter(new FilterQuery().track(keywords));
}

/* Must have for Processing */
void draw() {
  
}

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
    /*
    while(bool) {
      println("@" + status.getUser().getScreenName() + " - " + status.getText());
      bool = false; 
    } */
    
    if (status.getText().indexOf(team1) != -1) {
      team1_counter++;
    }
    if (status.getText().indexOf(team2) != -1) {
      team2_counter++;
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

