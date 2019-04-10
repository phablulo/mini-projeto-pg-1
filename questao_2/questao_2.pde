void setup() {
  size(600, 600, P3D);
}
void draw() {
  background(180);
  translate(200, 200, 0);
  strokeWeight(0.1);
  stroke(0);
  scale(20);
  rampa();
  circunferencia();
  roda();
}
void rampa() {
  fill(90, 180, 110);
  beginShape();
  vertex(0, 0, 0);
  vertex(10, 0, 0);
  vertex(10, 8, 6);
  vertex(0, 8, 6);
  endShape(CLOSE);
}
void circunferencia() {
  noFill();
  stroke(255, 0, 0);
  rotateX(radians(37));
  ellipse(5, 5, 10, 10);
  //float[][] points = {
  //  {5, 0, 0},
  //  {10, 4, 3},
  //  {5, 8, 6},
  //  {0, 4, 3}
  //};
}
float angle = 270;
void roda() {
   stroke(0, 90, 255);
   float theta = radians(angle);
   float x = 5*cos(theta) + 5;
   float y = -5*sin(theta) + 5;
   ellipse(x, y, 5, 5);
   angle += 1;
}
