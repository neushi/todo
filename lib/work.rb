require   'date'

class Work
  attr_accessor :id, :name, :date_created, :date_modified, :for_works, :sub_works, :cond_daylight, :cond_weekday
  
  def initialize(name)
      @id = 0               # 0は使わないことにする,このままでは不正
      @name = name
      @date_created = Date.today
      @date_modified = Date.today
      @for_works = []
      @sub_works = []
      @cond_daylight = false
      @cond_weekday = false
  end 
 
  def daylight
  end
 
  def weekday
  end

  def check
  end
end
