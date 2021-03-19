

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

def animate(data, im):
    im.set_data(data)

def step():
    while  True:
        input("press key")

        # replace this with Conway's Game of Life logic
        data = np.random.randn(10, 10)
        yield data

fig, ax = plt.subplots()
im = ax.imshow(np.random.randn(10, 10), interpolation='nearest')
ani = animation.FuncAnimation(
    fig, animate, step, interval=1, repeat=False, fargs=(im, ))
plt.show()