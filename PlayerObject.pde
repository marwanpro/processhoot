public class PlayerObject 
{
  /*
   * PlayerObject Class
   * Description: Contains most of variables, and void which manages player
   *
   * update void: Regenerate background and display player.
   * bomb void: When player uses bomb, clear all entities and pass the level.
   * killed void: On death, pass the level and reset player.
   * gameOver void: When the player has 0 lifes, quit the game with a sum up window
   *
   */
  
  public int life = 7;
  public int bomb = 5;
  public int x = 400;
  public int y = 500;
  public int movInterval = 5;
  public int hitbox = 38;

  public boolean upkey = false;
  public boolean downkey = false;
  public boolean leftkey = false;
  public boolean rightkey = false;
  public boolean firekey = false;

  public int bulletType = 1;
  public int bulletPower = 1;
  public int bulletLimit = 120;
  public float bulletCooldown = 0.01;
  
  public int entityLimit = 100;
  public int waveLevel = 1;
  public int score = 450;
  public int lastScoreKnown;
  public int timeStamp = 0;

  void update() 
  {
    background(bg_img);
    hud.update();
    ellipse(x, y, 40, 40);
  }

  void bomb() 
  {
    if (timeStamp + 2000 > millis() || bomb == 0) return;
    timeStamp = millis();
    for (int i=0; i < player.entityLimit; i++)
    {
      entity[i].killed();
    }
    bomb--;
  }
  
  void killed()
  {
    bomb++;
    bomb();
    life--;
    if (life == 0) { gameOver(); }
    x = 400;
    y = 500;
    update();
    delay(500);
  }
  
  void gameOver()
  {
    JOptionPane.showMessageDialog(frame,
    "Game Over ! You reached the Level " + waveLevel +  " and you scored: " + score,
    "ProcesShooter v0.8 Beta (Build 0027)",
    JOptionPane.INFORMATION_MESSAGE);
    exit();
  }
}