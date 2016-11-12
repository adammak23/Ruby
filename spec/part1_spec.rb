# keyboard shortcuts: https://atom.io/packages/rspec
#
#   Ctrl+Alt+T - executes all specs the current file
#   Ctrl+Alt+X - executes only the spec on the line the cursor's at
#   Ctrl+Alt+E - re-executes the last executed spec

require 'simplecov'
SimpleCov.start

require 'part1'

RSpec.describe 'part1.rb' do
  describe '#initialize' do
    it 'Edge should be initialized' do
      expect { Edge.new(1, 1, 1) }.not_to raise_error
    end

    it 'Should raise error without argument' do
      expect { Edge.new }.to raise_error(ArgumentError)
    end

    it 'Edge sould contain proper value' do
      temp3 = Edge.new(1, 1, 1)
      expect(temp3.vert1).to eq(1)
      expect(temp3.vert2).to eq(1)
      expect(temp3.weight).to eq(1)
    end

    it 'Connecting vertices should be defined' do
      expect { Graph.new.make_edge(1, 1, 1) }.not_to raise_error
    end

    it 'Graph should be initialized' do
      expect { Graph.new }.not_to raise_error
    end

    it 'Should raise error with argument' do
      expect { Graph.new(1) }.to raise_error(ArgumentError)
    end
  end

  describe '#edge properties' do
    temp = Graph.new
    it 'Edge should return corrrect type' do
      expect(temp.neighbors(1)).to match_array([])
    end

    it 'Edge should have neighbors if connected' do
      temp.make_edge(1, 1, 1)
      expect(temp.neighbors(1)).to match_array([1])
    end

    it 'Returns correct length' do
      expect(temp.edge_length(1, 1)). to be 1
    end

    it 'Raise error with invalid arguments' do
      expect { temp.edge_length(1) }.to raise_error(ArgumentError)
    end

    it 'Returns nil length for duplicated vertices' do
      expect(temp.edge_length(2, 2)). to be nil
    end

    it 'Adding an edge increases list size by 2' do
      expect { temp.make_edge(1, 2, 2) }.to change { temp.edges.size }.by(2)
    end
  end

  describe '#dijkstra' do
    temp = Graph.new
    it 'Should be defined' do
      expect { Graph.new.dijkstra(1) }.not_to raise_error
    end

    it 'Should raise error without argument' do
      expect { temp.dijkstra }.to raise_error(ArgumentError)
    end

    it 'Returns correct values' do
      expect(temp.dijkstra(1)).to include(:paths, :distances)
    end

    it 'Returns correct path' do
      (1..3).each { |node| temp.push node }
      temp.make_edge(1, 2, 1)
      temp.make_edge(2, 3, 1)
      expect(temp.dijkstra(1)).to include(paths: { 1 => 1, 2 => [1, 2], 3 => [1, 2, 3] })
      expect(temp.dijkstra(1)).to include(distances: { 1 => 0, 2 => 1, 3 => 2 })
    end
    it 'Returns nil patch for duplicated vertices' do
      expect(temp.dijkstra(1, 1)).to include(path: 1, distance: 0)
    end

    it 'throws error when no path' do
      temp2 = Graph.new
      (1..4).each { |node| temp2.push node }
      temp2.make_edge(1, 2, 1)
      temp2.make_edge(3, 4, 1)
      expect { temp2.dijkstra(3) }.to raise_error(ArgumentError)
    end
  end
end
