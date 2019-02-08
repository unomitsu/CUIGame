# coding: utf-8
require "./character"

def select()
  print("1:make 2:show 3:quest 4:exit\n")
  while val = $stdin.gets.to_i()
    if 0 < val && val <= 4
      return val
    else
      print("out of range.\n")
    end
    print("#{val}\n")
  end
end

def show_nowchar()
  puts "----- ----- -----"
  if (@carray[@cid] != nil)
    @carray[@cid].show()
  else
    puts "none character\n"
  end
  puts "----- ----- -----"
end

def make_char()
  print("make mode?\n")
  print("1:tmp, 2:rand, 3:self\n")
  print("-> ")
  mode = $stdin.gets.to_i()
  print("Character name ?\n")
  print("-> ")
  
  @carray.push(Character.new($stdin.gets.chomp(), mode))
  @cid = @carray[@cid].get_num() - 1
end

def show_char()
  while ( 1 )
    print("which character? (exit=-1)\n")
    print("-> ")
    id = $stdin.gets.to_i()

    if (id < 0)
      break;
    end
    if (!(@carray[id] == nil))
      @carray[id].show()
      @cid = id
    end
  end
end

def work_char()
  print("work level? (exit=0)\n")
  print("-> ")

  while i = $stdin.gets.to_i()
    if i <= 0
      break;
    else
      @carray[@cid].add_exp(i*10)
    end

    print("-> ")
  end
end

def save_data()
  filename = "character_data.txt"

  File.open(filename, "w") do |f|
    @carray. each do |c|
      f.puts c.get_data_s()
    end
  end
end

