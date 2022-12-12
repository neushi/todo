require_relative '../lib/work'
require "ruby-graphviz"

class WorkPool
  attr_reader :pool

  def initialize
    @next_key = 1
    @pool = Hash.new
  end

  def add(work)
    @pool[@next_key] = work
    connect_reversely(@next_key)
    work.id = @next_key
    @next_key += 1
    return work.id
  end

  def set1_subwork_of2(id1, id2)  # id1はid2のsubwork
    (@pool[id2].sub_works << id1).uniq!
    (@pool[id1].for_works << id2).uniq!
  end
  
  def remove(work)
  end

  def top_works
  end

  def show_sub_works(work)
  end

  def part_of(id, id_sub)
  end

  def leafs
  end

  def check
    @pool.each {|id, work|
      return work if work.check != "OK"
    }
    loop = self.first_loop 
    return loop unless loop.nil?
  # 不在のIDを指していないこと
    fail
    "OK"
  end

  def check_names
    names = []
    duplicated = []
    @pool.each {|id, work|
      if names.member?(work.name) then
        duplicated << work.name 
      end
      names << work.name
    }
    duplicated
  end

  def first_loop # @poolを順に検査して、初めて見つかったloopを返す
    @pool.each {|id, work|
      loop = first_loop1(id, [])
      return loop unless loop.nil?
    }
    return nil
  end

  def first_loop1(id, path) # id からfor_worksを辿ってloopになっていたら、はじめて見つかったものを返す
    new_path = path.prepend(id)
    return new_path.uniq if new_path.uniq != new_path 
    @pool[id].for_works.each {|for_id| 
      loop = first_loop1(for_id, new_path)
      return loop if (loop.uniq != loop)
    }
    return nil
  end

  def export(out_file_name)
    nodes = Hash.new
    g = GraphViz.new( :G, :type => :digraph )
    @pool.each_key do |key|
      nodes[@pool[key].id] = g.add_nodes(@pool[key].name)
    end
    @pool.each_key do |key|
      to_node = nodes[@pool[key].id]
      from_nodes = @pool[key].sub_works
      from_nodes.each do |fn|
        g.add_edges(fn, to_node)
      end
    end
    g.output( :png => (out_file_name + ".png" ))
  end
end
