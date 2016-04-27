public class LevelManager
{
  /*
   * Level Manager Class
   * Description: Generate Levels
   *
   * generateMob void: Called by generateWave. According to arguments and current level, summons entities
   * generateWave void: Called by levelUp. According to level and random, generate arguments. Check each entity will not spawn on player. Each 10 level, make a special level with 3 bosses
   * levelUp void: Called by onDraw listener when there is no entity alive. Give score points to the player, and call generateWave
   *
   */
  
 
  void generateMob(int target, int type, int x, int y, boolean boss)
  {
    entity[target].mob_x = x;
    entity[target].mob_y = y;
    entity[target].type = type;
    if (type == 1)
    {
      entity[target].hp = 3 * player.waveLevel;
      entity[target].speed = tools.randInt(3, 4 + int(0.3 * player.waveLevel));
      entity[target].size = 20;
      entity[target].x_dif = entity[target].speed;
    }
    if (type == 2)
    {
      entity[target].hp = 2 * player.waveLevel;
      entity[target].speed = tools.randInt(2, 3 + int(0.25 * player.waveLevel));
      entity[target].size = 20;
      entity[target].y_dif = entity[target].speed;
    }
    if (type == 3)
    {
      entity[target].hp = int(1.5 * player.waveLevel);
      entity[target].x_speed = tools.randInt(1, 3 + int(0.1 * player.waveLevel));
      entity[target].y_speed = tools.randInt(1, 3 + int(0.1 * player.waveLevel));
      entity[target].size = 20;
      entity[target].x_dif = entity[target].speed;
      entity[target].x_dif = entity[target].speed;
    }
    if (boss == true)
    {
      entity[target].hp = entity[target].hp * 10;
      entity[target].size = entity[target].size * 2;
    }
    entity[target].reset();
  }
  
  void generateWave()
  {
    if (player.waveLevel % 10 == 0)
    {
      player.bomb++;
      player.life++;
      if (player.waveLevel == 10) 
      {
        generateMob(0, 1, 400, 100, true);
        generateMob(1, 2, 200, 250, true);
        generateMob(2, 2, 600, 250, true);
      }
      else 
      {
        generateMob(0, 3, 400, 100, true);
        generateMob(1, 3, 200, 250, true);
        generateMob(2, 3, 600, 250, true);
      }
    }
    else
    {
      int limitPerWave = tools.randInt(1,3) + int(player.waveLevel / 10); //<>//
      for (int target = 0; target <= limitPerWave; target++)
      {
        int randomType = tools.randInt(1,3);
        int x = tools.randInt(30, width - 30);
        int y = tools.randInt(30, height - 200);
        while (abs(player.x - x) <= 2 * player.hitbox || abs(player.y - y) <= 2 * player.hitbox)
        {
          x = tools.randInt(30, width - 30);
          y = tools.randInt(30, height - 200);
        }
        generateMob(target, randomType, x, y, false);
      }
    }
  }
  
  void levelUp()
  {
    player.lastScoreKnown = player.score;
    player.score += 1000;
    if (int(player.score / 20000) != int(player.lastScoreKnown / 20000)) { player.bomb++; }
    player.waveLevel++;
    generateWave();
  }
}