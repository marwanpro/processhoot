public class Tools
{
  /*
   * Tools Class
   * Description: Contains tools. 
   *
   * init void: Initialize arrays
   * updateBulletAlive void: Check how many bullets are alives
   * updateEntityAlive void: Check how many entities are alives
   * randInt int: Generate a random integer in a range of two intergers
   *
   */
  
  void help()
  {
    JOptionPane.showMessageDialog(frame,
    "Welcome to ProcesShoot, a shoot'em up game ! \n" + "Arrows Keys: Move Player\n" + "SpaceBar / W: Shoot\n" + "ALT / X: Bomb",
    "Welcome to ProcesShoot",
    JOptionPane.QUESTION_MESSAGE);
  }
  
  void init()
  {
    for (int i = 0; i < player.bulletLimit; i++)
    {
      fireObject[i] = new FireObject();
    }
    for (int i = 0; i < player.entityLimit; i++)
    {
      entity[i] = new Entity();
    }
  }
  
  public void updateBulletAlive()
  {
    event.BulletsAlive = 0;
    for (int i = 0; i < player.bulletLimit; i++)
    {
      if (fireObject[i].alive == true) { event.BulletsAlive++; }
    }
  }
  
  public void updateEntityAlive()
  {
    event.EntitiesAlive = 0;
    for (int i = 0; i < player.entityLimit; i++)
    {
      if (entity[i].alive == true) { event.EntitiesAlive++; }
    }
  }
  
  public int randInt(int low, int high)
  {
    int r = int(random(low, high + 1) - 0.000001);
    return r;
  }
  
}