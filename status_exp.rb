# coding: utf-8
class StatusExp
  public
  attr_reader :level
  
  def initialize()
    @level = 1
    @now = 0
    @all = 0
    @step = 100
    @rate = 2.0
  end

  # ========== ========== ========== ========== ==========
  #   level exp を表示
  # ========== ========== ========== ========== ==========
  def show()
    print("LEVEL : #{@level.to_i}\n")
    print("EXP   : #{@now.to_i}\n")
    print("NEXT  : #{@step.to_i}\n")
  end

  # ========== ========== ========== ========== ==========
  #   set
  # ========== ========== ========== ========== ==========
  def set_rand()
    rdm = Random.new()
    @step = rdm.rand(1..10) * 100
    @rate = rdm.rand(1.2..3.0) 
  end

  def set_self()
    print("LEVEL?   ->")
    @level = $stdin.gets.to_f()
    print("EXPstep? ->")
    @step = $stdin.gets.to_f()
    print("EXPrate? ->")
    @rate = $stdin.gets.to_f()
  end
  
  def set_load(exp=[1, 100, 1.5])
    push_level(exp[0])
    push_step(exp[1])
    push_rate(exp[2])
  end


  # ========== ========== ========== ========== ==========
  #   push
  # ========== ========== ========== ========== ==========
  def push_level(x=1)  
    x >= 1 ? @level = x : @level = 1
  end
  def push_step(x=100)
    x > 0 ? @step = x : @step = 100
  end
  def push_rate(x=2.0)
    x > 1.0 ? @rate = x : @rate = 2.0
  end

  ## ========== ========== ========== ========== ==========
  ##   level に合わせて exp(now, all) を調整する. level up数を返却
  ## ========== ========== ========== ========== ==========
  def init_exp()
    lvnum = 0
    2.upto(@level) do |num|
      @all += @step
      @step *= @rate
      lvnum += 1
    end
    return lvnum
  end    
  # ---------- ---------- ---------- ---------- ----------
  #   経験値を加算し,レベルアップ数を返す
  # ---------- ---------- ---------- ---------- ----------
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

  # ========== ========== ========== ========== ==========
  #  dataをstring型で返す
  # ========== ========== ========== ========== ==========
  def get_data_s()
    return @level.to_s + "," + @step.to_s + "," + @rate.to_s
  end
end
