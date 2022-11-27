require_relative '../lib/work'
require "ruby-graphviz"

class WorkPool
  attr_reader :pool
  # IDのダブりがないこと、
  # 不在のIDを指していないこと

  def initialize
    @next_key = 1
    @pool = Hash.new
  end

  def add(work)
    @pool[@next_key] = work
    work.id = @next_key
    @next_key += 1
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
    g.add_edges( nodes[1], nodes[2] )
    g.output( :png => (out_file_name + ".png" ))
  end
end
