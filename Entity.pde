public class Entity
{
  /* 
   * Entity Class
   * Description: This class allows to give orders to ennemies objects
   * 
   * Type: 1  == Mob with horizontal move
   *       2  == Mob with vertical move
   *       3  == Mob with random move
   *       
   * move void: Move the entity according to the type. Check collision to border of the window.
   * collision void: Check collsion with the player. On detection summon player.killed()
   * reset void: Reset the entity. Called by Level Manager.
   * killed void: Disable the entity if killed, give score points and bomb each 10000 points
   *
   */
  
  int mob_x = 400;
  int mob_y = 100;
  int speed = 3;
  int x_speed = 3;
  int y_speed = 3;
  int x_dif = speed;
  int y_dif = speed;
  int hp = 1;
  int size = 20;
  int type = 1;
  boolean alive = false;
  
  
  void move()
  {
    if (type == 1)
    {
      mob_x = mob_x + x_dif;
      if (mob_x >= width - size) { x_dif = -speed;}
      if (mob_x <= size) { x_dif = speed;}
      rectMode(RADIUS);
      fill(200, 0, 0);
      rect(mob_x, mob_y, size, size);
    }
    if (type == 2)
    {
      mob_y = mob_y + y_dif;
      if (mob_y >= height - size - 35) { y_dif = -speed;}
      if (mob_y <= size) { y_dif = speed;}
      rectMode(RADIUS);
      fill(0, 200, 0);
      rect(mob_x, mob_y, size, size);
    }
    if (type == 3)
    {
      mob_x = mob_x + x_dif;
      mob_y = mob_y + y_dif;
      if (mob_x >= width - size) { x_dif = -x_speed;}
      if (mob_x <= size) { x_dif = x_speed;}
       if (mob_y >= height - size - 35) { y_dif = -y_speed;}
      if (mob_y <= size) { y_dif = y_speed;}
      rectMode(RADIUS);
      fill(200, 200, 0);
      rect(mob_x, mob_y, size, size);
    }
    fill(255);
  }
  
  void collision()
  {
    if (abs(player.x - mob_x) <= player.hitbox && abs(player.y - mob_y) <= player.hitbox && alive == true) { player.killed(); }
  }
  
  void reset()
  {
    if (tools.randInt(0, 1) == 1) { x_dif = -speed; }
    if (tools.randInt(0, 1) == 1) { y_dif = -speed; }
    alive = true;
  }
  
  void killed()
  {
    if (alive == false) return;
    player.lastScoreKnown = player.score;
    if (type == 1) { player.score += 50; }
    if (type == 2) { player.score += 100; }
    if (type == 3) { player.score += 250; }
    if (type == 11) { player.score += 10; }
    if (type == 12) { player.score += 25; }
    if (type == 13) { player.score += 50; }
    if (int(player.score / 20000) != int(player.lastScoreKnown / 20000)) { player.bomb++; }
    alive = false;
  }
}