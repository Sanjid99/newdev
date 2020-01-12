/*
 *COMP 1010 SECTION A02
 *INSTRUCTOR: [Connel Trevena]
 *NAME: [Sanjid Bin Fuad]
 *ASSIGNMENT: [Assignment #2]
 *QUESTION: [Question #5]
 *PURPOSE: [A SIMPLE PONG GAME, WHERE THE LEFT PADDLE IS CONTROLLED
 BY THE KEYBOARD, WITH THE UP & DOWN KEYS AND THE RIGHT PADDLE IS CONTROLLED BY THE LEFT
 & RIGHT BUTTONS ON THE MOUSE. THE GAME ENDS WHENEVER, EITHER THE KEYBOARD OR THE MOUSE
 REACHES A SCORE OF 11] 
 */

//size of the ball
int ballSize;

//position of the ball
float ballPositionX; 
float ballPositionY; 

//speed of the ball
final float MIN_SPEED = 3;
final float MAX_SPEED = 6;
float speed = (float) MIN_SPEED;

//size of the paddles
final int PADDLE_WIDTH = (20);
final int PADDLE_HEIGHT = (100);

//coordinates of the LEFT paddle
float keyPaddleY;
float keyPaddleX;

//coordinates of the RIGHT paddle
float mousePaddleX ;
float mousePaddleY;

//score of keyboard
int keyScore = 0;

//score of mouse
int mouseScore = 0;

//movement of the ball
boolean moveDown = true;
boolean moveRight = true;

//gameover
boolean gameOver, moveNewSpeed;

//paddle speed
int paddleSpeed;

