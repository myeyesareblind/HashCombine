import matplotlib.pyplot as plt
plt.rcdefaults()
import numpy as np
import matplotlib.pyplot as plt

plt.rcdefaults()
fig, ax = plt.subplots()

# Example data
functions = ['sum', 'xor', 'mikeash', 'boost', 'prime', 'fnv', 'oat', 'elf', 'jenkins']
y_pos = np.arange(len(functions))
performance = [48.01, 100, 17.72    , 19.75  , 19.45  , 18.71, 23.36, 25.67, 28.02]

ax.barh(y_pos, performance, align='center', color='green')
ax.set_yticks(y_pos)
ax.set_yticklabels(functions)
ax.invert_yaxis()  # labels read top-to-bottom
ax.set_xlabel('seconds')
ax.set_title('Duration to make NSDictionary of rnd() and rnd() as key')

plt.show()
plt.close()
