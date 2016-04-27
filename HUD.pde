public class HUD
{
  /*
   * HUD Class
   * Description: Display the HUD (Bar which indicates the lifes and bombs availables, score and level)
   *
   * update void: Display lifes, bombs, level and score
   * generateScoretext void: Generate text of the score in a arcade-like style (E.g.: If the score == 25, it will generate a 6-digits string : 000025)
   *
   */
  
  String scoretext;
    
  void update()
  {
    generateScoretext();
    image(hudLife, 0, 600);
    image(hudBomb, 140, 600);
    text(player.life, 70, 628);
    text(player.bomb, 210, 628);
    text("LEVEL", 330, 628);
    text(player.waveLevel, 435, 628);
    text("SCORE", 566, 628);
    text(scoretext, 674, 628);
  }
  
  void generateScoretext()
  {
    scoretext = "" + player.score;
    if (player.score < 10) {scoretext = "0" + scoretext;}
    if (player.score < 100) {scoretext = "0" + scoretext;}
    if (player.score < 1000) {scoretext = "0" + scoretext;}
    if (player.score < 10000) {scoretext = "0" + scoretext;}
    if (player.score < 100000) {scoretext = "0" + scoretext;}    
  }
}