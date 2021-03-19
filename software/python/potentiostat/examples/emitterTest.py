import numpy as np
from matplotlib.lines import Line2D
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import time 
from multiprocessing import Process




def test():
    plt.ion()
    fig, ax = plt.subplots()
    plt.draw()
    plt.pause(0.001)
    scope = Scope(ax,getData(),append=True)

    scope.animate(fig)
    #plt.ion()
    plt.draw()
    plt.pause(0.001)
    #plt.show()#block=False)
    #plt.pause(0.01)
    print('control?')

def getData(    l = 100):

    data = {'t': np.random.randn(l), 
        'i': np.random.randn(l),
        'v': np.random.randn(l),
        'l': np.random.randn(l)}
    return data


class Scope:
    def __init__(self, ax, data, 
                minx=None, maxx=None, 
                miny=None, maxy=None, 
                dt=0.02,
                append=False,
                xlab = 'time (s)',
                ylab = 'SIGNAL'):
        self.ax = ax
        self.dt = dt
        self.data = data
        self.append=append
        self.xlab = xlab
        self.ylab = ylab

        if minx: 
            self.minxx
        else:
            self.minx = np.min(self.data['i'])

        if maxx: 
            self.maxx = maxx
        else:
            self.maxx = np.max(self.data['i'])

        if miny: 
            self.minxy
        else:
            self.miny = np.min(self.data['i'])

        if maxx: 
            self.maxy = maxy
        else:
            self.maxy = np.max(self.data['i'])


        self.line = Line2D(self.data['t'],self.data['i'])

        self.ax.add_line(self.line)
        #self.ax.set_ylim(-.1, 1.1)
        self.ax.set_xlim(self.minx, self.maxx)

        self.ax.set_xlabel(xlab)
        self.ax.set_ylabel(ylab)
    
    def appendData(self,ndata):
        for key in ndata.keys():
            
            self.data[key] = np.concatenate((self.data[key],ndata[key]))

    def replaceData(self,ndata):
        self.data = ndata
        #print (self.data)
    
    def update(self, data):
        if self.append:
            self.appendData(data)
        else:
            self.replaceData(data)
        
        xlimChanged = False
        if np.max(self.data['t']) > self.maxx:
            self.maxx = np.max(self.data['t'])
            xlimChanged=True
        if np.min(self.data['t']) < self.minx:
            self.minx = np.min(self.data['t'])
            xlimChanged=True
        if xlimChanged == True:    
            self.ax.set_xlim(self.minx, self.maxx)   

        ylimChanged = False
        if np.max(self.data['i']) > self.maxy:
            self.maxy = np.max(self.data['i'])
            ylimChanged=True
        if np.min(self.data['i']) < self.miny:
            self.miny = np.min(self.data['i'])
            ylimChanged=True
        if ylimChanged == True:    
            self.ax.set_ylim(self.miny, self.maxy)       

        self.line.set_data(self.data['t'],self.data['i'])
        return self.line,


    def emitter(self):  #for testing
        while True:
                data=getData()
                #data = self.data
                time.sleep(0.1)
                yield data

    def animate(self,fig):
            # pass a generator in "emitter" to produce data for the update func
            ani = animation.FuncAnimation(fig, self.update, self.emitter, interval=self.dt, 
                                        blit=True)




if __name__ == '__main__':
     test()
     print('control?')