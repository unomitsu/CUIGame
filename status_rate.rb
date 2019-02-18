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

  # set
  def set_rand()
    rdm = Random.new()
    @hp = rdm.rand(0.2..10.0)
    @mp = rdm.rand(0.2..10.0)
    @sp = rdm.rand(0.2..10.0)
    @str = rdm.rand(0.2..5.0)
    @vit = rdm.rand(0.2..5.0)
    @int = rdm.rand(0.2..5.0)
    @mnd = rdm.rand(0.2..5.0)
    @dex = rdm.rand(0.2..5.0)
    @agi = rdm.rand(0.2..5.0)
    @luk = rdm.rand(0.2..5.0)
  end

  def set_self()
    print("HPrate?  ->")
    @hp = $stdin.gets.to_i()
    print("MPrate?  ->")
    @mp = $stdin.gets.to_i()
    print("SPrate?  ->")
    @sp = $stdin.gets.to_i()
    print("STRrate? ->")
    @str = $stdin.gets.to_i()
    print("VITrate? ->")
    @vit = $stdin.gets.to_i()
    print("INTrate? ->")
    @int = $stdin.gets.to_i()
    print("MNDrate? ->")
    @mnd = $stdin.gets.to_i()
    print("DEXrate? ->")
    @dex = $stdin.gets.to_i()
    print("AGIrate? ->")
    @agi = $stdin.gets.to_i()
    print("LUKrate? ->")
    @luk = $stdin.gets.to_i()
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

  
  # add
  def add_hp(x=0.0)
    if x > 0.0
      @hp += x
    end
  end

  def add_mp(x=0.0)
    if x > 0.0
      @mp += x
    end
  end

  def add_sp(x=0.0)
    if x > 0.0
      @sp += x
    end
  end

  def add_str(x=0.0)
    if x > 0.0
      @str += x
    end
  end

  def add_vit(x=0.0)
    if x > 0.0
      @vit += x
    end
  end
  
  def add_int(x=0.0)
    if x > 0.0
      @int += x
    end
  end

  def add_mnd(x=0.0)
    if x > 0.0
      @mnd += x
    end
  end

  def add_dex(x=0.0)
    if x > 0.0
      @dex += x
    end
  end
  
  def add_agi(x=0.0)
    if x > 0.0
      @agi += x
    end
  end

  def add_luk(x=0.0)
    if x > 0.0
      @luk += x
    end
  end

  # push
  def push_hp(x=5.0)
    if x < 0.0
      x = 5.0
    end
    @hp = x
  end
  
  def push_mp(x=5.0)
    if x < 0.0
      x = 5.0
    end
    @mp = x
  end

  def push_sp(x=5.0)
    if x < 0.0
      x = 5.0
    end
    @sp = x
  end
  
  def push_str(x=2.0)
    if x < 0.0
      x = 2.0
    end
    @str = x
  end

  def push_vit(x=2.0)
    if x < 0.0
      x = 2.0
    end
    @vit = x
  end
  
  def push_int(x=2.0)
    if x < 0.0
      x = 2.0
    end
    @int = x
  end

  def push_mnd(x=2.0)
    if x < 0.0
      x = 2.0
    end
    @mnd = x
  end

  def push_dex(x=2.0)
    if x < 0.0
      x = 2.0
    end
    @dex = x
  end
  
  def push_agi(x=2.0)
    if x < 0.0
      x = 2.0
    end
    @agi = x
  end

  def push_luk(x=2.0)
    if x < 0.0
      x = 2.0
    end
    @luk = x
  end

  # dataをstring型で返す
  def get_data_s()
    text = @hp.to_s + "," + @mp.to_s + "," + @sp.to_s + ","
    text << @str.to_s + "," + @vit.to_s + "," + @int.to_s + ","
    text << @mnd.to_s + "," + @dex.to_s + ","
    text << @agi.to_s + "," + @luk.to_s
    return text
  end
end
