public class FireObject
{
  /* 
   * FireObject Class
   * Description: Manage bullets and check collisions with entity
   * 
   * testAlive void: Test if bullet are still on window region. If they aren't, kill them.
   * move void: Makes them move randomly and draw it.
   * reset void: Create bullet when player press SpaceBar
   * collision void: Check collision with each entity alive. If it collide an entity, remove 1 HP to the entity and dispawn the bullet
   *
   */
  
  int bul_x = 0;
  int bul_y = 0;
  int type = 1;
  boolean alive = false;
   
  
  void testAlive() 
  {
    if (bul_x <= 0 || bul_x >= width || bul_y <= 0 || bul_y >= height) { alive = false; }
    else { alive = true; }  
  }
  
  void move()
  {
    bul_x += random(-11,11);
    bul_y -= 9;
    ellipse(bul_x, bul_y, 10, 10);
  }
  
  void reset()
  {
    bul_x = player.x;
    bul_y = player.y - 20;
    alive = true;
  }
  
  void collision()
  {
    for (int i = 0; i < player.entityLimit; i++)
    {
      if (entity[i].alive == true && entity[i].type < 10)
      {
        if ((bul_x > entity[i].mob_x - entity[i].size && bul_x < entity[i].mob_x + entity[i].size) && (bul_y > entity[i].mob_y - entity[i].size && bul_y < entity[i].mob_y + entity[i].size))
        {
          entity[i].hp--;
          if (entity[i].hp <= 0) { entity[i].killed(); }
          alive = false;
        }
      }
    }
  }
  
}