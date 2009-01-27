Screw.Unit(function() {
  
  describe("World", function() {
    describe("with 2x2 world", function () {
      before(function() {
        world = new World(2); 
      });
      
      describe("after painting a square black", function() {
        before(function() {
          world.paintBlack(0,0);
        });
        
        it("should be black", function() {
          expect(world.isBlack(0,0)).to(be_true);
        });
        
        it("another square should be white", function() {
          expect(world.isBlack(0,1)).to(be_false);
        });
        
      });  
      
    });
    
    describe("With one square", function() {
      before(function() {
        world = new World(1); 
      });

      it("should start off white", function() {
        expect(world.isBlack(0,0)).to(be_false);
      });
      
    });

  });
  
});