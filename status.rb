# coding: utf-8
class Status
  attr_reader :hp, :mp, :sp,
              :str, :vit, :int, :mnd, :dex, :agi, :luk

  public

  def initialize()
    @hp, @mp, @sp =  10.0, 10.0, 10.0
    @str, @vit = 2.0, 2.0
    @int, @mnd = 2.0, 2.0
    @dex, @agi, @luk = 2.0, 2.0, 2.0
  end

  ## ========== ========== ========== ========== ==========
  ##   ステータスを表示
  ## ========== ========== ========== ========== ==========
  def show()
    print("HP  : #{@hp.to_i}\n")
    print("MP  : #{@mp.to_i}\n")
    print("SP  : #{@sp.to_i}\n")
    print("STR : #{@str.to_i}\n")
    print("VIT : #{@vit.to_i}\n")
    print("INT : #{@int.to_i}\n")
    print("MND : #{@mnd.to_i}\n")
    print("DEX : #{@dex.to_i}\n")
    print("AGI : #{@agi.to_i}\n")
    print("LUK : #{@luk.to_i}\n")
  end
  
  ## ========== ========== ========== ========== ==========
  ##   新規作成 set
  ## ========== ========== ========== ========== ==========
  def set_rand()
    rdm = Random.new()
    push_hp(rdm.rand(5.0..30.0))
    push_mp(rdm.rand(5.0..30.0))
    push_sp(rdm.rand(5.0..30.0))
    push_str(rdm.rand(1.0..5.0))
    push_vit(rdm.rand(1.0..5.0))
    push_int(rdm.rand(1.0..5.0))
    push_mnd(rdm.rand(1.0..5.0))
    push_dex(rdm.rand(1.0..5.0))
    push_agi(rdm.rand(1.0..5.0))
    push_luk(rdm.rand(1.0..5.0))
  end

  def set_self()
    print("HP?      ->")
    push_hp($stdin.gets.to_f())
    print("MP?      ->")
    push_mp($stdin.gets.to_f())
    print("SP?      ->")
    push_sp($stdin.gets.to_f())
    print("STR?     ->")
    push_str($stdin.gets.to_f())
    print("VIT?     ->")
    push_vit($stdin.gets.to_f())
    print("INT?     ->")
    push_int($stdin.gets.to_f())
    print("MND?     ->")
    push_mnd($stdin.gets.to_f())
    print("DEX?     ->")
    push_dex($stdin.gets.to_f())
    print("AGI?     ->")
    push_agi($stdin.gets.to_f())
    print("LUK?     ->")
    push_luk($stdin.gets.to_f())
  end
  
  def set_load(status=[100, 100, 100, 5, 5, 5, 5, 5, 5, 5])
    push_hp(status[0])
    push_mp(status[1])
    push_sp(status[2])
    push_str(status[3])
    push_vit(status[4])
    push_int(status[5])
    push_mnd(status[6])
    push_dex(status[7])
    push_agi(status[8])
    push_luk(status[9])
  end
  
  ## ========== ========== ========== ========== ==========
  ##   add
  ## ========== ========== ========== ========== ==========
  def add_hp(x=0.0)
    @hp += x if x > 0
  end

  def add_mp(x=0.0)
    @mp += x if x > 0
  end

  def add_sp(x=0.0)
    @sp += x if x > 0
  end

  def add_str(x=0.0)
    @str += x if x > 0
  end

  def add_vit(x=0.0)
    @vit += x if x > 0
  end
  
  def add_int(x=0.0)
    @int += x if x > 0
  end

  def add_mnd(x=0.0)
    @mnd += x if x > 0
  end

  def add_dex(x=0.0)
    @dex += x if x > 0
  end
  
  def add_agi(x=0.0)
    @agi += x if x > 0
  end

  def add_luk(x=0.0)
    @luk += x if x > 0
  end

  ## ========== ========== ========== ========== ==========
  ##   push
  ## ========== ========== ========== ========== ==========
  def push_hp(x=20.0)
    x > 0.0 ? @hp = x : @hp = 20.0
  end
  
  def push_mp(x=20.0)
    x > 0.0 ? @mp = x : @mp = 20.0
  end

  def push_sp(x=20.0)
    x > 0.0 ? @sp = x : @sp = 20.0
  end
  
  def push_str(x=5.0)
    x > 0.0 ? @str = x : @str = 5.0
  end

  def push_vit(x=5.0)
    x > 0.0 ? @vit = x : @vit = 5.0
  end
  
  def push_int(x=5.0)
    x > 0.0 ? @int = x : @int = 5.0
  end

  def push_mnd(x=5.0)
    x > 0.0 ? @mnd = x : @mnd = 5.0
  end

  def push_dex(x=5.0)
    x > 0.0 ? @dex = x : @dex = 5.0
  end
  
  def push_agi(x=5.0)
    x > 0.0 ? @agi = x : @agi = 5.0
  end

  def push_luk(x=5.0)
    x > 0.0 ? @luk = x : @luk = 5.0
  end

  ## ========== ========== ========== ========== ==========
  ##   データを string型 で返す
  ## ========== ========== ========== ========== ==========
  def get_data_s()
    text = @hp.to_s + "," + @mp.to_s + "," + @sp.to_s + ","
    text << @str.to_s + "," + @vit.to_s + "," + @int.to_s + ","
    text << @mnd.to_s + "," + @dex.to_s + ","
    text << @agi.to_s + "," + @luk.to_s
    return text
  end
  
end
