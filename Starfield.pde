//your code here

// idea: insects come out of flower when clicked <closed face flower --> open flower>
boolean clicked = false;
Particle[] bob = new Particle[200];
void mousePressed(){
  // add where <the closed flower ++ its opening mouth>
  clicked= true;
}

void setup(){
  size(600, 600);
  noStroke();
  

  
  for(int i=0; i<bob.length; i++)
    bob[i] = new Particle();
    bob[0] = new OddballParticle();
    
}
void draw(){
  //background(0,40,100);
  background(#02BCB7);
  
  //oddball
  fill(#F74646); //petals
  ellipse(270,280,40,40);
  ellipse(300,270,40,40);
  ellipse(330,280,40,40);

  fill(#46F747); //head
  ellipse(300,300,90,70);
  
  rect(290, 300, 20, 300);
  rect(290, 400, 20, 300);
  rect(290, 500, 20, 300);
  
  fill(0); //eyes
  ellipse(280,280,10,10);
  ellipse(320,280,10,10);
  
  
  for(int i=0; i<bob.length; i++){
    if(clicked == true)
      bob[i].show();
      bob[i].move();
  }
}


class Particle
{
  //your code here
  int myColor, myX, myY, myWidth, myHeight;
  double Speed, myOpacity, myAngle;
  Particle(){
   myX = 300;
   myY = 300;
   myWidth = (int)(Math.random()*10)+20;
   myHeight = (int)(Math.random()*30)+20;
   myColor = (int)(Math.random()*255);
   myAngle = Math.random()*2*Math.PI;
   Speed = (Math.random()*5)+1;
   myOpacity = (Math.random()*60)+60;
  }
  void show(){
    fill(150, myColor/3, myColor);
    ellipse(myX,myY,myWidth/4,myHeight/4);
    rect(myX+1, myY-15, myWidth/9, myHeight/3);
    triangle(myX+1, myY-15, myX+5, myY-10, myX+1, myY-5);
  
  }
  void move(){
    myX += (int)(Math.cos(myAngle)*Speed);
    myY += (int)(Math.sin(myAngle)*Speed);
    if ((myX>600)||(myX < 0))
      myX = 300;
    if ((myY>600)||(myY < 0))
      myY = 300;
  
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  OddballParticle(){
    myX = 300;
    myY = 300;
    myWidth = 60;
    myHeight = 40;
    Speed = 1;
    myAngle = 0;
    myColor = (int)(Math.random()*20)+80;
    myOpacity = (Math.random()*60)+100;
  }
  void show(){
    fill(#FCFC29);
    quad(132, 404, 250, myY-130, 226, 272, 300, 484);
    
    fill(myColor, 255, myColor);
    rect(290, 300, 20, 300);
    fill(myColor/8, 255, myColor/8);
    rect(290, 400, 20, 300);
    fill(myColor/2, 150, myColor/2);
    rect(290, 500, 20, 300);
    
    fill(#FCFC29);
    quad(332, 404, 450, myY, 426, 472, 300, 484);
    
    fill(#FC2929);
    ellipse(myX,myY,myWidth,myHeight);
    fill(0);
    ellipse(myX,myY,myWidth/2,myHeight/2);
    
    fill(#FCFC29);
    ellipse(280,280,10,10);
    ellipse(320,280,10,10);
    

    
  }
  void move(){
    
    myX += Math.cos(myAngle*8)-9;
    myY += Math.sin(myAngle*8)-9;
    myAngle += 0.1;
    if ((myX<285) && (myY <285)){
      myX = 300;
      myY = 300;}
  }
}
