float raioCircunferencia = 5; // favor não alterar
float raioRoda = 1; // esse pode ser alterado

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
  ellipse(0, 0, raioCircunferencia*2, raioCircunferencia*2);
}
float angle = PI;
void roda() {
  stroke(0, 90, 255);
  rotateX(PI/2); // rotaciona o espaço em 90 graus em relação à rampa
  rotateY(angle); // rotaciona o espaço em torno do centro
  translate(0, 0, -5); // vai para a circunferência
  ellipse(0, raioRoda, raioRoda*2, raioRoda*2); // desenha a roda
  translate(0, raioRoda); // move o espaço pro centro da roda
  // calcula o comprimento a ser caminhado pela roda
  float theta = angle - 2*PI/frameRate; // 2*PI/frameRate = um giro em um segundo
  float arc = raioCircunferencia * theta;
  // calcula o angulo para rotacionar a roda baseado
  // no comprimento do arco que ela vai caminhar
  float rangle = arc/raioRoda;
  // rotaciona o espaço em torno de si próprio
  // o PI/2 é pra manter a esfera na parte de baixo da roda, no momento inicial
  rotateZ(rangle + PI/2);
  translate(raioRoda, 0); // move pra borda da roda
  stroke(255, 80, 102);
  sphere(0.2); // desenha uma esfera

  angle = theta;
}
