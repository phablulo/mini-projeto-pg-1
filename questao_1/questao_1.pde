float speed = PI/2;

float width = 800;
float height = 400;
float[] origin = {width/2, height/2};
Coordinate coor = new Coordinate();
Particle part = new Particle();

void settings() {
  size((int)width, (int)height);
}
void draw() {
  background(0);
  coor.display();
  part.display();
}


// ----------------------
class Coordinate {
  float tick = 50; // px per tick
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
class Particle {
  int direction = -1;
  PVector vector;
  Particle() {
    // inicia em (1, 0)
    vector = new PVector(1, 0);
  }
  void display() {
    fill(255, 0, 0);
    float[] point = coor.transform(vector.x, vector.y);
    circle(point[0], point[1], 10);
    update();
  }
  void update() {
    // rotaciona o vetor e ajusta sua magnitude
    vector.rotate(direction * speed/frameRate);
    float theta = vector.heading();
    if (theta > PI || theta < 0) {
      direction *= -1;
      vector.rotate(direction * 2 * speed/frameRate);
    }
    vector.setMag(theta/PI + 1);
  }
}
