require   'date'

class Work
  attr_accessor :id, :name, :type, :date_created, :date_modified
  attr_accessor :w_pool, :for_works, :sub_works, :cond_daylight, :cond_weekday
  
  def initialize(name)
      @name = name
      @id = 0
      @type = nil
      @date_created = Date.today
      @date_modified = Date.today
      @for_works = []
      @sub_works = []
      @cond_daylight = false
      @cond_weekday = false
      @due = nil
  end 
 
  def daylight
  end
 
  def weekday
  end

  def check
    return "null name" if @name == nil 
    return "empty name" if @name == ""
    return "id:0" if @id == 0
    return "bad id" if @id.class != Integer
    return "bad date_created" if @date_created.class != Time
    return "bad date_modified" if @date_modified.class != Time
    return "for_works duplicated" if @for_works != @for_works.uniq
    return "sub_works duplicated" if @sub_works != @sub_works.uniq
    ぜんぶ数字でなければだめ
      fail @for_works = []
      fail @sub_works = []
    return "bad cond_daylight" if @cond_daylight.class != Boolean
    return "bad cond_weekday" if @cond_weekday.class != Boolean

  end
end
