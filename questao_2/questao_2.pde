void setup() {
  size(600, 600, P3D);
}
void draw() {
  background(180);
  translate(width/2, height/2, 0);
  strokeWeight(0.1);
  stroke(0);
  scale(20);
  rampa();
  // a rampa possui uma rotação de 37 graus em relação ao plano XY.
  // Assim, vou rotacionar tudo pra facilitar a vida
  rotateX(radians(37));

  circunferencia();
  roda();
}
void rampa() {
  pushMatrix();
  fill(90, 180, 110);
  translate(-5, -4, -3); // pra manter a rampa centrada na origem
  beginShape();
  vertex(0, 0, 0);
  vertex(10, 0, 0);
  vertex(10, 8, 6);
  vertex(0, 8, 6);
  endShape(CLOSE);
  popMatrix();
}
void circunferencia() {
  noFill();
  stroke(255, 0, 0);
  ellipse(0, 0, 10, 10);
}
float angle = 0;
void roda() {
  stroke(0, 90, 255);
  rotateX(radians(90)); // rotaciona o espaço em 90 graus em relação à rampa
  rotateY(radians(angle)); // rotaciona o espaço em torno do centro
  translate(0, 0, -5); // vai para a circunferência
  ellipse(0, 3, 6, 6); // desenha a roda

  angle -= 1;
}
