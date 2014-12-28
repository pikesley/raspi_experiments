import RPi.GPIO as GPIO  
import time  

interval = 0.05

def flash(pin):
  GPIO.output(pin,GPIO.HIGH)  
  time.sleep(interval) 
  GPIO.output(pin,GPIO.LOW)  

GPIO.setmode(GPIO.BCM)  

pins = [23, 24, 25]
for pin in pins:
  GPIO.setup(pin, GPIO.OUT)  

for i in range(0, 1000):
  for pin in pins:
    flash(pin)

GPIO.cleanup()   
