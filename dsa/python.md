# Python DSA / LeetCode Interview Cheat Sheet 

## Rule of thumb
- Using built-ins + standard library is usually OK (sorted, Counter, heapq, deque, bisect, etc.)
- If prompt says "implement without X" or interviewer asks "from scratch", then don't use that tool.

## Built-in data structures (no imports)

list (dynamic array / stack)
- Use: stack, array, DP table
- Ops: append, pop, indexing, slicing
- Sort: a.sort() (in-place), sorted(a) (new list)

tuple (immutable, hashable)
- Use: keys in dict/set like (r, c), return pairs

dict (hash map)
- Use: frequency, index mapping, caching
- Patterns:
- d.get(k, 0)
- d.setdefault(k, [])
- if k in d:

set (hash set)
- Use: membership, visited, dedup
- Ops: add, remove, in
- Algebra: a | b, a & b, a - b

str
- Use: parsing, substrings
- Ops: split, "".join(...), slicing, startswith, endswith


## Built-in functions you’ll use constantly

Iteration helpers
- enumerate(a)
- zip(a, b)
- reversed(a)
- range(n), range(l, r, step)

Aggregation / utilities
- min, max, sum
- abs
- all, any

Sorting
- sorted(iterable, key=..., reverse=...)
- a.sort(key=..., reverse=...)

Common conversions
- list(x), tuple(x), set(x), dict(x)
- ord(c), chr(x)

## collections (high-value for interviews)

from collections import Counter, defaultdict, deque

Counter
- Frequency map
- Counter(nums)
- c.most_common(k)

defaultdict
- Avoid key checks
- defaultdict(int)  # counts
- defaultdict(list) # adjacency list
- defaultdict(set)

deque (queue / BFS)
- append, appendleft
- popleft (O(1)) ✅
- Use instead of list.pop(0) ❌ (O(n))

## heapq (priority queue)

import heapq

- heapq.heappush(h, x)
- heapq.heappop(h)  # min element
- Max-heap trick: push -x

Common patterns:
- k smallest / largest
- merge k sorted lists
- Dijkstra / best-first search

## bisect (binary search on sorted array)

from bisect import bisect_left, bisect_right

- bisect_left(a, x)  # first index to insert x
- bisect_right(a, x) # insert position after existing x

Used for:
- lower/upper bound
- insertion position
- LIS (with patience sorting)

## itertools (useful, don’t overuse)

import itertools
from itertools import accumulate

- accumulate(nums)  # prefix sums
- combinations(arr, k)
- permutations(arr, k)
- product(a, b)
- groupby (usually only if data is sorted)

## math (small but common)

import math

- math.gcd(a, b)
- math.inf / -math.inf
- math.ceil, math.floor

## functools (DP memoization)

from functools import lru_cache

- @lru_cache(None) for memoized recursion
-Sometimes interviewer prefers explicit DP table—use judgement.

## Complexity “gotchas” (memorize)
- list.pop(0) → O(n) ❌ use deque.popleft()
- x in list → O(n), x in set/dict → avg O(1)
- sorted() / .sort() → O(n log n)
- Building string with += in loop can be slow → use list + "".join(...)

