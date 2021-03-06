require 'Set'

# Änderungen an der Klasse Set für eine bessere Darstellung
# und korrektem Inhaltsvergleich für Mengen von Mengen

class Set
  # get the Potenzmenge of Set
  def p_menge
    p_menge = Set.new
    Potenzmenge.new(self).each { |element| p_menge.add(element) }
    p_menge
  end

  def ==(other)
    # return false if compared with a nil object
    return false if other.nil?

    # return true if compared to the object itself
    return true if self.equal?(other)

    # return false if other's not Set
    return false if self.class != other.class

    # return true if every element from self is an element from other and vice versa
    self.all? { |e| other.include?(e) } && other.all? { |e| self.include?(e) }
  end

  # anolog to ==
  def eql?(other)
    # use the overwriten method ==(other)
    self == other
  end

  # set a hash
  def hash
    prime = 31
    self.inject(1){|acc,x|
      prime*acc + x.hash
    }
  end

  def to_s
    # return empty Set when Set's size equal 0
    return 'Set{}' if size == 0

    # map elements from Set to an array
    set = "Set{#{self.map{|x| x }}}"

    # delete square brackets 
    set.delete('[]')
  end
end


class Potenzmenge
  
  include Enumerable
  
  def initialize(a_set)
    @potenz = Set.new(a_set.inject(Set.new.add(Set.new)){|acc,s|
      r = Set.new
      acc.each{|set| r.add(set);  r.add(set.clone.add(s)) }
      r
    })
  end

  def each(&b)
    @potenz.each(&b)
  end

  def to_s
    'Potenzmenge' + "#{@potenz}".delete('#<Set: >')
  end

  def inspect
    @potenz.inspect
  end
  
  def size
    @potenz.size
  end
end















