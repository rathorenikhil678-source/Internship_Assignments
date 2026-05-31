#Replace Odd Numbers and Find Non-Zero Indices
import numpy as np

arr = np.array([
    [23,56,78,93],
    [71,82,13,24]
])

for i in range(arr.shape[0]):
    for j in range(arr.shape[1]):
        if arr[i,j] % 2 != 0:
            arr[i,j] = -1

print(arr)

a = np.array([1,0,2,0,3,0,4])

print(np.nonzero(a))