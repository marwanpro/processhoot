
/*
 *  Project Name: ProcesShoot
 *  Author: Solayman ( sosowow38@gmail.com ) ; Marwan ( marwan69120@live.fr )
 *  Version: 0.8 (BETA)
 *  Last Update: 06/02/2016 17:00 @ GMT +1 
 *  License: CC BY-NC-SA 3.0 ( https://creativecommons.org/licenses/by-nc-sa/3.0/ )
 *
 *  Description: A Shoot'em up game (Like Space Invaders, Touhou...)
 *  
 *  Credits: Processing Community, Stack Overflow
 *
 *  Thread Link: N/A
 *  Install Link: N/A
 *  GitHub Link: https://github.com/marwanpro/
 *
 */
 
 /*
  *  Main Class
  *  Description: Generates objects and array of objects, initialize the stuff and draw void repeat somes commands
  *
  *  setup void: Settings up the environnement (Window Size, background, framerate, disables cursor), Load Ressources (Font, Musics, Images) and fills the arrays
  *  draw void: Loop Void with events listeners and HUD Updater
  *  keyPressed/keyReleased void: Key Listener using booleans variables (Allows to press more than one key at the same time without any detection problem)
  *
  */
 
import javax.swing.JOptionPane;
import ddf.minim.*;

PlayerObject player = new PlayerObject();
FireObject[] fireObject = new FireObject[player.bulletLimit];
Entity[] entity = new Entity[player.entityLimit];
LevelManager manager = new LevelManager();
HUD hud = new HUD();
Event event = new Event();
Tools tools = new Tools();
Minim minim;
AudioPlayer bgm;
PImage bg_img;
PImage hudLife;
PImage hudBomb;
PFont font;

void setup() 
{
  bg_img = loadImage("Andromeda_800x632_HUD.jpg");
  surface.setTitle("ProcesShooter v0.8 Beta (Build 0029)");
  background(bg_img);
  size(800, 632);
  frameRate(120);
  smooth(8);
  noCursor();
  hudLife = loadImage("hud-life.png");
  hudBomb = loadImage("hud-bomb.png");
  font = loadFont("ArcadeClassic-60.vlw");
  textFont(font, 36);
  minim = new Minim(this);
  bgm = minim.loadFile("bgm.mp3");
  tools.init();
  tools.help();
  manager.generateMob(0, 1, 400, 100, false); //<>//
}

public void draw()
{
  event.onKey();
  event.onFire();
  event.onDraw();
  hud.update();
}

void keyPressed() 
{
  if (keyCode == UP) { player.upkey = true; }
  if (keyCode == DOWN) { player.downkey = true; }
  if (keyCode == LEFT) { player.leftkey = true; }
  if (keyCode == RIGHT) { player.rightkey = true; }
  if (key == 'W' || key == 'w' || key == ' ') { player.firekey = true; }
  if (key == 'X' || key == 'x' || keyCode == ALT) { player.bomb(); }
  player.update();
}

void keyReleased() 
{
  if (keyCode == UP) { player.upkey = false ; }
  if (keyCode == DOWN) { player.downkey = false; }
  if (keyCode == LEFT) { player.leftkey = false; }
  if (keyCode == RIGHT) { player.rightkey = false; }
  if (key == 'W' || key == 'w' || key == ' ') { player.firekey = false; }
  player.update();
}