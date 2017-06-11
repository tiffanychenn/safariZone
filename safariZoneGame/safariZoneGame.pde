import processing.sound.*;

Simulation s;
ArrayList<SoundFile> files;
int current = 0;

void setup() {
  size(512, 384);
  s = new Simulation();
  files = new ArrayList<SoundFile>();
  files.add(new SoundFile(this, "music/surf1.mp3"));
  files.add(new SoundFile(this, "music/desert.mp3"));
  files.add(new SoundFile(this, "music/meadow.mp3"));
  files.add(new SoundFile(this, "music/forest.mp3"));
  files.add(new SoundFile(this, "music/snow.mp3"));
  files.add(new SoundFile(this, "music/cave.mp3"));
  files.add(new SoundFile(this, "music/regular.mp3"));
  files.add(new SoundFile(this, "music/legend.mp3"));
  //files.get(current).play();
}

void draw() {
  s.update();
  /*if (s.updateMusic() != current){
    files.get(current).stop();
    current = s.updateMusic();
    files.get(current).play();
  }*/
  s.display();
}