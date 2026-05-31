import numpy as np

# Convert 1D to 2D
arr = np.array([1,2,3,4,5,6])
arr2d = arr.reshape(2,3)
print(arr2d)

# Attributes
print(arr2d.shape)
print(arr2d.ndim)
print(arr2d.dtype)
print(arr2d.itemsize)

# 3x3 array of 9
a = np.full((3,3),9)
print(a)

# 10 evenly spaced values
b = np.linspace(25,125,10)
print(b)

# Python list to NumPy array
lst = [10,20,30,40]
c = np.array(lst)
print(c)

print(c[::-1])