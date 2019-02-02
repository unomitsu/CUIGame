# coding: utf-8
require "./statusbase"
require "./statusrate"

class Character
  @@num = 0
  
  public
  
  def initialize(name="noname", id=1)
    @@num += 1
    @name = name
    @level = 1
    @exp = { now: 0, all: 0, step: 100, rate: 1.5 }
    @orig = StatusBase.new()
    @show = StatusBase.new()
    @rate = StatusRate.new()
    
    case id
    when 2
      make_rand()
    when 3
      make_self()
    end
    @show = @orig
  end
  
  def show_status()
    print("---------- ----------\n")
    print("NAME  : #{@name}\n")
    print("LEVEL : #{@level}\n")
    print("EXP   : #{@exp[:now].to_i} (#{@exp[:all].to_i})\n")
    @orig.show()
    print("---------- ----------\n")
  end

  def make_rand()
    rdm = Random.new()
    
    @orig.push_hp(rdm.rand(5..30))
    @orig.push_mp(rdm.rand(5..30))
    @orig.push_sp(rdm.rand(5..30))
    @orig.push_str(rdm.rand(1..5))
    @orig.push_vit(rdm.rand(1..5))
    @orig.push_int(rdm.rand(1..5))
    @orig.push_mnd(rdm.rand(1..5))
    @orig.push_dex(rdm.rand(1..5))
    @orig.push_agi(rdm.rand(1..5))
    @orig.push_luk(rdm.rand(1..5))
    
    @rate.push_hp(rdm.rand(0.2..10.0))
    @rate.push_mp(rdm.rand(0.2..10.0))
    @rate.push_sp(rdm.rand(0.2..10.0))
    @rate.push_str(rdm.rand(0.2..5.0))
    @rate.push_vit(rdm.rand(0.2..5.0))
    @rate.push_int(rdm.rand(0.2..5.0))
    @rate.push_mnd(rdm.rand(0.2..5.0))
    @rate.push_dex(rdm.rand(0.2..5.0))
    @rate.push_agi(rdm.rand(0.2..5.0))
    @rate.push_luk(rdm.rand(0.2..5.0))

    @exp[:step] = rdm.rand(1..10) * 100
    @exp[:rate] = rdm.rand(1.2..2.0) 
  end

  def make_self()
    print("HP?      ->")
    @orig.push_hp($stdin.gets.to_i())
    print("MP?      ->")
    @orig.push_mp($stdin.gets.to_i())
    print("SP?      ->")
    @orig.push_sp($stdin.gets.to_i())
    print("STR?     ->")
    @orig.push_str($stdin.gets.to_i())
    print("VIT?     ->")
    @orig.push_vit($stdin.gets.to_i())
    print("INT?     ->")
    @orig.push_int($stdin.gets.to_i())
    print("MND?     ->")
    @orig.push_mnd($stdin.gets.to_i())
    print("DEX?     ->")
    @orig.push_dex($stdin.gets.to_i())
    print("AGI?     ->")
    @orig.push_agi($stdin.gets.to_i())
    print("LUK?     ->")
    @orig.push_luk($stdin.gets.to_i())
    print("HPrate?  ->")
    
    @rate.push_hp($stdin.gets.to_i())
    print("MPrate?  ->")
    @rate.push_mp($stdin.gets.to_i())
    print("SPrate?  ->")
    @rate.push_sp($stdin.gets.to_i())
    print("STRrate? ->")
    @rate.push_str($stdin.gets.to_i())
    print("VITrate? ->")
    @rate.push_vit($stdin.gets.to_i())
    print("INTrate? ->")
    @rate.push_int($stdin.gets.to_i())
    print("MNDrate? ->")
    @rate.push_mnd($stdin.gets.to_i())
    print("DEXrate? ->")
    @rate.push_dex($stdin.gets.to_i())
    print("AGIrate? ->")
    @rate.push_agi($stdin.gets.to_i())
    print("LUKrate? ->")
    @rate.push_luk($stdin.gets.to_i())
    
    print("EXPstep? ->")
    @exp[:step] = $stdin.gets.to_i()
    print("EXPrate? ->")
    @exp[:rate] = $stdin.gets.to_i()
  end

  def get_num()
    return @@num
  end

  def add_exp(x=0)
    if x > 0
      @exp[:now] += x
      @exp[:all] += x
      while @exp[:step] <= @exp[:now]
        level_up()
      end
    end
  end

  def level_up()
    @exp[:now] -= @exp[:step]
    @exp[:step] *= @exp[:rate]
    
    @level += 1
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
  
end
