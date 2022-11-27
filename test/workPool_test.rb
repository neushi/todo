require 'minitest/autorun'
require_relative '../lib/workPool'

class WorkPoolTest < Minitest::Test     # Testで始まるか、終わるクラス名
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
    end

    # exportして確認
    def test_export
        w_pool = WorkPool.new() 
        work1 = Work.new("作業1")
        work2 = Work.new("作業2")
        work3 = Work.new("作業3")
        w_pool.add(work1)
        w_pool.add(work2)
        w_pool.add(work3)

        w_pool.export


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