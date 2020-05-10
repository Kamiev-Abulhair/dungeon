int currentLevelIndex = -1;
char[][] currentLevel;
int currentLevelWidth; 
int currentLevelHeight;

void loadNextLevel() {
  if (currentLevelIndex >= LEVELS.length - 1) {
    state = VICTORY_STATE;
    return;
  }

  currentLevelIndex++;
  currentLevelWidth = LEVELS[currentLevelIndex][0].length;
  currentLevelHeight = LEVELS[currentLevelIndex].length;
  currentLevel = new char[currentLevelHeight][currentLevelWidth];

  for (int y = 0; y < currentLevelHeight; y++) {
    for (int x = 0; x < currentLevelWidth; x++) {
      char cell =  LEVELS[currentLevelIndex][y][x];
      if (cell == 'P') {
        placePlayer(x, y);
      }
      currentLevel[y][x] = cell;
    }
  }

  recalcDrawingParams();
}

void drawlevel() {
  for ( int y = 0; y < currentLevelHeight; y++) {
    for ( int x = 0; x <currentLevelWidth; x++) {
      int pixelX = x *  cellSize + centeringShiftX;
      int pixelY = y *  cellSize + centeringShiftY;
      char cell = currentLevel[y][x];
      switch (cell) {
      case'#':
        image(wallImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case' ':
      case'P':
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case'E': 
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        image(doorImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case'*':
        image(floorImage, pixelX, pixelY, cellSize, cellSize);
        coinSprite.draw( pixelX, pixelY, cellSize, cellSize);
        break;
      }
    }
  }
}

/*
Смотри. Например.. Идешь в drawMenu, и в самом начале ставишь эту комманду :img = loadImage("372597077-firewatch-E1zm-1366x768-MM-100.jpg");
 image(img, 0, 0);
 НР!
 НО!
 
 PImage img;
 И
 Скачиваешь любую фотку из инета
 идешь в папку с файлом этой игры
 создаешь папку data
 и туда все фотки
 ТАДАМ
 */
