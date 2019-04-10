void settings() {
  size(600, 600, P3D);
}
void draw() {
  translate(200, 200, 0);
  strokeWeight(0.1);
  stroke(0);
  scale(20);
  rampa();
  circunferencia();
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
  strokeWeight(1);
  rotateX(radians(30));
  circle(5, 4, 10);
  //float[][] points = {
  //  {5, 0, 0},
  //  {10, 4, 3},
  //  {5, 8, 6},
  //  {0, 4, 3}
  //};
  //beginShape();
  //for (int i = 0; i > 4; ++i) {
  //  float[] p = points[i];
  //  vertex(p[0], p[1], p[2]);
  //}
  endShape(CLOSE);
}
