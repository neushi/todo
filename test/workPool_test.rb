require 'minitest/autorun'
require_relative '../lib/workPool'

class WorkPoolTest < Minitest::Test   # Testで始まるか、終わるクラス名
  # poolを作れるか
  def test_new
    w_pool = WorkPool.new() 
    assert_equal(Hash, w_pool.pool.class)
    assert_equal(0, w_pool.pool.size)
  end

  # workを追加
  def test_add_delete
    w_pool = WorkPool.new() 
    work1 = Work.new("作業1")
    work2 = Work.new("作業2")
    work3 = Work.new("作業3")
    # IDを確認
    w_pool.add(work1)
    assert_equal(1, w_pool.pool.size)
    # IDを確認
    w_pool.add(work2)
    w_pool.add(work3)
    assert_equal(3, w_pool.pool.size)
  # exportして確認
    w_pool.export("test_add_delete")
  end

  def sample_pool1
    w_pool = WorkPool.new()
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
  # 削除
  # 関係の追加
  # idがダブっていたら例外
  # nameがダブっていたら例外
  # 
  # 
  # 
  # 
  # 
  # 
  # 
  # 
  # 
  # 
end