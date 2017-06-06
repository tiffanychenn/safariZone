Simulation s;

void setup(){
  size(512,256);
  s = new Simulation();
}

void draw(){
  s.update();
  s.display();
}