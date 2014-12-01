

//Show the demo.
//   Wiggly moving things + random wavy lines
//   Also show that you can just issue commands in the setup to mess with turtles to start.

//Priorities:
//1. Students Familiarize themselves with turtles by creating a single variable turtle. 
//   They then issue commands in the setup (without a draw for now) to see how it behaves.
//2. Write a method doStuff(Turtle t) that takes a Turtle as a parameter and moves it 
//   around the screen drawing lines.  
//3. Convert the method into a member of the Turtle class.
//4. Students make a method in the Turtle class: polygon(numSides,sideLength)
//5. After working with the Turtles for a while, talk about fractal tree. 
//6. Students make a method in the Turtle class: tree(depth)
//7. improve the tree command by adding parameters for branchLength, turnAngle, etc. 


Turtle[] boxOfTurtles;
Turtle fred;

void setup() {
  size(800, 600);
  background(0); 
  boxOfTurtles = new Turtle[20];
  for (int i = 0; i < boxOfTurtles.length; i++) {
    boxOfTurtles[i]= new Turtle(); //random color turtle at the center of the screen 
    boxOfTurtles[i].penDown();//make them draw
  }
  
  //issue single commands to a turtle to test code: (if you don't use a draw)
  fred = new Turtle();
  fred.penDown();
  fred.forward(50.0);
  fred.right(50.0);
  fred.forward(50.0);
  fred.left(90.0);
  fred.forward(25.0);
  fred.draw();
}

void draw() {
  if(frameCount < 500){
    //disable animation for 200 frames to demo the fred stuff
  }else if ( mousePressed ) {
    draw2();
  } else {
    draw1();
  }
  fill(255);
  text("Click the mouse on the screen to see alternate demo", 20, 20);
}


public void draw1() {
  background(0);//if you use the background procedure, you must redraw 
  //what the turtles have drawn. This is only good if you want to 
  //animate turtles moving around, and have them redraw things.
  for (int i = 0; i < boxOfTurtles.length; i++) {
    boxOfTurtles[i].wiggle();     //random motion
    boxOfTurtles[i].draw();       //to draw them every frame run this method
    boxOfTurtles[i].screenWrap(); //to keep them on screen run this method
  }
}

public void draw2() {
  //Instead of drawing the turtles, you can just draw the path they take.
  //This allows you to see the wiggle motion step by step.
  //By not drawing the background you can see where they went when their pen is down.
  for (int i = 0; i < boxOfTurtles.length; i++) {
    boxOfTurtles[i].wiggle();    //random motion
    //do NOT draw the turtles, instead let them draw lines!
    boxOfTurtles[i].screenWrap();//to keep them on screen run this method
  }
}

