import numpy as np

def compute_stat(a, stat):
    return [stat(a, axis=0).tolist(), stat(a, axis=1).tolist(), stat(a, axis=None)]

def calculate(list):
    if len(list) < 9:
        raise ValueError("List must contain nine numbers.")
    
    arr = np.array(list).reshape((3, 3))

    return {
    'mean': compute_stat(arr, np.mean),
    'variance': compute_stat(arr, np.var),
    'standard deviation': compute_stat(arr, np.std),
    'max': compute_stat(arr, np.max),
    'min': compute_stat(arr, np.min),
    'sum': compute_stat(arr, np.sum)
    }
