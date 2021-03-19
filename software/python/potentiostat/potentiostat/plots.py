
'''
Provides potting functions for potentiostat

'''

import matplotlib.pyplot as plt
import numpy as np
import time
import matplotlib.animation as animation
from matplotlib.lines import Line2D
from time import sleep

from pylab import *
from drawnow import drawnow, figure
# if global namespace, import plt.figure before drawnow.figure


plt.style.use('ggplot')

fig = plt.figure()

def avgData(data,avgN=10):   #added DE. GVR moved hardcoded value to param.  TODO: replace with numpy method
    for d in ['v','i','t','l']:
        dlen = len(data[d])
        if dlen>avgN:
            for i in range(dlen-avgN):
                data[d][i] = sum(data[d][i:i+avgN])/avgN
        data[d] = data[d][:dlen-avgN]



def plotData(data, smooth=1):

    if smooth> 1:
       avgData(data,smooth) 

    if len(data['v']) == len(data['i']) == len(data['t']):
            plt.figure(1)
            plt.subplot(211)
            plt.plot(data['t'],data['v'])
            plt.ylabel('potential (V)')
            plt.grid('on')

            plt.subplot(212)
            plt.plot(data['t'],data['i'])
            plt.ylabel('current (uA)')
            plt.xlabel('time (s)')
            plt.grid('on')

            plt.figure(2)
            plt.plot(data['v'],data['i'])
            plt.xlabel('potential (V)')
            plt.ylabel('current (uA)')
            plt.grid('on')

            plt.show() #(block=False)


    if len(data['v']) == len(data['l']) == len(data['t']):
            
            plt.figure(1)
            plt.plot(data['v'],data['l'])
            plt.xlabel('potential (V)')
            plt.ylabel('photocurrent (uA)')
            plt.grid('on')
            
            plt.figure(2)
            plt.subplot(211)
            plt.plot(data['t'],data['v'])
            plt.ylabel('potential (V)')
            plt.grid('on')

            plt.subplot(212)
            plt.plot(data['t'],data['l'])
            plt.ylabel('photocurrent (a.u.)')
            plt.xlabel('time (s)')
            plt.grid('on')

            plt.pause(0.001)
            plt.ion()
            plt.show() #(block=False)

    if len(data['l']) == len(data['i']) == len(data['t']):

            plt.figure(1)
            plt.subplot(211)
            plt.plot(data['t'],data['l'])
            plt.ylabel('photocurrent (a.u.)')
            plt.grid('on')

            plt.subplot(212)
            plt.plot(data['t'],data['i'])
            plt.ylabel('current (uA)')
            plt.xlabel('time (s)')
            plt.grid('on')

            plt.figure(2)
            plt.plot(data['i'],data['l'])
            plt.xlabel('current (uA)')
            plt.ylabel('photocurrent (a.u.)')
            plt.grid('on')        

            #plt.pause(0.001)
            #plt.ion()
            plt.show() #(block=False)



class livePlot():
    
    def __init__(self,data,smooth=1):
        self.data=data
        self.smooth=smooth
    
    def draw(self):

        if self.smooth> 1:
            avgData(self.data,self.smooth) 
        data = self.data[0] # lazy - just to avoid editing below
        if len(data['v']) == len(data['i']) == len(data['t']):
                plt.figure(1)
                plt.subplot(211)
                plt.plot(data['t'],data['v'])
                plt.ylabel('potential (V)')
                plt.grid('on')

                plt.subplot(212)
                plt.plot(data['t'],data['i'])
                plt.ylabel('current (uA)')
                plt.xlabel('time (s)')
                plt.grid('on')

                plt.figure(2)
                plt.plot(data['v'],data['i'])
                plt.xlabel('potential (V)')
                plt.ylabel('current (uA)')
                plt.grid('on')

                plt.show() #(block=False)


        if len(data['v']) == len(data['l']) == len(data['t']):
                
                plt.figure(1)
                plt.plot(data['v'],data['l'])
                plt.xlabel('potential (V)')
                plt.ylabel('photocurrent (uA)')
                plt.grid('on')
                
                plt.figure(2)
                plt.subplot(211)
                plt.plot(data['t'],data['v'])
                plt.ylabel('potential (V)')
                plt.grid('on')

                plt.subplot(212)
                plt.plot(data['t'],data['l'])
                plt.ylabel('photocurrent (a.u.)')
                plt.xlabel('time (s)')
                plt.grid('on')

                plt.pause(0.001)
                plt.ion()
                plt.show() #(block=False)

        if len(data['l']) == len(data['i']) == len(data['t']):

                plt.figure(1)
                plt.subplot(211)
                plt.plot(data['t'],data['l'])
                plt.ylabel('photocurrent (a.u.)')
                plt.grid('on')

                plt.subplot(212)
                plt.plot(data['t'],data['i'])
                plt.ylabel('current (uA)')
                plt.xlabel('time (s)')
                plt.grid('on')

                plt.figure(2)
                plt.plot(data['i'],data['l'])
                plt.xlabel('current (uA)')
                plt.ylabel('photocurrent (a.u.)')
                plt.grid('on')        

                plt.pause(0.001)
                plt.ion()
                plt.show() #(block=False)

