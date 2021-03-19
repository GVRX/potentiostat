"""
iorodeo-potentiostat
---------------------

Python interface to LTU Electrocheminiluminescence(ECL)/Potentiometer  Shield for the teensy 3.6 development 
board.  Based upon the IO Rodeostat potentiometer (Will Dickson, http://stuff.iorodeo.com/docs/potentiostat).


"""
from setuptools import setup, find_packages
from os import path

here = path.abspath(path.dirname(__file__))

setup(
    name='eclometer',
    version='0.0.1',
    description='ECLometer serial interface, CLI and GUI app.',
    long_description=__doc__,
    url='https://bitbucket.org/iorodeo/potentiostat',
    author='Grant van Riessen  et al.',
    author_email='g.vanriessen@latrobe.edu.au',
    license='MIT',

    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'Intended Audience :: Science/Research',
        'Topic :: Scientific/Engineering :: Chemistry',
        'Topic :: Software Development :: Libraries',
        'Topic :: Software Development :: Libraries :: Python Modules',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',#added gvr
        'Programming Language :: Python :: 3.8',#added gvr
        'Programming Language :: Python :: 3.9',#added gvr
        'Operating System :: POSIX', 
        'Operating System :: Microsoft :: Windows', 
        'Operating System :: MacOS :: MacOS X',
    ],

    keywords='ECL ECLometer potentiostat' ,
    packages=find_packages(exclude=['docs', 'tests']),

    install_requires=['pyserial',
                      'progressbar33',
                      'argparse',
                      'json-python-module',  #added gvr
                      'json_tricks',    #added gvr
                      'drawnow',  #added gvr
                      'matplotlib',  #added gvr
                      'numpy',  #added gvr
                      'gooey',  #added gvr
                      'pylab',  #added gvr
                      'matplotlib'  #added gvr
                      ],
)
