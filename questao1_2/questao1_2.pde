float width = 400;
float height = 400;
float[] origin = {width/2, height/2};
Coordinate coordinate = new Coordinate();
Arm arm = new Arm();

void settings() {
  size((int)width, (int)height);
}
void draw() {
  background(0);
  coordinate.display();
  arm.display();
}

// ----------------------
class Coordinate {
  float tick = 35; // px per tick
  void display() {
    stroke(255);
    fill(255);
    textAlign(CENTER);
    line(0, origin[1], width, origin[1]);
    line(origin[0], 0, origin[0], height);

    // draw ticks
    float[] tickLine = transform(0, 0);
    tickLine[0] -= 10;
    tickLine[1] += 15;
    float bigger = max(width, height);
    for (int i = 1; true; ++i) {
      float[] d = transform(i, i);
      float[] e = transform(-i, -i);
      if (d[0] > bigger) break;
      text(i, d[0], tickLine[1]); // horizontal direita
      text(i, tickLine[0], d[1]); // vertical acima
      text(-i, e[0], tickLine[1]); // horizontal esquerda
      text(-i, tickLine[0], e[1]); // vertical abaixo
    }
  }
  float[] transform(float x, float y) {
    float[] r = {
      origin[0] + tick*x,
      origin[1] - tick*y
    };
    return r;
  }
}

class Arm {
  PVector superior;
  PVector inferior;
  Arm() {
    superior = new PVector(0, -2); // tamanho 2
    inferior = new PVector(0, -3); // tamanho 3
  }
  void display() {
    float[] ombro = {0, 5};
    float[] cotovelo = {ombro[0] + superior.x, ombro[1] + superior.y};
    float[] mao = {cotovelo[0] + inferior.x, cotovelo[1] + inferior.y};
    drawLine(ombro, cotovelo);
    drawLine(cotovelo, mao);
    drawPoint(ombro);
    drawPoint(cotovelo);
    drawPoint(mao);
    update();
  }
  void drawPoint(float x, float y) {
    fill(255, 0, 0);
    stroke(255);
    float[] p = coordinate.transform(x, y);
    circle(p[0], p[1], 10);
  }
  void drawPoint(float[] point) {
    drawPoint(point[0], point[1]);
  }
  void drawLine(float x1, float y1, float x2, float y2) {
    float[] p1 = coordinate.transform(x1, y1);
    float[] p2 = coordinate.transform(x2, y2);
    stroke(90, 255, 110);
    strokeWeight(5);
    line(p1[0], p1[1], p2[0], p2[1]);
    strokeWeight(1);
  }
  void drawLine(float[] p1, float[] p2) {
    drawLine(p1[0], p1[1], p2[0], p2[1]);
  }
  void update() {
    // -1.047 é o angulo, em radianos, que o vetor está
    // quando ele rotaciona 30 graus. O vetor inicialmente
    // está em 270 graus, daí 270 + 30 = 300
    // e cos(300) = 1/2 e acos(300) 1.047 radianos.
    // Porém, o vetor deve apontar pra baixo, e daí vem o negativo.
    if (superior.heading() >= -1.047) return;
    // gira o superior
    superior.rotate( (PI/6)/frameRate/2 ); // gira 30 graus em 2 segundos
    // o inferior está num espaço definido pelo superior.
    // A forma mais simples de encontrar esse espaço é copiar 
    // a transformação aplicada ao superior
    inferior.rotate( PI/6/frameRate/2 ); // - rotacao do superior
    inferior.rotate( PI/3/frameRate/2 ); // gira 60 graus em 2 segundos
  }
}
