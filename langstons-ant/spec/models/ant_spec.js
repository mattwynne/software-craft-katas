// Rules:
// White square: paint it black, turn left
// Black square: paint it white, turn right

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
        expect(ant.location()).to(equal, [5, 4]) 
      });
      
      it("should have painted the square it was on black", function() {
        expect(world.isBlack(5, 5)).to(be_true)
      })
      
      describe("then a second step", function() {
        before(function() {
          ant.step()
        });
        
        it("should move right one square", function() {
          expect(ant.location()).to(equal, [6, 4]);
        });
        
        it("should have painted the square it was on black", function() {
          expect(world.isBlack(5, 4)).to(be_true)
        });
        
        describe("then a third step", function() {
          before(function() {
            ant.step()
          });

          it("should move up one square", function() {
            expect(ant.location()).to(equal, [6, 5]);
          });

          it("should have painted the square it was on black", function() {
            expect(world.isBlack(6, 4)).to(be_true)
          });
          
          describe("then a fourth step", function() {
            before(function() {
              ant.step()
            });

            it("should move back to square one", function() {
              expect(ant.location()).to(equal, [5, 5]);
            });

            it("should have painted the square it was on black", function() {
              expect(world.isBlack(6, 5)).to(be_true)
            });
            
            describe("then a fifth step", function() {
              before(function() {
                ant.step()
              });

              it("should move up one", function() {
                expect(ant.location()).to(equal, [5, 6]);
              });

              it("should have painted the square it was on white", function() {
                expect(world.isBlack(5, 5)).to(be_false)
              });
              
            });
            
          });
          
          
        });
        
      });
      
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
