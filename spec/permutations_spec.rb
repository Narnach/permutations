require File.join(File.dirname(__FILE__), %w[spec_helper])
require 'permutations'

describe Permutations do
  describe 'Array' do
    it 'should generate permutations for nested arrays' do
      [[1,2],[3,4]].permutations.should == [[1,3],[1,4],[2,3],[2,4]]
    end
  end

  describe 'String' do
    it 'should generate permutations for {}-wrapped options' do
      "{1,2}{3,4}".permutations.should == %w[13 14 23 24]
    end
  end
end
