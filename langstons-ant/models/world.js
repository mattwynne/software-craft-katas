function World(size) {
  this.size = size;
  this.rows = new Array(size);
  for (var i = 0; i < this.rows.length; i++) {
    this.rows[i] = new Array(size);
  };
}

World.prototype.isBlack = function(x, y) {
  return this.rows[x][y] == true;
}

World.prototype.paintBlack = function(x, y) {
  this.rows[x][y] = true;
}

World.prototype.paintWhite = function(x, y) {
  this.rows[x][y] = false;
}


// TODO:
// paintWhite(x,y)
// paintAllBlack