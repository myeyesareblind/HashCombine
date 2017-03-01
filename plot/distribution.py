import matplotlib.pyplot as plt
import numpy as np
from numpy import genfromtxt

fig = plt.figure()

firstax = None

for idx, fn_name in enumerate(["sum", "xor", "mikeash", "prime", "boost", "oat", "fnv", "elf", "jenkins"]):
    buckets = genfromtxt('/Users/myeyesareblind/Temp/plots/' + fn_name + ".csv", delimiter=',')

    ax = fig.add_subplot(3, 3, idx + 1, sharey=firstax)
    ax.vlines(np.arange(0, buckets.shape[0], 1), [0], buckets)
    ax.set_title(fn_name)
    ax.set_xlabel('bucket')
    ax.set_ylabel('collisions')
    if firstax == None:
        firstax = ax

fig.tight_layout()
plt.show()
