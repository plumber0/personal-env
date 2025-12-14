# multiple assignments
n , m = 0, "abc"

# range(start, end, step)
# range(inclusive, exclusive, step)
# range(default start is 0, default step is 1)

print("should be 2, 3, 4, 5")
for i in range(2, 6):
    print(i)

print("should be 5, 4, 3, 2")
for i in range(5, 1, -1):
    print(i)


# Division is decimal by default
print(5/2)

# Double slash rounds down

# 2.5 -> 2
print("5//2 should be 2")
print(5//2)

# -1.5 -> -2
print("-3//2 should be -2")
print(-3//2)

# rounds down toward zero
print("int(-3/2) should be -1")
print(int(-3/2))


# modding
print("10%3 should be 1", 10%3)

import math
print("math.fmod(-10, 3) should be -1")
print(math.fmod(-10, 3))


# more math helpers
print("math.floor(3/2) should be 1")
print(math.floor(3/2))
print("math.ceil(3/2) should be 2")
print(math.ceil(3/2))
print("math.sqrt(2) should be 1.4142135623730951")
print(math.sqrt(2))
print("math.pow(2, 3) should be 8")
print(math.pow(2, 3))


# Max / Min Int

float("inf")
float("-inf")

# Arrays
arr = [1, 3, 4]
arr.insert(1,2)
print("arr should be [1, 2, 3, 4]", arr)
arr.append(5)
print("arr should be [1, 2, 3, 4, 5]", arr)
arr.pop()
print("arr should be [1, 2, 3, 4]", arr)

n = 5
arr = [0] * n
print("arr should be [0, 0, 0, 0, 0]", arr)

# Sublists
arr = [1,2,3,4]
print("arr[1:3] should be [2, 3]", arr[1:3])


# Unpacking
a, b, c = [1, 2, 3]
print("a should be 1, b should be 2, c should be 3", a, b, c)


# Loop through array
nums = [1,2,3]

# using index
for i in range(len(nums)):
    print(nums[i])

# using value
for n in nums:
    print(n)

# using index and value
for i, n in enumerate(nums):
    print(i, n)

# Loop through multiple arrays
nums1 = [1,3,5]
nums2 = [2,4,6]

for n1, n2 in zip(nums1, nums2):
    print(n1, n2)


# Reverse

nums = [1,2,3]
nums.reverse()
print(nums)

# Sorting
arr = [5,4,7,3,8]
arr.sort()
print(arr)

arr.sort(reverse=True)
print(arr)

# custom sort (by length of string)
words = ["apple", "banana", "cherry", "date"]
words.sort(key = lambda x: len(x))
print(words)


# List comprehension

arr = [i+1 for i in range(5)]
print("arr should be [1, 2, 3, 4, 5]", arr)


# 2-D lists
arr = [[0] * 4 for i in range(4)]
print(arr)


# Queues (double ended queue)

from collections import deque

queue = deque()

queue.append(1)
queue.append(2)

print("queue should be [1, 2]", queue)


queue.popleft()

print("queue should be [2]", queue)


# HashSet

mySet = set()

mySet.add(1)
mySet.add(2)
mySet.add(3)

print("mySet should be {1, 2, 3}", mySet)

print("1 in mySet should be True", 1 in mySet)
print("4 in mySet should be False", 4 in mySet)

mySet.remove(2)
print("mySet should be {1, 3}", mySet)

mySet.clear()
print("mySet should be {}", mySet)

# list to set
print(set([1, 2, 3]))

# Set comprehension
mySet = {i for i in range(5)}
print(mySet)


# HashMap 

MyMap = {}
MyMap["apple"] = 1
MyMap["banana"] = 2
MyMap["cherry"] = 3

print("MyMap should be {'apple': 1, 'banana': 2, 'cherry': 3}", MyMap)

MyMap.pop("banana")
print("MyMap should be {'apple': 1, 'cherry': 3}", MyMap)

# Dictionary comprehension

MyMap = { i: 2*i for i in range(5)}
print(MyMap)

# Loop through HashMap
for key in MyMap:
    print(key, MyMap[key])

for val in MyMap.values():
    print(val)

for key, value in MyMap.items():
    print(key, value)

# tuple

# can be used as key for hash map/set

myMap = {(1,2): 3}
print(myMap[(1,2)])


mySet = set()
mySet.add((1,2))
print((1,2) in mySet)


# List can't be hash

# Heaps
# heap is keep the smallest element at the root
import heapq

# minHeap
minHeap = []
heapq.heappush(minHeap, 3)
heapq.heappush(minHeap, 1)
heapq.heappush(minHeap, -500)
heapq.heappush(minHeap, 2)
print(minHeap)

while len(minHeap) > 0:
    print(heapq.heappop(minHeap))

# maxHeap

maxHeap = []
# push -x to make it a maxHeap
heapq.heappush(maxHeap, -3)
heapq.heappush(maxHeap, -1)
heapq.heappush(maxHeap, 500)
heapq.heappush(maxHeap, -2)

print(maxHeap)

while len(maxHeap) > 0:
    print(-heapq.heappop(maxHeap))


# Build heap from initial values

arr = [2, 1, 8, 4, 5]

heapq.heapify(arr)

while arr:
    print(heapq.heappop(arr))



# Nested functions have access to outer variables

def outer(a, b):
    c = "c"

    def inner():
        return a + b + c
    return inner()

print(outer("A", "B"))


# Can modify objects but not reassign
# unless using nonlocal keyword

def double(arr, val):
    def helper():
        # Modifying array works
        for i, n in enumerate(arr):
            arr[i] = n * 2
        
        # can not modify val in the helper scope
        # val *= 2

        # this will modify val in the outer scope
        nonlocal val
        val *= 2
    helper()
    print(arr, val)

nums = [1, 2]
val = 3
double(nums, val)