//-------------------------------------------------------
class ModuloBase {
  
  PVector posicao, tamanho;
  boolean drag, over, selected, resizable;

  //-------------------------------------------------------
  ModuloBase(PVector posicao, PVector tamanho, boolean resizable) {
    this.posicao = posicao;
    this.tamanho = tamanho;
    this.drag = false;
    this.over = false;
    this.selected = false;
    this.resizable = resizable;
  }

  //-------------------------------------------------------
  ModuloBase(PVector posicao, PVector tamanho) {
    this.posicao = posicao;
    this.tamanho = tamanho;
    this.drag = false;
    this.over = false;
    this.selected = false;
    this.resizable = false;
  }

  //-------------------------------------------------------
  void update() {
    if (!mousePressed) {
      drag = false;
      over = false;
    }
    
    if (getOver()) {
      over = true;
      drag = mousePressed;
      if (mousePressed && mouseButton == LEFT) {
        selected = true;
      }
    }
  }

  //-------------------------------------------------------
  void display() {
    fill(0);
    noStroke();
    rect(posicao.x, posicao.y, tamanho.x, tamanho.y);
  }

  //-------------------------------------------------------
  boolean getOver() {
    if (mouseX > posicao.x && mouseX < posicao.x+tamanho.x && mouseY > posicao.y && mouseY < posicao.y+tamanho.y) {
      return true;
    } else {
      return false;
    }
  }  
  
  //-------------------------------------------------------
  boolean getDrag() {
    return drag;
  }

  //-------------------------------------------------------
  void addPosicao(PVector p) {
    posicao.add(p);
  }

  //-------------------------------------------------------
  void addTamanho(PVector t) {
    tamanho.add(t);
  }

  //-------------------------------------------------------
  void setPosicao(PVector p) {
    posicao = p;
  }

  //-------------------------------------------------------
  void setTamanho(PVector t) {
    tamanho = t;
  }
  
}

