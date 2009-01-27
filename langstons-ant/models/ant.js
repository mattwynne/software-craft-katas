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
        y++;
      },
      function() {
        x++;
      },
      function() {
        y--;
      }, 
      function() {
        x--;
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
