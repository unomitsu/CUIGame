# coding: utf-8
require "./character"
require "./menu"

# 宣言と初期化
@carray = Array.new()
@cid = 0

print("===== Hello Ruby =====\n")

while (1)
  show_nowchar()

  case select()
  when 1
    make_char()
  when 2
    show_char()
  when 3
    work_char()
  when 4
    save_data()
    break;
  else
    break;
  end

end
