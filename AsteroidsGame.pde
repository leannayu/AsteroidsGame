SpaceShip bob;
Star[] stars = new Star[200];
ArrayList <Bullet> bullets = new ArrayList <Bullet>(); 
ArrayList <Asteroids> asteroid = new ArrayList <Asteroids>(); 
public void setup() 
{
  size (600, 600);
  bob = new SpaceShip();
  for (int i= 0; i < 200; i++)
  {
    stars[i] = new Star();
  }
  for (int a = 0; a < 30; a++)
  {
    asteroid.add(new Asteroids());
  }
}
public void draw() 
{
  background(0);
  bob.show();
  bob.move();
  for (int i= 0; i < 200; i++)
  {
    stars[i].show();
  }
  for (int a = 0; a < asteroid.size (); a++)
  {
    asteroid.get(a).show();
    asteroid.get(a).move();
    if (dist(bob.getX(), bob.getY(), asteroid.get(a).getX(), asteroid.get(a).getY()) < 20) 
    {
      asteroid.remove(a);
    }
    for (int b = 0; b < bullets.size (); b++) {
      Bullet hit = bullets.get(b);
      hit.show();
      hit.move();
    }
    for (int b = 0; b < bullets.size (); b++) {
      if (dist(bullets.get(b).getX(), bullets.get(b).getY(), asteroid.get(a).getX(), asteroid.get(a).getY()) < 25) {
        asteroid.remove(a);
        bullets.remove(b);
        break;
      }
    }
  }
}
public void keyPressed()
{
  if (key == 'a')
  {
    bob.rotate(-10);
  }
  if (key == 'd')
  {
    bob.rotate(10);
  }
  if (key == 'w')
  {
    bob.accelerate(0.3);
  }
  if (key == 's')
  {
    bob.setPointDirection((int)(Math.random()*600));
    bob.setDirectionX(0);
    bob.setDirectionY(0);
    bob.setX((int)(Math.random()*600));
    bob.setY((int)(Math.random()*600));
  }
  if (key == ' ')
  {
    Bullet shot = new Bullet(bob);
    bullets.add(shot);
  }
}

class Star
{
  int starX, starY, starColor;
  public Star()
  {
    starX = (int)(Math.random()*600);
    starY = (int)(Math.random()*600);
    starColor = 255;
  }
  public void show()
  {
    stroke(starColor);
    point(starX, starY);
  }
}
class SpaceShip extends Floater  
{ 
  public SpaceShip ()  
  {
    corners = 4;
    int[] xS = {
      -8, 13, -8, -5
    };
    int[] yS = {
      -8, 0, 8, 0
    };
    xCorners = xS;
    yCorners = yS;
    myColorR = (int)(Math.random()*255);
    myColorG = (int)(Math.random()*255);
    myColorB = (int)(Math.random()*255);
    myCenterX = 300; 
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }   
  public void setY(int y) {
    myCenterY = y;
  }   
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return (double)myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return (double)myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return (int)myPointDirection;
  }
}
class Asteroids extends Floater
{
  private int rotSpeed;
  public Asteroids ()
  {
    corners = 6;
    int[] xS = {
      -7, 3, 9, 2, -7, -1
    };
    int[] yS = {
      -4, -4, 0, 6, 4, 0
    };
    xCorners = xS;
    yCorners = yS;
    myColorR = 180;
    myColorG = 180;
    myColorB = 180;
    myCenterX = (int)(Math.random()*600);
    myCenterY = (int)(Math.random()*600);
    myDirectionX = (int)(Math.random()*5)-2;
    myDirectionY = (int)(Math.random()*5)-2;
    rotSpeed = (int)(Math.random()*5)-2;
  }
  public void setX(int x) {
    myCenterX = x;
  }
  public int getX() {
    return (int)myCenterX;
  }   
  public void setY(int y) {
    myCenterY = y;
  }   
  public int getY() {
    return (int)myCenterY;
  }
  public void setDirectionX(double x) {
    myDirectionX = x;
  }
  public double getDirectionX() {
    return (double)myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return (double)myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection = degrees;
  }
  public double getPointDirection() {
    return (int)myPointDirection;
  }
  public void move() 
  {
    rotate(rotSpeed);
    super.move();
  }
}
class Bullet extends Floater {
  public void setX(int x) {
    myCenterX=x;
  }
  public int getX() {
    return (int)myCenterX;
  }
  public void setY(int y) {
    myCenterY=y;
  }   
  public int getY() {
    return (int)myCenterY;
  }    
  public void setDirectionX(double x) {
    myDirectionX=x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }   
  public void setDirectionY(double y) {
    myDirectionY=y;
  }  
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) {
    myPointDirection=degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  }
  private double dRadians;
  private float bSize;
  public Bullet(SpaceShip theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    bSize = 4;
    myPointDirection = theShip.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = (5*Math.cos(dRadians) + theShip.getDirectionX());
    myDirectionY = (5*Math.sin(dRadians) + theShip.getDirectionY());
    myColorR = 255;
    myColorG = 0;
    myColorB = 0;
  }
  public void show() {
    fill(255);
    ellipse((float)myCenterX, (float)myCenterY, bSize, bSize);
  }
  public void move() {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColorR;
  protected int myColorG; 
  protected int myColorB;  
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees      
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColorR, myColorG, myColorB);   
    stroke(myColorR, myColorG, myColorB);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 
