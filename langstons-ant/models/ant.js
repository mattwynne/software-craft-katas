function Ant(world) {
  this.world = world;
  this.x = this.y = world.size / 2;
}

Ant.prototype.location = function() {
  with (this) return [x, y];
}

Ant.prototype.step = function() {
  
}
