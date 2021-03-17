from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    port = '/dev/tty.usbmodem65156601' #'/dev/ttyACM0'

dev = Potentiostat(port)

version = dev.get_firmware_version()
print('firmware version: ', version)
