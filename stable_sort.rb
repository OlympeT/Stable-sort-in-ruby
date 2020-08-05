require 'benchmark'
require 'benchmark/ips'

@arr = (1..100).to_a

def sort(arr)
  arr.sort_by { |i| i % 2 }
end

def stable_sort(arr)
  arr.each_with_index.sort_by { |i, j| [i % 2, j] } # .map(&:first)
end

Benchmark.ips do |r|
  N = 1000

  r.report('sort') do
    N.times { sort @arr }
  end

  r.report('stable sort') do
    N.times { stable_sort @arr }
  end
end
