PImage bgpic1, bgpic2, bgpic3, bulbasaurPic, squirtlePic, gengarPic, pikachuPic, pillarpic, startscreen, winScreen;
int game, score, highscore, x, y, vertical, pipex[] = new int[2], pipey[] = new int[2];
void setup()
{

  bgpic1 = loadImage("https://github.com/ashikak04/FinalProject/blob/main/green-game-background.jpeg?raw=true");
  bgpic2 = loadImage("https://github.com/ashikak04/FinalProject/blob/main/newest-blue-gamepic.png?raw=true");
  bgpic3 = loadImage("https://github.com/ashikak04/FinalProject/blob/main/purple-game-background.png?raw=true");
  bulbasaurPic = loadImage("https://github.com/ashikak04/FinalProject/blob/main/bulbasaur-pic.png?raw=true");
  squirtlePic = loadImage("https://github.com/ashikak04/FinalProject/blob/main/squirtle-pic.png?raw=true");
  gengarPic = loadImage("https://github.com/ashikak04/FinalProject/blob/main/gengar-pic.png?raw=true");
  pikachuPic = loadImage("https://github.com/ashikak04/FinalProject/blob/main/pikachu-pic.png?raw=true");
  pillarpic = loadImage("https://github.com/ashikak04/FinalProject/blob/main/game%20pipe%20pic.png?raw=true");
  startscreen = loadImage("https://github.com/ashikak04/FinalProject/blob/main/startScreenPic.png?raw=true");
  winScreen = loadImage("https://github.com/ashikak04/FinalProject/blob/main/win-screen.jpeg?raw=true");

  game = 1; score = 0; highscore = 0; x = -200; vertical = 0;
  size(600, 800);
  fill (0, 0, 0);
  textSize(40);
}

void draw()
{
  if ((game == 0) && (score < 5))
  {
    bgpic1.resize(600,800);
    imageMode(CORNER);
    image(bgpic1, x, 0);
    image(bgpic1, x+bgpic1.width, 0);
    x -= 5;
    vertical +=1;
    y += vertical;
    if (x == -580) x = 0;
    for (int i = 0; i<2; i++)
    {
      imageMode(CENTER);
      image(pillarpic, pipex[i], pipey[i] - (pillarpic.height/2+100));
      image(pillarpic, pipex[i], pipey[i] + (pillarpic.height/2+100));
      if (pipex[i] < 0)
      {
        pipey[i] = (int)random(200, height-200);
        pipex[i] = width;
      }
      if (pipex[i] == width/2) highscore = max(++score, highscore);
      if (y>height||y<0||(abs(width/2-pipex[i])<25 && abs(y-pipey[i])>100)) game=1;
      pipex[i] -= 6;
    }
    bulbasaurPic.resize(50,50);
    image(bulbasaurPic, width/2, y);
    text ("Level 1", 10, 85);
    text("Score: "+score, 10, 40);
  }

  else if ((game == 0) && (score > 4) && (score < 10))
  {
    bgpic2.resize(600,800);
    imageMode(CORNER);
    image(bgpic2, x, 0);
    image(bgpic2, x+bgpic2.width, 0);
    x -= 5;
    vertical +=1;
    y += vertical;
    if (x == -600) x = 0;
    for (int i = 0; i<2; i++)
    {
      imageMode(CENTER);
      image(pillarpic, pipex[i], pipey[i] - (pillarpic.height/2+100));
      image(pillarpic, pipex[i], pipey[i] + (pillarpic.height/2+100));
      if (pipex[i] < 0)
      {
        pipey[i] = (int)random(200, height-200);
        pipex[i] = width;
      }
      if (pipex[i] == width/2) highscore = max(++score, highscore);
      if (y>height||y<0||(abs(width/2-pipex[i])<25 && abs(y-pipey[i])>100)) game=1;
      pipex[i] -= 6;
    }
    squirtlePic.resize(50,50);
    image(squirtlePic, width/2, y);
    text ("Level 2", 10, 85);
    text("Score: "+score, 10, 40);
  }

else if ((game == 0) && (score > 9) && (score < 15))
  {
    bgpic3.resize(600,800);
    imageMode(CORNER);
    image(bgpic3, x, 0);
    image(bgpic3, x+bgpic3.width, 0);
    x -= 5;
    vertical +=1;
    y += vertical;
    if (x == -600) x = 0;
    for (int i = 0; i<2; i++)
    {
      imageMode(CENTER);
      image(pillarpic, pipex[i], pipey[i] - (pillarpic.height/2+100));
      image(pillarpic, pipex[i], pipey[i] + (pillarpic.height/2+100));
      if (pipex[i] < 0)
      {
        pipey[i] = (int)random(200, height-200);
        pipex[i] = width;
      }
      if (pipex[i] == width/2) highscore = max(++score, highscore);
      if (y>height||y<0||(abs(width/2-pipex[i])<25 && abs(y-pipey[i])>100)) game=1;
      pipex[i] -= 6;
    }
    gengarPic.resize(50,50);
    image(gengarPic, width/2, y);
    text ("Level 3", 10, 85);
    text("Score: "+score, 10, 40);
  }
  
  else if ((game == 0) && (score > 14))
  {
    imageMode(CENTER);
    winScreen.resize(600,800);
    image(winScreen, width/2, height/2);
    fill (204, 100, 31);
    text("You Won!", 200, 400);
  }

  else
  {
    imageMode(CENTER);
    startscreen.resize(600,800);
    image(startscreen, width/2, height/2);
    pikachuPic.resize(250,250);
    image(pikachuPic, 200, 450);
    text("Click to Start", width/2, height/2);
    text ("POKEMON PERIL!", 150, 250);
    text("High Score: "+highscore, 50, 130);
  }
  
}

void mousePressed()
{
  vertical = -15;
  if(game==1)
  {
    pipex[0] = 600;
    pipey[0] = y = height/2;
    pipex[1] = 900;
    pipey[1] = 600;
    x = game = score = 0;
  }
}
