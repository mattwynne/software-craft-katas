function Ant(world) {
  with (this) {
    this.world = world;
    this.x = this.y = world.size / 2;
    this.NORTH = 0;
    this.EAST = 1;
    this.SOUTH = 2;
    this.WEST = 3;
    this.direction = SOUTH;
    
    this.directions = [
      function() {
        y = (y + 1) % world.size;
      },
      function() {
        x = (x + 1) % world.size;
      },
      function() {
        y = (y - 1) % world.size;
        if(y < 0) {
          y = world.size + y;
        }
      }, 
      function() {
        x = (x - 1) % world.size;
        if(x < 0) {
          x = world.size + x;
        }
      }
    ]
    
    this.black = function() {
      return {
        toggleColour: function() {
          world.paintWhite(x, y)
        },
        rotate: function() {
          direction += 1;
          if(direction > WEST) {
            direction = NORTH
          }  
        }
      }
    }();
        
    this.white = function() {
      return {
        toggleColour: function() {
          world.paintBlack(x, y)
        },
        rotate: function() {
          direction -= 1;
          if(direction < NORTH) {
            direction = WEST
          }
        }
      }
    }();
    
    this.currentColour = function() {
      if (world.isBlack(x,y)) {
        return black;
      }
      else {
        return white;
      }
    }
    
  }
}

Ant.prototype.location = function() {
  with (this) return [x, y];
}

Ant.prototype.step = function() {
  with(this) {
    currentColour().toggleColour();
    moveForward();
    currentColour().rotate();
  }
}

Ant.prototype.moveForward = function() {
  this.directions[this.direction]();
}
