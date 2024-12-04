# Algorithm
# 1. Solve the left half
# 2. Solve the right half
# 3. Merge the two halves together
# Base Case : If there is a single element then quit, it's already sorted

def mergesort(array)
  # Base Case
  if array.count == 1
    return array
  end

  # Calculate mid index
  start = 0
  last = array.length - 1
  mid = (start + last) / 2

  # Apply mergesort again on left and right half
  left_half = mergesort(array[start..mid])
  right_half = mergesort(array[mid+1..last])
  
  # Merge both halves
  i = 0
  j = 0
  k = 0
  sorted_array = []
  while i <= left_half.length - 1 && j <= right_half.length - 1
    if left_half[i] < right_half[j]
      sorted_array[k] = left_half[i]
      k += 1
      i += 1
    else
      sorted_array[k] = right_half[j]
      k += 1
      j += 1
    end
  end

  while i <= left_half.length - 1
    sorted_array[k] = left_half[i]
    k += 1
    i += 1
  end

  while j <= right_half.length - 1
    sorted_array[k] = right_half[j]
    k += 1
    j += 1
  end

  return sorted_array
end

array = [105, 79, 100, 110]
p mergesort(array)
