public class Event
{
  /* 
   * Event Class
   * Description: Event Listener called by the main void
   *   
   * onKey: Listen keystroke and manage Player's movement 
   * onFire: Check how many bullets are alive, create bullets and delete them if they are out of the window
   * onDraw: Check collisions of entity with player or bullet with entity and makes move them.
   *
   */
   
  boolean allowMultipleBullet = true;
  public int BulletsAlive;
  public int EntitiesAlive;
  
  
  public void onKey()
  {
    if (player.upkey == true && player.y - player.movInterval > 20) { player.y -= player.movInterval; }
    if (player.downkey == true && player.y + player.movInterval < height - 55) { player.y += player.movInterval; }
    if (player.leftkey == true && player.x - player.movInterval > 20) { player.x -= player.movInterval; }
    if (player.rightkey == true && player.x + player.movInterval < width - 20) { player.x += player.movInterval; }
    player.update();
  }
  
  public void onFire()
  {
    tools.updateBulletAlive(); //<>//
    if (player.firekey == true) 
    {
      if ((BulletsAlive == 0 || allowMultipleBullet != false) && BulletsAlive < player.bulletLimit) 
      {
        int tempBulletAlive = BulletsAlive + 1;
        for (int i = 0; BulletsAlive != tempBulletAlive; i++)
        {
          if (fireObject[i].alive == false)
          {
            fireObject[i].reset();
            tools.updateBulletAlive();
          }
        } 
      }      
    }
    
    if (BulletsAlive >= 1)  
    {
      for (int i=0; i < player.bulletLimit; i++)
      {
        fireObject[i].testAlive();
      }
    }    
  }
  
  public void onDraw()
  {
    if (bgm.isPlaying() == false) { bgm.play(); }
    if (BulletsAlive > 0)
    {
      for (int i=0; i < player.bulletLimit; i++)
      {
        if (fireObject[i].alive == true)
        {
          fireObject[i].move();
          fireObject[i].collision();
        }
      }
    }
    tools.updateEntityAlive();
    if (EntitiesAlive > 0)
    {
      for (int i=0; i < player.entityLimit; i++)
      {
        if (entity[i].alive == true) 
        { 
          entity[i].move(); 
          entity[i].collision();
        } //<>//
      }
    }
    else { manager.levelUp(); }
  }
  
  
}