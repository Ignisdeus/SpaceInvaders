// This is a basic Space Invaders Clone 


ArrayList <GameObject> gameObject = new ArrayList<GameObject>();
float size = 20, speed = 2;
int npcCount = 15;
float startingPoint = 100;
void setup(){
  
  size(960,600);
  
  for( int y = 0 ; y < npcCount/2; y ++){
  for( int i = 0; i < npcCount; i ++){
  gameObject.add(new Npc(startingPoint +(50 * i), startingPoint +(50 * y), size, speed ));
  }
  }
  
}

void draw(){
  background(0);
  
  gameObjectsLoop();
  
}

void gameObjectsLoop(){
  
  for( int i =0;  i < gameObject.size(); i ++){
    GameObject c = gameObject.get(i);
    
    c.update();
    c.render();
    
  }
  
}