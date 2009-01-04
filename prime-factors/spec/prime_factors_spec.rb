require File.dirname(__FILE__) + '/../lib/prime_factors.rb'
require 'rubygems'
require 'spec'

describe PrimeFactors, "#generate" do
  
  include PrimeFactors::Generator
  
  examples = {
    1 => [],
    2 => [2],
    3 => [3],
    4 => [2, 2],
    6 => [2, 3],
    8 => [2, 2, 2],
    9 => [3, 3],
  }
  
  examples.each do |number, expected_result|
    
    it "given #{number}, it should return #{expected_result.inspect}" do
      generate(number).should == expected_result
    end
    
  end

end