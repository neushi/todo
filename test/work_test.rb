require 'minitest/autorun'
require_relative '../lib/work'

class WorkTest < Minitest::Test     # Testで始まるか、終わるクラス名
    # workを作れるか
    # 作った直後のidは０
    # 名前を変更できるか
    def test_new                    # testで始まるメソッド名
        w = Work.new("namae") 
        assert_instance_of(Work, w)
        assert_equal(0, w.id)
        assert_equal("namae", w.name)
        w.name = "name"
        assert_equal("name", w.name)
    end
    # for_whatに0が入っていたら例外
    # for_whatのリストがダブっていたら例外
    # 

end
