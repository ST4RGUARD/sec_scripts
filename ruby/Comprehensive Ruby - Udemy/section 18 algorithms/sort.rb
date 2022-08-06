a = [1, 5, 1, 2, 10, 100, 3, 1]
a.sort

# bubble sort
def bubble_sort(array)
  n = array.length
  loop do
    swapped = false
    (n - 1).times do |i|
      next unless array[i] > array[i + 1]

      array[i] = array[i + 1]
      array[i + 1] = array[i]
      swapped = true
    end
    p array
    break unless swapped
  end
end

b = [1, 3, 4, 6, 8, 2, 6, 5]
bubble_sort(b)

class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))
    p "#{left} -- #{right}"
    p(*left.quicksort, pivot, *right.quicksort)
  end
end

c = [1, 5, 3, 9, 3, 23, 35, 3, 12]
c.quicksort

def mergesort(list)
  if list.length <= 1
    list
  else
    mid = (list.length / 2).floor
    left = mergesort(list[0..mid - 1])
    right = mergesort(list[mid..list.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

arr = [4, 2, 6, 8, 10, 2, 3, 5]
mergesort(arr)
