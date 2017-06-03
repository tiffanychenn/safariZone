Avatar a;

void setup(){
  size(256,256);
  a = new Avatar("Dawn");
  PImage j = loadImage("terrains/meadow.png");
  for (int i = 0; i < 16; i ++){
    image(j, 64 * (i / 4), 64 * (i % 4));
  }
}

void draw(){
  a.display();
}