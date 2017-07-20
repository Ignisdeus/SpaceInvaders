PVector bulletPos = new PVector(-10,-10);
float bulletSpeed = 10;
float bulletSize = 20;
void bullet(){
  
  bulletPos.y -= bulletSpeed;
  
  if(bulletPos.y < 0){
   canFire = true; 
    
  }
  fill(255,0,0);
  rect(bulletPos.x,bulletPos.y,bulletSize/4,bulletSize);
  
}
int score =0;
int timer = 90;
void hud(){
  
  if(frameCount % 60 ==0){
    timer --;
  }
  
  if(timer <=0){
    println("GAME OVER");
    
  }
  textAlign(CENTER,CENTER);
  textSize(23);
  text("Score: " + score,width/2, 25);
   text("Time " + timer,width* 0.9f, 25);
  
}