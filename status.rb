class Status
  attr_reader :hp, :mp, :sp,
              :str, :vit, :int, :mnd, :dex, :agi, :luk
  
  public

  def initialize()
    @hp, @mp, @sp =  10, 10, 10
    @str, @vit = 2, 2
    @int, @mnd = 2, 2
    @dex, @agi, @luk = 2, 2, 2
  end
  
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

  def set_rand()
    rdm = Random.new()
    @hp = rdm.rand(5..30)
    @mp = rdm.rand(5..30)
    @sp = rdm.rand(5..30)
    @str = rdm.rand(1..5)
    @vit = rdm.rand(1..5)
    @int = rdm.rand(1..5)
    @mnd = rdm.rand(1..5)
    @dex = rdm.rand(1..5)
    @agi = rdm.rand(1..5)
    @luk = rdm.rand(1..5)
  end

  def set_self()
    print("HP?      ->")
    @hp = $stdin.gets.to_i()
    print("MP?      ->")
    @mp = $stdin.gets.to_i()
    print("SP?      ->")
    @sp = $stdin.gets.to_i()
    print("STR?     ->")
    @str = $stdin.gets.to_i()
    print("VIT?     ->")
    @vit = $stdin.gets.to_i()
    print("INT?     ->")
    @int = $stdin.gets.to_i()
    print("MND?     ->")
    @mnd = $stdin.gets.to_i()
    print("DEX?     ->")
    @dex = $stdin.gets.to_i()
    print("AGI?     ->")
    @agi = $stdin.gets.to_i()
    print("LUK?     ->")
    @luk = $stdin.gets.to_i()
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
  
  # add
  def add_hp(x=0)
    if x > 0
      @hp += x
    end
  end

  def add_mp(x=0)
    if x > 0
      @mp += x
    end
  end

  def add_sp(x=0)
    if x > 0
      @sp += x
    end
  end

  def add_str(x=0)
    if x > 0
      @str += x
    end
  end

  def add_vit(x=0)
    if x > 0
      @vit += x
    end
  end
  
  def add_int(x=0)
    if x > 0
      @int += x
    end
  end

  def add_mnd(x=0)
    if x > 0
      @mnd += x
    end
  end

  def add_dex(x=0)
    if x > 0
      @dex += x
    end
  end
  
  def add_agi(x=0)
    if x > 0
      @agi += x
    end
  end

  def add_luk(x=0)
    if x > 0
      @luk += x
    end
  end

  # push
  def push_hp(x=100)
    if x < 0
      x = 100
    end
    @hp = x
  end
  
  def push_mp(x=100)
    if x < 0
      x = 100
    end
    @mp = x
  end

  def push_sp(x=100)
    if x < 0
      x = 100
    end
    @sp = x
  end
  
  def push_str(x=5)
    if x < 0
      x = 5
    end
    @str = x
  end

  def push_vit(x=5)
    if x < 0
      x = 5
    end
    @vit = x
  end
  
  def push_int(x=5)
    if x < 0
      x = 5
    end
    @int = x
  end

  def push_mnd(x=5)
    if x < 0
      x = 5
    end
    @mnd = x
  end

  def push_dex(x=5)
    if x < 0
      x = 5
    end
    @dex = x
  end
  
  def push_agi(x=5)
    if x < 0
      x = 5
    end
    @agi = x
  end

  def push_luk(x=5)
    if x < 0
      x = 5
    end
    @luk = x
  end

  def get_data_s()
    text = @hp.to_s + "," + @mp.to_s + "," + @sp.to_s + ","
    text << @str.to_s + "," + @vit.to_s + "," + @int.to_s + ","
    text << @mnd.to_s + "," + @dex.to_s + ","
    text << @agi.to_s + "," + @luk.to_s
    return text
  end
end
