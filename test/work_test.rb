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

# 
  def test_check
    w = Work.new("") 
    assert_equal("empty name", w.check)
    w.name = "test_check"
    assert_equal("id:0", w.check)
    w.id = 222
    w.date_created = ""
    assert_equal("bad date_created", w.check)
    w.date_created = DateTime.now
    w.date_modified = ""
    assert_equal("bad date_modified", w.check)
    w.date_modified = DateTime.now
    w.for_works = [3,3]
    assert_equal("for_works duplicated", w.check)
    w.for_works = [3,"ww"]
    assert_equal("bad for_works", w.check)
    w.for_works = [3,5]
    w.sub_works = [4,5,6,4]
    assert_equal("sub_works duplicated", w.check)
    w.sub_works = [3,"ee",6,4]
    assert_equal("bad sub_works", w.check)
    w.sub_works = [3,5,6,4]
    w.work_type = nil
    assert_equal("bad work_type", w.check)
    w.work_type = 2 
    assert_equal("bad work_type", w.check)
    w.work_type = "aa" 

    w.cond_daylight = 2
    assert_equal("bad cond_daylight", w.check)
    w.cond_daylight = nil
    assert_equal("bad cond_daylight", w.check)
    w.cond_daylight = true

    w.cond_daylight = 2
    assert_equal("bad cond_daylight", w.check)
    w.cond_daylight = nil
    assert_equal("bad cond_daylight", w.check)
    w.cond_daylight = false

    w.due = ""
    assert_equal("bad due", w.check)
    w.due = DateTime.now
    assert_equal("OK", w.check)

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

  def test_other_instance_variable
    w = Work.new("namae") 

    assert_instance_of(DateTime, w.date_created)
    assert_instance_of(DateTime, w.date_modified)
    now = DateTime.now
    w.date_created = now
    w.date_modified = now
    assert_equal(now, w.date_created)
    assert_equal(now, w.date_modified)

    assert(w.for_works.eql?([]))
    assert(w.sub_works.eql?([]))
    w.for_works = [2,3]
    w.sub_works = [12,33]
    assert(w.for_works.eql?([2,3]))

    assert_instance_of(String, w.work_type)
    w.work_type = "sampleType"
    assert(w.work_type.eql?("sampleType"))

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

    assert_instance_of(DateTime, w.due)
    t = Time.now
    w.due = t
    assert(w.due.eql?(t))
  end

end
