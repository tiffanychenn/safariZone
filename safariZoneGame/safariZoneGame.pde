Simulation s;

void setup(){
  size(256,256);
  s = new Simulation();
}

void draw(){
  s.update();
  s.display();
}