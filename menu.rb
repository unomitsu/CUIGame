# coding: utf-8
require "./character"

# メニュー画面 何をするかを選ぶ
def select()
  print("1:make 2:show 3:quest 4:exit => ")
  while val = $stdin.gets.to_i()
    if 0 < val && val <= 4
      return val
    else
      print("out of range.\n")
    end
  end
end

# 現在選択中のキャラクターのステータスを表示する
# もしキャラクターが一人もいなければ "none character" と表示
def show_nowchar()
  if (@carray[@cid] != nil)
    @carray[@cid].show()
  else
    puts "none character\n"
  end
end

# キャラクターを作成する画面
def make_char()
  # make mode を入力, 1~3を入力するまで繰り返す
  print("1:tmp 2:rand 3:self (exit=0)\n")
  while (1)
    print("Make Mode ? => ")
    mode = $stdin.gets.to_i()
    if mode == 0
      return
    elsif 1 <= mode && mode <= 3
      break;
    else
      print("out of range! ")
    end
  end
  print("Character Name ? => ")
  name = $stdin.gets.chomp()
  
  @carray.push(Character.new(name, mode))
  @cid = @carray[@cid].get_num() - 1
end

# キャラクター検索画面
# 最後に検索したキャラクターを選択する(現在)
def show_char()
  while ( 1 )
    print("which character? (exit<=-1) -> ")
    id = $stdin.gets.to_i()

    if (id < 0)
      break;
    elsif (!(@carray[id] == nil))
      @carray[id].show()
      @cid = id
    else
      print("none character! ")
    end
  end
end

# 指定した数値の１０倍の経験値を得る
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

# キャラクターデータを保存する
def save_data()
  filename = "character_data.txt"

  File.open(filename, "w") do |f|
    @carray.each do |c|
      f.puts c.get_data_s()
    end
  end
end

# キャラクターデータを読み込む
def load_data()
  num = 0
  File.open("character_data.txt", "r") do |f|
    # 1行ずつ "," で区切り, Characterを新規作成
    f.each_line do |line|
      param = line.split(",")
      name = param[0]
      status = param.slice(1..10).map(&:to_i)
      rate = param.slice(11..20).map(&:to_i)
      exp = param.slice(21..23).map(&:to_i)
      
      @carray.push(Character.new("", 1))
      @carray[num].make_load(name, status, rate, exp)
      num += 1
    end
  end
end
