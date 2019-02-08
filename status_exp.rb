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
    text = @level.to_s + "," + @now.to_s + "," + @all.to_s + ","
    text << @step.to_s + "," + @rate.to_s
    return text
  end
end
