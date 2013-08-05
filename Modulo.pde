//-------------------------------------------------------
class Modulo extends ModuloBase {
  
  ModuloBase lu, lc, ld, ru, rc, rd, cu, cd;
  
  //-------------------------------------------------------
  Modulo(PVector posicao, PVector tamanho, boolean resizable) {
    super(posicao, tamanho, resizable);
    //initialization controls
    lu = new ModuloBase(new PVector(posicao.x-10, posicao.y-10), new PVector(5, 5));
    ld = new ModuloBase(new PVector(posicao.x-10, posicao.y+tamanho.y+5), new PVector(5, 5));
    ru = new ModuloBase(new PVector(posicao.x+tamanho.x+5, posicao.y-10), new PVector(5, 5));
    rd = new ModuloBase(new PVector(posicao.x+tamanho.x+5, posicao.y+tamanho.y+5), new PVector(5, 5));
  }

  //-------------------------------------------------------
  Modulo(PVector posicao, PVector tamanho) {
    super(posicao, tamanho);
  }
      
  //-------------------------------------------------------
  void display() {
    //rectMode(CENTER);
    strokeWeight(4);
    if (over) {
      if (drag) {
        stroke(255,0,0);
        fill(255,0,0,100);
        posicao.add(moveOff());
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
    
    if (selected && resizable) {
      fill(0);      
      //left and up
      lu.update();
      lu.display();
      if (lu.getDrag()) {
        drag = false;
        tamanho.add(moveOffInverted());
        posicao.add(moveOff());
      }
      //left and down
      ld.update();
      ld.display();
      if (ld.getDrag()) {
        drag = false;
        tamanho.add(moveOffXInverted());
        posicao.x += moveOff().x;
      }
      //right and up
      ru.update();
      ru.display();
      if (ru.getDrag()) {
        drag = false;
        tamanho.add(moveOffYInverted());
        posicao.y += moveOff().y;
      }
      //right and down
      rd.update();
      rd.display();
      if (rd.getDrag()) {
        drag = false;
        tamanho.add(moveOff());
      }

      lu.setPosicao(new PVector(posicao.x-10, posicao.y-10));
      ld.setPosicao(new PVector(posicao.x-10, posicao.y+tamanho.y+5));
      ru.setPosicao(new PVector(posicao.x+tamanho.x+5, posicao.y-10));
      rd.setPosicao(new PVector(posicao.x+tamanho.x+5, posicao.y+tamanho.y+5));

      /*
      //pontos médios
      rect(posicao.x+(tamanho.x/2)-2.5, posicao.y-10, 5, 5);
      rect(posicao.x+(tamanho.x/2)-2.5, posicao.y+tamanho.y+5, 5, 5);
      rect(posicao.x-10, posicao.y+(tamanho.y/2)-2.5, 5, 5);
      rect(posicao.x+tamanho.x+5, posicao.y+(tamanho.y/2)-2.5, 5, 5);
      */
      noFill();
    }
  }

}

