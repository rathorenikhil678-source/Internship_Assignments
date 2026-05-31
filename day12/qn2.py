#4x4x3 Array 
import numpy as np

arr = np.arange(48).reshape(4,4,3)

print(arr)

# Second set, first row, last column
print(arr[1,0,-1])