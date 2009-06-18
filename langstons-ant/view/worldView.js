function WorldView(size) {
  this.model = new World(size, this);
  this.ant = new Ant(this.model);
  this.parentDiv = $("#world");
}

WorldView.prototype = {
  // generate the original world div's
  initWorld : function() {
    for(var i = 0; i < this.model.size * this.model.size; i ++) {
      this.parentDiv.append("<div class='white'></div>")
    }
    this.parentDiv.css('width', this.model.size*10 + "px");
  },
  antStep : function(numberOfSteps) {
    for(var i = 0; i < numberOfSteps; i++) {
      this.ant.step();
    }
  },
  paintBlack : function(x, y) {
    var divLocationId = x + (y * this.model.size);
    $('#world div:eq(' + divLocationId + ')').addClass('black');
  },
  paintWhite : function(x,y) {
    divLocationId = x + (y * this.model.size);
    $('#world div:eq(' + divLocationId + ')').removeClass('black');
  }
}