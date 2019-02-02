class StatusBase
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
  def push_hp(x=0)
    if x < 0
      x = 100
    end
    @hp = x
  end
  
  def push_mp(x=0)
    if x < 0
      x = 100
    end
    @mp = x
  end

  def push_sp(x=0)
    if x < 0
      x = 100
    end
    @sp = x
  end
  
  def push_str(x=0)
    if x < 0
      x = 1
    end
    @str = x
  end

  def push_vit(x=0)
    if x < 0
      x = 1
    end
    @vit = x
  end
  
  def push_int(x=0)
    if x < 0
      x = 1
    end
    @int = x
  end

  def push_mnd(x=1)
    if x < 0
      x = 1
    end
    @mnd = x
  end

  def push_dex(x=1)
    if x < 0
      x = 1
    end
    @dex = x
  end
  
  def push_agi(x=0)
    if x < 0
      x = 1
    end
    @agi = x
  end

  def push_luk(x=1)
    if x < 0
      x = 1
    end
    @luk = x
  end
  
end
