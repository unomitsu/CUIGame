# coding: utf-8
class StatusRate
  attr_reader :hp, :mp, :sp,
              :str, :vit, :int, :mnd, :dex, :agi, :luk
  
  public

  def initialize()
    @hp, @mp, @sp =  5.0, 5.0, 5.0
    @str, @vit = 2.0, 2.0
    @int, @mnd = 2.0, 2.0
    @dex, @agi, @luk = 2.0, 2.0, 2.0
  end

  ## ========== ========== ========== ========== ==========
  ##   set
  ## ========== ========== ========== ========== ==========
  def set_rand()
    rdm = Random.new()
    push_hp(rdm.rand(0.2..10.0))
    push_mp(rdm.rand(0.2..10.0))
    push_sp(rdm.rand(0.2..10.0))
    push_str(rdm.rand(0.2..5.0))
    push_vit(rdm.rand(0.2..5.0))
    push_int(rdm.rand(0.2..5.0))
    push_mnd(rdm.rand(0.2..5.0))
    push_dex(rdm.rand(0.2..5.0))
    push_agi(rdm.rand(0.2..5.0))
    push_luk(rdm.rand(0.2..5.0))
  end

  def set_self()
    print("HPrate?  ->")
    push_hp($stdin.gets.to_f())
    print("MPrate?  ->")
    push_mp($stdin.gets.to_f())
    print("SPrate?  ->")
    push_sp($stdin.gets.to_f())
    print("STRrate? ->")
    push_str($stdin.gets.to_f())
    print("VITrate? ->")
    push_vit($stdin.gets.to_f())
    print("INTrate? ->")
    push_int($stdin.gets.to_f())
    print("MNDrate? ->")
    push_mnd($stdin.gets.to_f())
    print("DEXrate? ->")
    push_dex($stdin.gets.to_f())
    print("AGIrate? ->")
    push_agi($stdin.gets.to_f())
    print("LUKrate? ->")
    push_luk($stdin.gets.to_f())
  end
  
  def set_load(rate=[10.0, 10.0, 10.0,
                     1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0])
    push_hp(rate[0])
    push_mp(rate[1])
    push_sp(rate[2])
    push_str(rate[3])
    push_vit(rate[4])
    push_int(rate[5])
    push_mnd(rate[6])
    push_dex(rate[7])
    push_agi(rate[8])
    push_luk(rate[9])
  end

  ## ========== ========== ========== ========== ==========
  ##   add
  ## ========== ========== ========== ========== ==========
  def add_hp(x=0.0)
    @hp += x if x > 0.0
  end

  def add_mp(x=0.0)
    @mp += x if x > 0.0
  end

  def add_sp(x=0.0)
    @sp += x if x > 0.0
  end

  def add_str(x=0.0)
    @str += x if x > 0.0
  end

  def add_vit(x=0.0)
    @vit += x if x > 0.0
  end
  
  def add_int(x=0.0)
    @int += x if x > 0.0
  end

  def add_mnd(x=0.0)
    @mnd += x if x > 0.0
  end

  def add_dex(x=0.0)
    @dex += x if x > 0.0
  end
  
  def add_agi(x=0.0)
    @agi += x if x > 0.0
  end

  def add_luk(x=0.0)
    @luk += x if x > 0.0
  end

  ## ========== ========== ========== ========== ==========
  ##   push
  ## ========== ========== ========== ========== ==========
  def push_hp(x=5.0)
    x > 0.0 ? @hp = x : @hp = 5.0
  end
  
  def push_mp(x=5.0)
    x > 0.0 ? @mp = x : @mp = 5.0
  end

  def push_sp(x=5.0)
    x > 0.0 ? @sp = x : @sp = 5.0
  end
  
  def push_str(x=2.0)
    x > 0.0 ? @str = x : @str = 2.0
  end

  def push_vit(x=2.0)
    x > 0.0 ? @vit = x : @vit = 2.0
  end
  
  def push_int(x=2.0)
    x > 0.0 ? @int = x : @int = 2.0
  end

  def push_mnd(x=2.0)
    x > 0.0 ? @mnd = x : @mnd = 2.0
  end

  def push_dex(x=2.0)
    x > 0.0 ? @dex = x : @dex = 2.0
  end
  
  def push_agi(x=2.0)
    x > 0.0 ? @agi = x : @agi = 2.0
  end

  def push_luk(x=2.0)
    x > 0.0 ? @luk = x : @luk = 2.0
  end

  ## ========== ========== ========== ========== ==========
  ##   dataをstring型で返す
  ## ========== ========== ========== ========== ==========
  def get_data_s()
    text = @hp.to_s + "," + @mp.to_s + "," + @sp.to_s + ","
    text << @str.to_s + "," + @vit.to_s + "," + @int.to_s + ","
    text << @mnd.to_s + "," + @dex.to_s + ","
    text << @agi.to_s + "," + @luk.to_s
    return text
  end
end
