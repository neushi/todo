require 'minitest/autorun'
require_relative '../lib/workPool'

class WorkPoolTest < Minitest::Test   # Testで始まるか、終わるクラス名
  # poolを作れるか
  def test_new
    w_pool = WorkPool.new() 
    assert_equal(Hash, w_pool.pool.class)
    assert_equal(0, w_pool.pool.size)
  end
  
  # 追加、削除、関係追加、
  # nameがダブっていたら例外
  def test_check
    w_pool = WorkPool.new()
    sample_pool1(w_pool)
    assert_equal("OK", w_pool.check)

  # exportして確認
    w_pool.export("test_check")
  end

  def sample_pool1(w_pool)
    w_pool.add(Work.new("目的1"))
    w_pool.add(Work.new("目的11"))
    w_pool.add(Work.new("目的12"))
    w_pool.add(Work.new("目的13"))
    w_pool.add(Work.new("目的111"))
    w_pool.add(Work.new("目的131"))
    w_pool.add(Work.new("目的2"))
    w_pool.add(Work.new("目的21"))
    w_pool.add(Work.new("目的22"))
    w_pool.add(Work.new("目的23"))
    w_pool.add(Work.new("目的3"))
    w_pool.add(Work.new("目的31"))
    w_pool.add(Work.new("目的4"))
    w_pool.add(Work.new("目的a"))
    w_pool.add(Work.new("目的b"))
    w_pool.add(Work.new("目的c"))
  end
end