void setup () {

  size (700, 700);
  background (#FF7C00);

  ballPositionX = width/2;
  ballPositionY = height/2;

  keyPaddleY= height/2 - PADDLE_HEIGHT/2;
  keyPaddleX = PADDLE_WIDTH;

  mousePaddleX= width - 2*PADDLE_WIDTH;
  mousePaddleY = height/2 - PADDLE_HEIGHT/2;

  ballSize = 20;

  keyScore = 0;
  mouseScore = 0;

  paddleSpeed = 3;
}

void draw () {

  background (#030B4D);
  drawGame ();
  bounce ();
  scoreCount ();
  paddleBounce ();
  gameover ();
  canvasBounce ();

  /* the if statements below allows the paddles to move when the keys or mouse
   buttons are pressed and checks whether the paddle is hitting the top of the canvas
   or the bottom of the canvas. If so, then the paddle stops moving in that specific 
   direction when the key or mouse in pressed.
   */

  if (!(keyPaddleY <= 0)) {

    if (keyPressed) {

      if (keyCode == UP) {

        keyPaddleY = keyPaddleY - paddleSpeed;
      }
    }
  }

  if (!(keyPaddleY >= height - PADDLE_HEIGHT)) {

    if (keyPressed) {

      if (keyCode == DOWN) {

        keyPaddleY = keyPaddleY + paddleSpeed;
      }
    }
  }

  if (!(mousePaddleY <= 0)) {

    if (mousePressed) {

      if (mouseButton == LEFT ) {

        mousePaddleY = mousePaddleY - paddleSpeed;
      }
    }
  }

  if (!(mousePaddleY >= height - PADDLE_HEIGHT)) {

    if (mousePressed) {

      if (mouseButton == RIGHT ) {

        mousePaddleY = mousePaddleY + paddleSpeed;
      }
    }
  }
}

void drawGame () {

  /*this function draws the ball and both the paddles
   */

  drawScore ();
  defaultBall ();

  //the ball
  fill ( 255);
  ellipse (ballPositionX, ballPositionY, ballSize, ballSize);

  fill (#075EF0);
  strokeWeight (0.8);
  //the left paddle, which is controlled by the keyboard
  rect (keyPaddleX, keyPaddleY, PADDLE_WIDTH, PADDLE_HEIGHT);

  //the right paddle, which is controlled by the mouse
  rect (mousePaddleX, mousePaddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
}

void drawScore() {
  /* this function displays the score of the
   keyboard on the canvas.
   */

  textSize(20);

  fill (255);

  String toPrint = "Keyboard: " + keyScore;

  text(toPrint, width/4-textWidth(toPrint)/2, 50);

  toPrint = "Mouse: "+ mouseScore;

  text(toPrint, width*3/4-textWidth(toPrint)/2, 50);
}

void defaultBall () {

  /*this funtion puts the ball back into the centre of the screen when it fails to hit either
   the paddle or the top or the bottom of the screen 
   */

  if ((ballPositionX < -ballSize/2) || (ballPositionX > width + ballSize)) {

    ballPositionX = width/2;
    ballPositionY = height/2;
    speed = MIN_SPEED;
  }
}

void scoreCount () {

  /*this function counts the score of the keyboard and the mouse.
   if the balls exits the canvas through the right, the score of keyboard
   increases by 1 & vice versa.
   */

  if (ballPositionX  < -ballSize/2) {

    mouseScore = mouseScore + 1;
  }

  if (ballPositionX > width + ballSize) {

    keyScore =  keyScore + 1;
  }
}

void bounce () {

  /*this function sets the conditions of the booleans required to
   bounce the ball off the top and bottom of the canvas & the paddles
   & alos sets a random direction for the ball to travel to.
   */

  float angle = (random (0, QUARTER_PI));

  //bouncing off the top and bottom of the screen  
  if (moveDown) {

    ballPositionY += speed * (sin(angle));
  } else {

    ballPositionY -= speed * (sin(angle));
  }

  if (moveRight) {

    ballPositionX += speed * (cos(angle));
  } else {

    ballPositionX -= speed * (cos(angle));
  }
}

void paddleBounce () {

  /*this function allows the ball to bounce off the paddles and sets its minimum and maximum speeds
   according to the place the ball hits the canvas. When the ball approximately hits the middle
   of the paddles, its speed is minimum, and when it approximately hits the edge of the paddles
   the speed of the ball is maximum.
   */

  boolean hitPaddleKeyX = (ballPositionX <= (keyPaddleX + PADDLE_WIDTH + ballSize/2) &&  ballPositionX > keyPaddleX  ); 

  boolean hitPaddleKeyY = (ballPositionY < (keyPaddleY + 100) && ballPositionY > (keyPaddleY));

  float midKey = abs(ballPositionY - (keyPaddleY + PADDLE_HEIGHT/2));

  if (hitPaddleKeyX && hitPaddleKeyY) {

    if (midKey < 20) {

      speed = MIN_SPEED;
      
    } else if (speed < MAX_SPEED) {

      speed += 1;
    }

    moveRight = true;
  }

  boolean hitPaddleMouseX = ((ballPositionX >= (mousePaddleX - ballSize/2) && ballPositionX < mousePaddleX ));

  boolean hitPaddleMouseY = (ballPositionY > (mousePaddleY) && ballPositionY < (mousePaddleY + PADDLE_HEIGHT));

  float midMouse = abs(ballPositionY - (mousePaddleY + PADDLE_HEIGHT/2));

  if (hitPaddleMouseX && hitPaddleMouseY) {

    if (midMouse < 20) {

      speed = MIN_SPEED;
    } else if (speed < MAX_SPEED) {

      speed += 1;
    }

    moveRight = false;
  }
}

void canvasBounce () {

  /*this function allows the ball to bounce off the top and bottom of the canvas.
   */

  if (ballPositionY < ballSize/2) {

    moveDown = true;
  }

  if (ballPositionY > height - ballSize/2) {

    moveDown = false;
  }
}

void gameover () {

  /*this function is called whenever, either the mouse or the keyboard reaches a score
   of 11. And when that happens the games stops, with the paddles and ball not moving from
   their previous position and the ball being at its original position, which is the middle
   of the canvas.
   */

  if (gameOver) {

    speed = 0;
    paddleSpeed = 0;
    ballPositionX = width/2;
    ballPositionY = height/2;

    textSize(50);

    fill (random(255), random(255), random (255));

    String toPrint = "GAME OVER!!";

    text(toPrint, width/2-textWidth(toPrint)/2, height/2);
  }

  if (keyScore == 11 || mouseScore == 11) {

    gameOver = true;
  } else {

    gameOver = false;
  }
}
