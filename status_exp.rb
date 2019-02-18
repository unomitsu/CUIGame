# coding: utf-8
class StatusExp
  public
  attr_reader :level
  
  def initialize()
    @level = 1
    @now = 0
    @all = 0
    @step = 100
    @rate = 1.5
  end
  
  def show()
    print("LEVEL : #{@level.to_i}\n")
    print("EXP   : #{@now.to_i} (#{@all.to_i})\n")
  end

  # set
  def set_rand()
    rdm = Random.new()
    @step = rdm.rand(1..10) * 100
    @rate = rdm.rand(1.2..2.0) 
  end

  def set_self()
    print("LEVEL?   ->")
    @level = $stdin.gets.to_i()
    print("EXPstep? ->")
    @step = $stdin.gets.to_i()
    print("EXPrate? ->")
    @rate = $stdin.gets.to_i()

    1.upto(@level) do |num|
      @now += @step
      @all += @step
      @step *= @rate
    end
  end
  
  def set_load(exp=[1, 100, 1.5])
    push_level(exp[0])
    push_step(exp[1])
    push_rate(exp[2])
    
    1.upto(@level) do |num|
      @now += @step
      @all += @step
      @step *= @rate
    end
  end


  # push
  def push_level(x=1)
    if x < 1
      x = 1
    end
    @level = x
  end
  def push_exp(x=0)
    if x < 0
      x = 0
    end
    @now = 0
  end
  def push_step(x=100)
    if x < 0
      x = 100
    end
    @step = x
  end
  def push_rate(x=1.5)
    if (x < 0)
      x = 1.5
    end
    @rate = x
  end

  # 経験値を加算し,レベルアップ数を返す
  def add_exp(x=0)
    lvnum = 0
    if x > 0
      @now += x
      @all += x
      while @step <= @now
        @now -= @step
        @step *= @rate
        @level += 1
        lvnum += 1
      end
    end
    return lvnum
  end

  # dataをstring型で返す
  def get_data_s()
    return @level.to_s + "," + @step.to_s + "," + @rate.to_s
  end
end
