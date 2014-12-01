public class Turtle {
  private float heading;
  private float xcor;
  private float ycor;
  private boolean penDown;
  private color penColor;




  public Turtle() {
    this(width/2.0, height/2.0);
  }

  public Turtle(float txcor, float tycor) {
    heading = random(360);
    xcor = txcor;
    ycor = tycor;
    penDown = true;
    penColor = color(55+random(200), 55+random(200), 55+random(200), 155);
  }



  /**Change the turtle's position on the screen
   This method allows the turtles to be placed
   off of the screen, until a screenWrap() call 
   is made.
   */
  public void setXY(float x, float y) {
    xcor=x;
    ycor=y;
  }  

  /**
   Change a turtle to a specified RGB value. 
   */
  public void setColor(int r, int g, int b) {
    penColor = color(r, g, b);
  }


  /**Moves the turtle onto the screen when
   they are outside of the viewable coordinates.
   */
  public void screenWrap() {
    if (xcor<0) xcor = width + xcor;
    if (ycor<0) ycor = height + ycor;
    xcor%=width;
    ycor%=height;
  }



  /**Moves the turtle in the direction it is facing.
   Draws a line if the pen is down.
   */
  public void forward(float d) {
    float oldx = xcor;
    float oldy = ycor;
    xcor += d * sin(radians(heading));
    ycor += d * cos(radians(heading));

    stroke(penColor);
    if (penDown) {
      line(oldx, oldy, xcor, ycor);
    }
  }

  /**Moves the turtle opposite the direction it is facing.
   Draws a line if the pen is down.
   */
  public void back(float d) {
    forward(-d);
  }

  /**Rotates the turtle.
   Note: Since the coordinates are upside down, right is +, left is -
   */
  public void right(float a) {
    heading -= a;
  }
  /**Rotates the turtle.
   
   */
  public void left(float a) {
    heading += a;
  }


  /**General Random motion function
   uses forward internally
   */
  public void wiggle() {
    wiggle(1.0, 10.0);
  }

  /**Customizeable Random motion function
   uses forward internally
   */
  public void wiggle(float speed, float angle) {
    forward(speed);
    right((int)(Math.random()*angle));
    left((int)(Math.random()*angle));
  }

  /**Puts the pen down.
   This makes the turtle draw lines on the screen.
   */
  public void penDown() {
    penDown = true;
  }

  /**Puts the pen up.
   This stops the turtle from drawing lines on the screen.
   */
  public void penUp() {
    penDown = false;
  }
  
  /**Display a turtle on the screen.
   */
  public void draw() {
    stroke(0);
    fill(penColor);
    ellipse(xcor+8*sin(radians(heading-45)), ycor+8*cos(radians(heading-45)), 5, 5);
    ellipse(xcor+8*sin(radians(heading+45)), ycor+8*cos(radians(heading+45)), 5, 5);
    ellipse(xcor+8*sin(radians(heading-135)), ycor+8*cos(radians(heading-135)), 5, 5);
    ellipse(xcor+8*sin(radians(heading+135)), ycor+8*cos(radians(heading+135)), 5, 5);
    ellipse(xcor, ycor, 15, 15);
    //stroke(255);
    //line(xcor, ycor, xcor+15*sin(radians(heading)), ycor+15*cos(radians(heading)));
    ellipse(xcor+8*sin(radians(heading)), ycor+8*cos(radians(heading)), 8, 8);
  }
}

