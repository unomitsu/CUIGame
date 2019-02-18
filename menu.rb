# coding: utf-8
require "./character"

# ========== ========== ========== ========== ==========
#   メニュー画面 何をするかを選ぶ
# ========== ========== ========== ========== ==========
def select()
  print("1:make 2:show 3:quest 4:remove (exit=0) => ")
  
  case $stdin.gets.to_i()
  when 1
    make_char()
  when 2
    show_char()
  when 3
    work_char()
  when 4
    remove()
  else
    save_data()
    return true
  end
  
  return false
end

# ========== ========== ========== ========== ==========
#   現在選択中のキャラクターのステータスを表示する
#   もしキャラクターが一人もいなければ "none character" と表示
# ========== ========== ========== ========== ==========
def show_nowchar()
  print("---------- ----------\n")
  if (@carray[@cid] != nil)
    @carray[@cid].show()
  else
    puts "none character\n"
  end
  print("---------- ----------\n")
end

# ========== ========== ========== ========== ==========
#   キャラクターを作成する画面
#   作成したキャラクターを選択する
# ========== ========== ========== ========== ==========
def make_char()
  # make mode を選択, -1で作成中断
  print("1:tmp 2:rand 3:self (stop=-1)\n")
  mode = gets_within("Make Mode ?", 1, 3, -1)
  return if mode.nil?

  # nameを入力, 文字列なら何でも入力可能
  print("Character Name ? => ")
  name = $stdin.gets.chomp()

  # Character を作成, 作成したキャラクターを選択する
  @carray.push(Character.new(name, mode))
  @cid = @carray.length - 1
end

# ========== ========== ========== ========== ==========
#   キャラクター検索画面
#   最後に検索したキャラクターを選択する(現在)
# ========== ========== ========== ========== ==========
def show_char()
  # もしキャラクターが存在しなければ終了
  return if @carray.length == 0
  
  # stop(-1)を入力すると終了
  while 1 do
    # 現在存在するキャラクターの添値と名前を表示
    show_char_list()

    # キャラクターを選択する
    id = gets_within("which character? (exit<=-1)", 0, @carray.length-1, -1)
    break if id.nil?
    
    # 選択を更新し, キャラクターのステータスを表示
    @cid = id
    show_nowchar()
  end
end

# ========== ========== ========== ========== ==========
#   指定した数値の１０倍の経験値を得る
# ========== ========== ========== ========== ==========
def work_char()
  # もしキャラクターが存在しなければ終了
  return if @carray.length == 0
  
  # stop(0)を入力すると終了
  while 1 do
    # level を入力
    num = gets_within("Work Level? (stop=0)", 1, Float::INFINITY, 0)
    break if num.nil?

    # 経験値を加算
    @carray[@cid].add_exp(num*10)
  end
end

# ========== ========== ========== ========== ==========
#   指定したキャラクターのデータを削除する
# ========== ========== ========== ========== ==========
def remove()
  # もしキャラクターが存在しなければ終了
  return if @carray.length == 0
  
  # キャラクターの添値と名前を表示
  show_char_list()
  
  # 削除するキャラクターを選択
  id = gets_within("Which Remove ? (stop=-1) -> ", 0, @carray.length-1, -1)

  # 削除をやめる場合
  return if id.nil?
  
  # delete
  @carray.delete_at(id)
  print("Delete Complete.\n")

  # 処理後の調整
  @cid = 0 if @cid == id
  
end

# ========== ========== ========== ========== ==========
#   キャラクターの添値と名前を表示
# ========== ========== ========== ========== ==========
def show_char_list()
  num = 0
  @carray.each do |c|
    printf("%3d : ", num)
    c.show_name()
    num += 1
  end
end

# ========== ========== ========== ========== ==========
#   表示文字列と範囲を指定し,範囲内の数値が入力されるまで繰り返す
#   範囲外の場合は "Out of Range!" と出力する
# ========== ========== ========== ========== ==========
def gets_within(str="?", from=0, to=0, stop=0)
  while 1 do
    print("#{str} -> ")
    
    val = $stdin.gets.to_i()
    if from <= val && val <= to
      return val
    elsif val == stop
      return nil
    else
      print("out of range! ")
    end
  end
end

# ========== ========== ========== ========== ==========
#   キャラクターデータを保存する
# ========== ========== ========== ========== ==========
def save_data()
  File.open("character_data.txt", "w") do |f|
    @carray.each do |c|
      f.puts c.get_data_s()
    end
  end
end

# ========== ========== ========== ========== ==========
#   キャラクターデータを読み込む
# ========== ========== ========== ========== ==========
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

# ========== ========== ========== ========== ==========
# ========== ========== ========== ========== ==========
