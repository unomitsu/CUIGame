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
  
end
