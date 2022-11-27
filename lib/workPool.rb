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


    def export
        gv = GraphViz.new( :G, :type => :digraph )
        @pool.each_key do |key|
        end
    end
end
