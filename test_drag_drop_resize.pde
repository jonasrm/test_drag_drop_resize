
ArrayList<Modulo> listaQuadrado;

//-------------------------------------------------------
void setup() {
  size(400,400);
  frameRate(30);
  //smooth();
  noSmooth();
  listaQuadrado = new ArrayList<Modulo>();
  listaQuadrado.add(new Modulo(new PVector(175,175), new PVector(50,50), true));
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

