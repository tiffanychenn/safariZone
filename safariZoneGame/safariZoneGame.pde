Simulation s;
Pokemon p;

void setup(){
  size(512,512);
  s = new Simulation();
}

void draw(){
  s.update();
  s.display();
}