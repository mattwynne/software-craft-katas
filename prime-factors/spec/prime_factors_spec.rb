require File.dirname(__FILE__) + '/../lib/prime_factors.rb'
require 'rubygems'
require 'spec'

describe PrimeFactors, "#generate" do

  it "should return an empty array for 1" do
    PrimeFactors.generate(1).should == []
  end

  it "should return [2] for 2" do
    PrimeFactors.generate(2).should == [2]
  end

  it "should return [3] for 3" do
    PrimeFactors.generate(3).should == [3]
  end

  it "should return [2,2] for 4" do
    PrimeFactors.generate(4).should == [2,2]
  end

  it "should return [2,3] for 6" do
    PrimeFactors.generate(6).should == [2,3]
  end

  it "should return [2,2,2] for 8" do
    PrimeFactors.generate(8).should == [2,2,2]
  end

  it "should return [3,3] for 9" do
    PrimeFactors.generate(9).should == [3,3]
  end

end