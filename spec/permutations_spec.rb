require File.join(File.dirname(__FILE__), %w[spec_helper])
require 'permutations'

describe Permutations do
  describe 'Array' do
    it 'should generate permutations for nested arrays' do
      [[1,2],[3,4]].permutations.should == [[1,3],[1,4],[2,3],[2,4]]
    end
  end

  describe 'String' do
    it 'should default to generate permutations for comma-separated and {}-wrapped options' do
      "{1,2}{3,4}".permutations.should == %w[13 14 23 24]
    end

    it 'should accept a custom separator' do
      "{1|2}{3|4}".permutations("|").should == %w[13 14 23 24]
    end

    it 'should accept a custom regexp separator' do
      "{1|2}{3,4}".permutations("[|,]", false).should == %w[13 14 23 24]
    end

    it 'should ignore white space wrapping' do
      "{ 1, 2 }{ 3 , 4}".permutations.should == %w[13 14 23 24]
    end
  end
end
