class GameObject {

  PVector pos, tLocLeft, tLocRight;
  float size, speed;

  GameObject(float x, float y, float size, float speed) {

    pos = new PVector (x, y);
    this.size = size;
    this.speed = speed;
  }

  void update() {
  }

  void render() {
  }
}

class Npc extends GameObject {

  boolean right = true;

  Npc(float x, float y, float size, float speed) {

    super(x, y, size, speed);

    tLocLeft = new PVector(pos.x - size, pos.y);
    tLocRight= new PVector(pos.x + size, pos.y);
  }

  void update() {

    if (pos.x <= tLocLeft.x) {
      right = true;
    }
    if (pos.x >= tLocRight.x) {
      right = false;
    }
    
    if(right){
      pos.x += speed;
    }else{
      pos.x -= speed;
    }
    
  }

  void render() {
    
    rect(pos.x,pos.y, size,size);
    
  }
}