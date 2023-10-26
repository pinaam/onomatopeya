
PFont font;
String palabra = "auuuu";

int rainCount = 100; //raqm al mTr
Rain[] raindrops = new Rain[rainCount];
int copaHeight = 200;
int copaWidth = 20;
int copaLineSpacing = 20;
boolean changeWord = false;
float wordX = 0;
float wordSpeed = 2; 

// raqm al shajar
int[] troncoX = {110, 220, 300, 150, 250};
int[] troncoY = {500, 400, 250, 130, 30};
int[] copaX = {110, 220, 300, 150, 250};
int[] copaY = {390, 315, 170, 45, -30};


void setup() {
  size(420, 595);
  //frameRate(50);
  noCursor();
  font = createFont("IBMPlexSans-Medium.ttf", 24);
  textFont(font);
  for (int i = 0; i < rainCount; i++) {
    raindrops[i] = new Rain();
    //beginRecord(PDF,"mas_arboles.pdf");
  }
}

void draw() {
  background(255);
  drawRain();
  drawWord();

  // Troncos y copas
  for (int i = 0; i < 5; i++) {
    drawTree(troncoX[i], troncoY[i], copaX[i], copaY[i]);
  }
} 



void drawTree(int troncoX, int troncoY, int copaX, int copaY) {
  // Dibuja el tronco
  for (int i = 0; i < 16; i++) {
    text("1", troncoX, troncoY, troncoX + 10, troncoY);
    text("+", troncoX, troncoY + 5, troncoX + 10, troncoY + 5);
    troncoY += 10;
  }

  // La copa del árbol
  fill(0, 0, 0);
  noStroke();
  for (int i = 0; i < 10; i++) {
    int espacioLateral = (3 - i) * 1;
    for (int j = 0; j <= i; j++) {
      text("#", copaX - espacioLateral + j * 5, copaY);
      text("#", copaX + espacioLateral - j * 5, copaY);
    }
    copaY += 15;
  }
 
 
}

void drawRain() {
  for (int i = 0; i < raindrops.length; i++) {
    raindrops[i].fall();
    raindrops[i].display();
  }
}

void drawWord() {
  textSize(14);
  fill(0);
  if (changeWord) {
    palabra = "aaUUU";
  } else {
    palabra = "auu";
  }
  text(palabra, wordX, mouseY-50);
  wordX += wordSpeed;
  if (wordX > width) {
    wordX = 100-textWidth(palabra);
    wordSpeed = 1;
  }

  text(palabra, wordX, mouseX);
  wordX += wordSpeed;
  if (wordX > width) {
    wordX = -textWidth(palabra);
    wordSpeed = 1;
  }

  text(palabra, wordX, mouseY);
  wordX += wordSpeed;
  if (wordX > width) {
    wordX = -textWidth(palabra);
    wordSpeed = 1 ;
  }

  /* problemas
   if (changeWord) {
   Palabra = "au";
   } else {
   Palabra = "auuuu";
   }
   text();
   wordY += wordSpeed;
   if (wordY > height) {
   wordY = -textWidth(Palabra);
   wordSpeed = random(3, 5);
   }
   
   */
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    changeWord = !changeWord;
  }
}

class Rain {
  float x;
  float y;
  float speed;

  Rain() {
    x = random(width);
    y = random(-500, -50);
    speed = random(1, 5);
  }

  void fall() {
    y += speed;
    if (y > height) {
      y = random(-200, -100);
      x = random(width);  // Reinicia la posición horizontal
    }
  }

  void display() {
    stroke(0, 0, 0 );
    line(x, y, x, y + 10);
  }

  class Palabra {
    String word;
    float x;
    float y;
    float speed;

    Palabra(String word) {
      this.word = word;
      x = random(width);
      y = random(height);
      speed = random(1, 3);
    }

    void move() {
      x += speed;
      if (x > width) {
        x = -textWidth(word);
        y = random(height);
        speed = random(1, 3);
      }
    }

    void display() {
      textSize(14);
      fill(0);
      text(word, x, y);
    }
    
    } //endRecord.
  }
