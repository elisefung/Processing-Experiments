/* ---------------------------------------------
 TAGS HEAT MAP
 Data Visualization through the 8tracks API
 -------------------------------------------- */

String apiKey = "88c6f6de41c92d6f0fe0af4e09b12f22328554de";
XML eightTracksData;
XML cloud;
XML tagcloud;
XML[] tags;
String[] tagnames;
String[] tagcount;
Table tagtable;

void setup() {
  size(1400, 600);
  background(0);
  noStroke();
  smooth();
  noLoop();

  // Load XML data from 8tracks
  String eightTracks = new String("http://8tracks.com/tags.xml?api_key=" + apiKey + "&api_version=3");
  eightTracksData = loadXML("tags.xml"); // was having trouble with 8tracks API, so running off local copy of dataset

  // store individuals tags from the tag-cloud
  cloud = eightTracksData.getChild("tag-cloud");
  tagcloud = cloud.getChild("tags");
  tags = tagcloud.getChildren("tag"); 

  // initialize table that will store name (string), count (int), and shade (color)
  tagtable = new Table();
  tagtable.addColumn("name");
  tagtable.addColumn("count");
  tagtable.addColumn("r");
  tagtable.addColumn("g");
  tagtable.addColumn("b");

  // store tag name and count number (as string for now)
  for (int i = 0; i < tags.length; i++) {
    int counter = 1;
    TableRow newRow = tagtable.addRow();
    newRow.setString("name", tags[i].getChild("name").getContent());
    newRow.setString("count", tags[i].getChild("cool-taggings-count").getContent());
    newRow.setFloat("r", random(0, 255));
    newRow.setFloat("g", random(0, 255));
    newRow.setFloat("b", random(0, 255));
  }
  tagtable.removeTokens("+,"); // removes + and , characters
  saveTable(tagtable, "table.csv");

  // convert the count string to int
  for (TableRow row : tagtable.rows ()) {
    String c = row.getString("count"); // get count string
    int count = int(c); // convert to int
    row.setInt("count", count); // save int value
  }


  println("Number of tags: " + tagtable.getRowCount());
}

void draw() {
  int y = 70;
  
  // draw circles in proportion to number of mixes per tag
  for (TableRow row : tagtable.rows ()) {
    fill(row.getFloat("r"), row.getFloat("g"), row.getFloat("b"), 150);
    ellipse(random(300, width-100), random(0, height-100), row.getInt("count")/200, row.getInt("count")/200);
  }
  
  fill(255, 180);
  rect(0, 0, 200, height);
  textSize(18);
  text("MOST POPULAR TAGS", 5, 30);
  
  // draw color labels
  for (TableRow row : tagtable.rows()) {
    fill(row.getFloat("r"), row.getFloat("g"), row.getFloat("b"));
    textSize(18);
    text(row.getString("name"), 20, y);
    y+=20;
  }
}

