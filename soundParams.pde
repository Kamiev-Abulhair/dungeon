import ddf.minim.*;

Minim minim;
AudioPlayer coinSound;
AudioPlayer doorSound;

void loadSounds() {
  minim = new Minim(this);
  coinSound = minim.loadFile("Coin.wav");
  doorSound = minim.loadFile("door.wav");
}
