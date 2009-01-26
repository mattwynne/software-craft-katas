// Rules:
// White square: paint it black, go left
// Black square: paint it white, go right

Screw.Unit(function() {
  
  describe("Ant", function() {
    
    before(function() {
      world = new World(10); // world starts out white.
      ant = new Ant(world);
    })
    
    it("should start at the centre of the world", function() {
      expect(ant.location()).to(equal, [5, 5]) 
    });
    
    describe("when it takes one step", function() {
      before(function() {
        ant.step();
      });
      
      it("should move down one square", function() {
        expect(ant.location()).to(equal, [4, 5]) 
      });
      
      it("should have painted the square it was on black", function() {
        expect(world.isBlack(5, 5)).to(be_true) 
      })
      
    });
    
    // TODO:
    // two steps
    // 3 steps
    // 4 steps
    // 4 steps in a world painted black
    // It should warp vertically
    // It should warp horizontally
    // 
    
  });
  
});
