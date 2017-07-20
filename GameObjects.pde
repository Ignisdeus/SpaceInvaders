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
    fill(255);
    if (pos.x <= tLocLeft.x) {
      right = true;
    }
    if (pos.x >= tLocRight.x) {
      right = false;
    }

    if (right) {
      pos.x += speed;
    } else {
      pos.x -= speed;
    }
    if ( pos.y + size/2 > bulletPos.y - bulletSize/2
      && pos.y - size/2 < bulletPos.y + bulletSize/2
      && pos.x + size/2 > bulletPos.x - bulletSize/2
      && pos.x - size/2 < bulletPos.x + bulletSize/2) {
      fill(255, 0, 0);
      bulletPos = new PVector(-10, 0);
      score +=  100;
      gameObject.remove(this);
    }
  }

  void render() {

    rect(pos.x, pos.y, size, size);
  }
}

class Player extends GameObject {

  Player(float x, float y, float size, float speed) {

    super(x, y, size, speed);
  }

  void update() {

    if (keyPressed) {
      if (keyCode == UP && canFire ) {
        canFire=false;
        bulletPos = new PVector(pos.x, pos.y);
      }
      if ( keyCode == RIGHT && pos.x < width-size/2) {
        pos.x += speed;
      }
      if ( keyCode == LEFT && pos.x > size/2) {
        pos.x -= speed;
      }
    }
  }

  void render() {

    fill(0, 255, 0);
    rect(pos.x, pos.y, size, size/2);
    noStroke();
    rect(pos.x, pos.y - 10, size* 0.2f, size/2);
  }
}