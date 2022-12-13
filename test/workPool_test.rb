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
  # 多重追加、多重削除、多重関係追加、
  # 関係先の削除
  def test_check # add, set1_subwork_of2もテストしたことにする
    w_pool = WorkPool.new()
    sample_pool1(w_pool)
    assert_equal("OK", w_pool.check)

  # exportして確認
    w_pool.export("../work/test_check")
  end

  # nameがダブっていたら
  def test_check_names
    w_pool = WorkPool.new()
    sample_pool1(w_pool)
    w_pool.add(Work.new("目的131"))
    w_pool.add(Work.new("目的131"))
    w_pool.add(Work.new("目的11"))
    assert_equal(["目的131", "目的131", "目的11"], w_pool.check_names)
  end

  def sample_pool1(w_pool)
    id1 = w_pool.add(Work.new("目的1"))
    id2 = w_pool.add(Work.new("目的11"))
    id3 = w_pool.add(Work.new("目的12"))
    id4 = w_pool.add(Work.new("目的13"))
    id5 = w_pool.add(Work.new("目的111"))
    id6 = w_pool.add(Work.new("目的131"))
    id7 = w_pool.add(Work.new("目的2"))
    id8 = w_pool.add(Work.new("目的21"))
    id9 = w_pool.add(Work.new("目的22"))
    id10 = w_pool.add(Work.new("目的23"))
    id11 = w_pool.add(Work.new("目的3"))
    id12 = w_pool.add(Work.new("目的31"))
    id13 = w_pool.add(Work.new("目的4"))
    id14 = w_pool.add(Work.new("目的a"))
    id15 = w_pool.add(Work.new("目的b"))
    id16 = w_pool.add(Work.new("目的c"))
    w_pool.set1_subwork_of2(id2,id1)
    w_pool.set1_subwork_of2(id5,id2)
    w_pool.set1_subwork_of2(id3,id1)
    w_pool.set1_subwork_of2(id4,id1)
    w_pool.set1_subwork_of2(id4,id7)
    w_pool.set1_subwork_of2(id8,id7)
    w_pool.set1_subwork_of2(id9,id7)
    w_pool.set1_subwork_of2(id10,id7)
    w_pool.set1_subwork_of2(id6,id4)
    w_pool.set1_subwork_of2(id6,id8)
    w_pool.set1_subwork_of2(id12,id11)
    w_pool.set1_subwork_of2(id12,id13)
    w_pool.set1_subwork_of2(id13,id11)
    w_pool.set1_subwork_of2(id15,id14)
    w_pool.set1_subwork_of2(id14,id16)
    w_pool.set1_subwork_of2(id16,id15)
  end
end