def testlivePlot():

    a = livePlot(getData())

    figure(figsize=(7, 7/2))
    for k in range(100):
        a.data = getData()
        drawnow(a.draw, stop_on_close=True)

def getData(    l = 100):
# generates test data
    data = {'t': np.random.randn(l), 
        'i': np.random.randn(l),
        'v': np.random.randn(l),
        'l': np.random.randn(l)}
    return data

def getEmptyData(    l = 100):
# generates test data
    data = {'t': np.zeros(l), 
        'i': np.zeros(l),
        'v': np.zeros(l),
        'l': np.zeros(l)}
    return data    

# class livePlot():
#     '''
#     Class for live plotting.

#     Implements a generator to yield data that may be updated
#     by calling appendData.

#     '''
#     def __init__(self,fig, ax, data,minx=None, maxx=None, interval=100) :
#         self.fig = fig
#         self.ax = ax
#         self.data=data
#         self.interval=interval
        
#         if minx: 
#             self.minxx
#         else:
#             self.minx = np.min(self.data['t'])

#         if maxx: 
#             self.maxx = maxx
#         else:
#             self.maxx = np.max(self.data['t'])

#         self.line = Line2D(self.data['t'],self.data['i'])
#         # add another?
#         self.ax.add_line(self.line)
#         self.ax.set_xlim(self.minx,self.maxx)
#         self.ax.figure.canvas.draw()

#         self.Running = False

#     def appendData(self,ndata):
#         for key in ndata.keys():
#             np.concatenate((self.data[key],ndata[key]))

#     def replaceData(self,ndata):
#         self.data = ndata
#         print (self.data)
        
#     #def emitter(self):
#     #    while self.Running is True:
#     #        yield self.data

#     #def animate(self, data, im):
#     def update(self, data):
#         limChanged = False
#         if np.max(self.data['t']) > self.maxx:
#             self.maxx = np.max(self.data['t'])
#             limChanged=True
#         if np.min(self.data['t']) < self.minx:
#             self.maxx = np.min(self.data['t'])
#             limChanged=True
#         if limChanged:    
#             self.ax.set_xlim(self.minx, self.maxx)   

#         self.line.set_data(self.data['t'],self.data['i'])
#         return self.line,

#     def stop(self):
#         self.Running = False

#     def run(self):
#         '''self.ani = animation.FuncAnimation(
#                                            self.fig, 
#                                            self.update, # the animation function
#                                            self.emitter, 
#                                            interval=self.interval, 
#                                            repeat=False, 
#                                            #fargs=(self.line ),
#                                            #blit=True,
#                                            ) '''
#         #self.fig.show()
#         #plt.ion()
#         #plt.show()
#         self.Running = True

#     def close(self):
#         plt.close(self.fig)


# def emitter():
#        while True:
#             l = 20
#             data = {'t': np.random.randn(l), 
#                 'i': np.random.randn(l),
#                 'v': np.random.randn(l),
#                 'l': np.random.randn(l)}

#             time.sleep(0.1)
#             yield data


# def testLivePlot():
#     l = 20
#     data = {'t': np.random.randn(l), 
#             'i': np.random.randn(l),
#             'v': np.random.randn(l),
#             'l': np.random.randn(l)}
    
#     fig, ax = plt.subplots()
  
#     a=livePlot(fig,ax,data,interval=1000)
#     a.run()

#     ani = animation.FuncAnimation(
#                                            fig, 
#                                            a.update, # the animation function
#                                            emitter, 
#                                            interval=a.interval, 
#                                            #repeat=False
#                                            #fargs=(self.line ),
#                                            #blit=True,
#                                            )
#     plt.show(block=False)

