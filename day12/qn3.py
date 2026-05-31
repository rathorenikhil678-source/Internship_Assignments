import numpy as np

arr = np.arange(16).reshape(4,4)

print(arr)

# Odd rows and even columns
print(arr[1::2, ::2])

arr3d = np.arange(48).reshape(4,4,3)

print(arr3d[1,:2,:2])