//-------------------------------------------------------
class Modulo extends ModuloBase {
  
  //-------------------------------------------------------
  Modulo(PVector posicao, PVector tamanho, boolean resizable) {
    super(posicao, tamanho, resizable);
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
    
    if (selected && resizable) {
      println("FPS: " + frameRate);
      fill(0);
      ModuloBase lu, lc, ld, ru, rc, rd, cu, cd;
      
      lu = new ModuloBase(new PVector(posicao.x-10, posicao.y-10), new PVector(5, 5));
      lu.display();

      /*
      rect(posicao.x-10, posicao.y-10, 5, 5);
      rect(posicao.x-10, posicao.y+tamanho.y+5, 5, 5);
      rect(posicao.x+tamanho.x+5, posicao.y-10, 5, 5);
      rect(posicao.x+tamanho.x+5, posicao.y+tamanho.y+5, 5, 5);
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

