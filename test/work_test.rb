require 'minitest/autorun'
require_relative '../lib/work'

class WorkTest < Minitest::Test   # Testで始まるか、終わるクラス名
  # workを作れるか
  def test_new          # testで始まるメソッド名
    w = Work.new("namae") 
    assert_instance_of(Work, w)
    assert_equal(0, w.id)
    assert_equal("namae", w.name)
  end

  # id,名前を変更できるか
  def test_name
    w = Work.new("namae") 
    assert_equal("namae", w.name)
    w.name = "name"
    assert_equal("name", w.name)
    assert_equal(0, w.id)
    w.id = 345
    assert_equal(345, w.id)
  end

# @date_create = Date.today
# @date_modified = Date.today
# @for_works = []
# @sub_works = []
# @cond_daylight = false
# @cond_weekday = false
  def test_date_relations_conditions
    w = Work.new("namae") 
    assert_equal(Date.today, w.date_created)
    assert_equal(Date.today, w.date_modified)
    w.date_created = Date.today - 1 
    w.date_modified = Date.today - 1 
    assert_equal(Date.today - 1, w.date_created)
    assert_equal(Date.today - 1, w.date_modified)
    w.for_works = [2,3]
    w.sub_works = [12,33]
    assert(w.for_works.eql?([2,3]))
    assert(w.sub_works.eql?([12,33]))
    refute(w.cond_daylight)
    refute(w.cond_weekday)
    w.cond_daylight = true
    w.cond_weekday = true
    assert(w.cond_daylight)
    assert(w.cond_weekday)
    w.cond_daylight = false
    w.cond_weekday = false
    refute(w.cond_daylight)
    refute(w.cond_weekday)
  end

# for_whatのリストがダブっていたら例外 とか
  def test_check
  end

end
