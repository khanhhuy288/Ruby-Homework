require './Relation'

class RelationenGenerator
  def RelationenGenerator.generiere_relation(set_a,set_b,k)
    # create new Relations from 2 Sets
    relation = Relation.new(set_a, set_b)

    # return empty Relation if k is not valid (k > max_tupels)
    max_tupels = set_a.size * set_b.size
    raise 'k muss <= maximale Anzahl der Tupels sein.' if k > max_tupels

    # add k Tupels to Relation
    while relation.size < k
      # get 1 random element from each Set to make a Tupel
      rand_a = rand(set_a.size)
      rand_b = rand(set_b.size)
      relation.add(Tupel.new(set_a.to_a[rand_a], set_b.to_a[rand_b]))
    end

    return relation
  end

  def RelationenGenerator.generiere_abbildung(set_a,set_b)
    # create new function from 2 Sets
    relation = Relation.new(set_a, set_b)

    # Abbildung: von jedem a muss genau ein Pfeil ausgehen, also linksvollständig und rechtseindeutig
    rand_b = rand(set_b.size)
    set_a.each { |a|
      relation.add(Tupel.new(a, set_b.to_a[rand_b]))
    }

    return relation
  end

end


set_a = Set.new([1, 2, 3])
set_b = Set.new([1, 3, 4])
set_c = Set.new([1, 5, 6, 7])
set_d = Set.new([1])
set_e = Set.new([4])

my_relation = Relation.new(set_a, set_a)
andere_relation = Relation.new(set_b, set_c)


my_relation.add(Tupel.new(1,2))
my_relation.add(Tupel.new(2,3))
my_relation.add(Tupel.new(3,3))

puts my_relation

puts my_relation.symmetrischer_abschluss





