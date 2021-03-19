import pyformulas as pf
import matplotlib.pyplot as plt
plt.style.use('ggplot')

import numpy as np
import time

fig = plt.figure()

screen = pf.screen(title='Plot')

start = time.time()
for i in range(100):
    t = time.time() - start

    x = np.linspace(t-3, t, 100)
    y = np.sin(2*np.pi*x) + np.sin(3*np.pi*x)
    plt.xlim(t-3,t)
    plt.ylim(-3,3)
    plt.plot(x, y, c='black')

    # If we haven't already shown or saved the plot, then we need to draw the figure first...
    fig.canvas.draw()

    image = np.fromstring(fig.canvas.tostring_rgb(), dtype=np.uint8, sep='')
    image = image.reshape(fig.canvas.get_width_height()[::-1] + (3,))

    screen.update(image)

#screen.close()
