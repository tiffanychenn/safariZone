Simulation s;

void setup() {
  size(512, 384);
  s = new Simulation();
}

void draw() {
  s.update();
  s.display();
}