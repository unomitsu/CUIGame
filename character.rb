# coding: utf-8
require "./status"
require "./status_rate"
require "./status_exp"

class Character
  public

  def initialize(name="noname", id=1)
    @name = name
    @orig = Status.new()
    @rate = StatusRate.new()
    @exp = StatusExp.new()
    
    case id
    when 2
      make_rand()
    when 3
      make_self()
    end
    init_exp()
  end
  
  ## ========== ========== ========== ========== ==========
  ##   show
  ## ========== ========== ========== ========== ==========
  def show()
    print("NAME  : #{@name}\n")
    @exp.show()
    @orig.show()
  end
  
  def show_name()
    print("NAME  : #{@name}\n")
  end

  ## ========== ========== ========== ========== ==========
  ##   make
  ## ========== ========== ========== ========== ==========
  def make_rand()
    @orig.set_rand()
    @rate.set_rand()
    @exp.set_rand()
  end

  def make_self()
    @orig.set_self()
    @rate.set_self()
    @exp.set_self()
  end
  
  def make_load(name="noname",
                status=[100, 100, 100, 5, 5, 5, 5, 5, 5, 5],
                rate=[10.0, 10.0, 10.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0],
                exp=[1, 100, 1.5]
               )
    @name = name
    @orig.set_load(status)
    @rate.set_load(rate)
    @exp.set_load(exp)
  end

  ## ========== ========== ========== ========== ==========
  ##   経験値関係
  ## ========== ========== ========== ========== ==========
  # ---------- ---------- ---------- ---------- ----------
  #   StatusExp class の関数を用いて, level up数を取得
  # ---------- ---------- ---------- ---------- ----------
  def init_exp()
    @exp.init_exp().times do |num|
      level_up()
    end
  end
  
  def add_exp(x=0)
    return if x <= 0

    # level up数を取得
    lvnum = @exp.add_exp(x)

    # level up数だけ, statusを加算
    lvnum.times do |num|
      level_up()
    end
  end
  # ---------- ---------- ---------- ---------- ----------
  #   status に rate 分だけ加算
  # ---------- ---------- ---------- ---------- ----------
  def level_up()
    @orig.add_hp(@rate.hp)
    @orig.add_mp(@rate.mp)
    @orig.add_sp(@rate.sp)
    @orig.add_str(@rate.str)
    @orig.add_vit(@rate.vit)
    @orig.add_int(@rate.int)
    @orig.add_mnd(@rate.mnd)
    @orig.add_dex(@rate.dex)
    @orig.add_agi(@rate.agi)
    @orig.add_luk(@rate.luk)
  end

  ## ========== ========== ========== ========== ==========
  ##   data を string型で返す
  ## ========== ========== ========== ========== ==========
  def get_data_s()
    text = @name + ","+ @orig.get_data_s() + ","
    text << @rate.get_data_s + "," + @exp.get_data_s()
  end
end
