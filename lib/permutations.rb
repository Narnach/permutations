module Permutations
  module Array
    # @param [Array] leftovers remaining elements to recursively permutate through.
    # @return [Array] Nested array with all permutations
    # @example
    #   [[1,2],[3,4]].permutations   #=> [[1,3],[1,4],[2,3],[2,4]]
    def permutations(leftovers=self)
      tail = leftovers.last
      return tail.map{|e| [e]} if leftovers.size == 1
      resulting_permutations = []
      permutations(leftovers[0...-1]).each do |permutation|
        tail.each do |tail_element|
          resulting_permutations << (permutation + [tail_element])
        end
      end
      resulting_permutations
    end
  end

  module String
    # @param [String] separator Pattern to split the string on
    # @param [TrueClass, FalseClass] escape_separator Wether to Regexp-escape the separator and treat it as a literal separator (true) or treat it as a regexp (false)
    # @return [Array] Nested array with all permutations
    # @example
    #   "{a,b,c}{1,2,3}".permutations   #=> ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    def permutations(separator=',', escape_separator=true)
      separator=Regexp.escape(separator) if escape_separator
      matches = self.scan(/(\{\s*(.*?)\s*\})/)
      return [self] if matches.empty?
      substitutions = matches.map{|match| match[0]}
      permutations = matches.map{|match| match[1].split(/\s*#{separator}\s*/)}.permutations
      permutations.map do |permutation|
        permutated_string = self.dup
        permutation.each_with_index do |choice, index|
          choice_string = substitutions[index]
          permutated_string.sub!(choice_string,choice)
        end
        permutated_string
      end
    end
  end
end
class Array
  include Permutations::Array
end

class String
  include Permutations::String
end