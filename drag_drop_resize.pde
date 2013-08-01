
ArrayList<Modulo> listaQuadrado;

//-------------------------------------------------------
void setup() {
  size(400,400);
  frameRate(30);
  smooth();
  listaQuadrado = new ArrayList<Modulo>();
  listaQuadrado.add(new Modulo(new PVector(175,175), new PVector(50,50)));
}

//-------------------------------------------------------
void draw() {
  background(255);
  for (int i = listaQuadrado.size()-1; i >= 0; i--) {
    Modulo quadrado = listaQuadrado.get(i);
    quadrado.update();
    quadrado.display();
  }
}

//-------------------------------------------------------
void mousePressed() {
  if (mouseButton == RIGHT) {
    float r = random(10,50);
    listaQuadrado.add(new Modulo(new PVector(mouseX,mouseY), new PVector(r,r)));
  }
}

//-------------------------------------------------------
class Modulo {

  PVector posicao, tamanho;
  boolean drag, over;
  
  Modulo(PVector posicao, PVector tamanho) {
    this.posicao = posicao;
    this.tamanho = tamanho;
    this.drag = false;
    this.over = false;
  }
  
  void update() {
    //
  }
  
  boolean over() {
    if (mouseX > posicao.x && mouseX < posicao.x+tamanho.x && mouseY > posicao.y && mouseY < posicao.y+tamanho.y) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    //rectMode(CENTER);
    
    if (!mousePressed) {
      drag = false;
      over = false;
    }
    
    if (over()) {
      over = true;
      drag = mousePressed;
    }
    
    strokeWeight(4);
    if (over) {
      if (drag) {
        stroke(255,0,0);
        fill(255,0,0,100);
        float xoff = mouseX-pmouseX;
        float yoff = mouseY-pmouseY;
        posicao.x+=xoff;
        posicao.y+=yoff;
      } else {
        stroke(150,0,0);
        fill(0,20);
      }
    } else {
      stroke(0);
      fill(255);
    }
    rect(posicao.x, posicao.y, tamanho.x, tamanho.y);
    noStroke();
    noFill();
  }
  
}
