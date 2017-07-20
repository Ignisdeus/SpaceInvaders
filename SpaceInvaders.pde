// This is a basic Space Invaders Clone 


ArrayList <GameObject> gameObject = new ArrayList<GameObject>();
float size = 30, speed = 0.5f, playerSpeed = 3f, playerSize = 40;
int npcCount = 15;
float startingPoint = 100;
PVector playerStart ;
boolean canFire = true;
void setup() {

  frameRate(60);
  playerStart = new PVector( width/2, height * 0.95f);
  rectMode(CENTER);
  size(960, 600);

  for ( int y = 0; y < npcCount/2; y ++) {
    for ( int i = 0; i < npcCount; i ++) {
      gameObject.add(new Npc(startingPoint +(50 * i), startingPoint +(50 * y), size, speed ));
    }
  }
  gameObject.add(new Player(playerStart.x, playerStart.y, playerSize, playerSpeed ));
}

void draw() {
  background(0);

  gameObjectsLoop();
  bullet();
  hud();
}

void gameObjectsLoop() {

  for ( int i =0; i < gameObject.size(); i ++) {
    GameObject c = gameObject.get(i);

    c.update();
    c.render();
  }
}