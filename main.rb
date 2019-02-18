# coding: utf-8
require "./character"
require "./menu"

# 宣言と初期化
@carray = Array.new()
@cid = 0

print("===== Hello Ruby =====")

load_data()

while (1)
  print("\n")
  show_nowchar()
  
  if select()
    break
  end
end

