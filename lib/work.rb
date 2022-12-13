require   'date'

class Work
  attr_accessor :id, :name, :tag
  attr_accessor :date_created, :date_modified
  attr_accessor :for_works, :sub_works 
  attr_accessor :work_type, :cond_daylight, :cond_weekday, :due
  
  def initialize(name)
      @id = 0
      @name = name
      @tag # ユーザが自由に゛使って良い分類用のタグ
      @date_created = DateTime.now
      @date_modified = DateTime.now
      @for_works = []
      @sub_works = []
      @work_type = ""            # 仕事とか趣味とか雑用とか
      @cond_daylight = false
      @cond_weekday = false
      @due = DateTime.new(3000, 1, 1)
  end 
 
  def check # クラスとリストのダブり
    return "nil name" if @name == nil 
    return "empty name" if @name == ""
    return "id:0" if @id == 0
    return "bad id" if @id.class != Integer
    return "bad date_created" if @date_created.class != DateTime
    return "bad date_modified" if @date_modified.class != DateTime
    return "for_works duplicated" if @for_works != @for_works.uniq
    return "sub_works duplicated" if @sub_works != @sub_works.uniq
    return "bad for_works" if @for_works.filter {|i| i.class != Integer} != []
    return "bad sub_works" if @sub_works.filter {|i| i.class != Integer} != []
    return "bad work_type" if @work_type.class != String
    return "bad cond_daylight" unless ( @cond_daylight == true ||  @cond_daylight == false)
    return "bad cond_weekday" unless ( @cond_weekday == true ||  @cond_weekday == false)
    return "bad due" if @due.class != DateTime
    return "OK"
  end
end
