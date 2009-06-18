
function World(size, view) {
  this.size = size;
  this.rows = new Array(size);
  for (var i = 0; i < this.rows.length; i++) {
    this.rows[i] = new Array(size);
  };
  this.view = view;
}

World.prototype.isBlack = function(x, y) {
  return this.rows[x][y] == true;
}

World.prototype.paintBlack = function(x, y) {
  this.rows[x][y] = true;
  this.view.paintBlack(x,y);
}

World.prototype.paintWhite = function(x, y) {
  this.rows[x][y] = false;
  this.view.paintWhite(x,y);
}


// TODO:
// paintWhite(x,y)
// paintAllBlack