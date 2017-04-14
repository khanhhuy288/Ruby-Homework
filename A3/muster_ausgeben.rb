def kreuz(n, chars)
  # check if n is valid
  if n % 2 == 0 || n < 0
    puts "#{n} muss ungerade und positiv sein"
  else
    # print pattern
    spaces_num = (n - 1) / 2
    vertical  =  ' ' * spaces_num * chars.length + chars + ' ' * spaces_num * chars.length
    horizontal = chars * n
    # print upper lines vertical
    spaces_num.times { puts vertical }
    # print horizontal line
    puts horizontal
    # print lower lines vertical
    spaces_num.times { puts vertical }
  end
end

def dreieck1(n, chars)
  # check if n is valid
  if n % 2 == 0 || n < 0
    puts "#{n} muss ungerade und positiv sein"
  else
    # print pattern
    1.upto(n) { |i| puts chars * i }
  end
end

def dreieck2(n, chars)
  # check if n is valid
  if n % 2 == 0 || n < 0
    puts "#{n} muss ungerade und positiv sein"
  else
    # print pattern
    n.downto(1) { |i|
      # print spaces
      print ' ' * (n - i) * chars.length
      # print chars
      puts chars * i
    }
  end
end

def dreieck3(n, chars)
  # check if n is valid
  if n % 2 == 0 || n < 0
    puts "#{n} muss ungerade und positiv sein"
  else
    # print pattern
    spaces_num = (n - 1) / 2
    puts ' ' * spaces_num * chars.length + chars + ' ' * spaces_num * chars.length      # first line

    (spaces_num - 1).downto(1) { |i|
      print ' ' * i * chars.length                    # left spaces
      print chars                                     # left side
      print ' ' * (n - (i + 1)*2) * chars.length      # inside
      print chars                                     # right side
      print ' ' * i * chars.length                    # right spaces
      puts                                            # newline
    }

    puts chars * n          # last line
  end
end


