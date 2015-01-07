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
  
  size(width,height);
  f = createFont("Segoe UI", 48);
  textFont(f);
  background(color(0,0,0));
  
  
}

/* Must have for Processing */
void draw() {
  
  //Create labels
  fill(color(40,40,40)); //Gray
  rect(width*0, height*.05, width*4, height*.1);
  rect(width*.6, height*.05, width*1, height*.1);
  
  // Set labels
  fill(color(255,255,255));
  text(team1, width*.15, height*.125);
  text(team2, width*.75, height*.125);
  
  //Calculate percentage of tweets
  double percent = (double)team1_counter / (team1_counter+team2_counter + 1);
  
  //Team 1's percentage
  fill(team1_color);
  rect(width*0, height*.25, (int)(width*percent), height*.4);
  
  //Team 2's percentage
  fill(team2_color);
  rect((int)(width*percent), height*.25, width*1, height*.4);
  
  fill(team2_color);
  text(Double.toString(round((float)percent*1000)/(double)10)+"%", (int)(percent*width/2.5),(int)height*.47);
  
  fill(team1_color);
  text(Double.toString(100-round((float)percent*1000)/(double)10)+"%", width-(int)((1-percent)*width/1.9),(int)height*.47);
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
      /* Display profile pic */
      image(loadImage((status.getUser().getMiniProfileImageURL())), (int)random(width*.45), height-(int)random(height*.4));
    }
    if (status.getText().indexOf(team2) != -1) {
      team2_counter++;
      /* Display profile pic */
      image(loadImage((status.getUser().getMiniProfileImageURL())), (int)random(width*.45), height-(int)random(height*.4));
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

