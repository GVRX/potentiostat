# complete implementation of script found in test/test.py
from pylab import *
from drawnow import drawnow, figure
# if global namespace, import plt.figure before drawnow.figure

def getData(    l = 100):

    data = {'t': np.random.randn(l), 
        'i': np.random.randn(l),
        'v': np.random.randn(l),
        'l': np.random.randn(l)}
    return data

class liveplot():
     
    def __init__(self,data):
        self.data=data
    
    def draw_fig(self):
        
        subplot(1, 2, 1)
        plot(self.data['t'],self.data['i'])

        subplot(1, 2, 2)
        plot(self.data['t'],self.data['l'])
        #show()

a = liveplot(getData())

figure(figsize=(7, 7/2))
for k in range(100):
    a.data = getData()
    drawnow(a.draw_fig, stop_on_close=True)