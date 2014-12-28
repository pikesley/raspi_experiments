import RPi.GPIO as GPIO  
import time  
import random  

interval = 0.01

def flash(pin):
  GPIO.output(pin,GPIO.HIGH)  
  time.sleep(random.random() * interval) 
  GPIO.output(pin,GPIO.LOW)  

GPIO.setmode(GPIO.BCM)  

pins = [23, 24, 25]
for pin in pins:
  GPIO.setup(pin, GPIO.OUT)  

for i in range(0, 10000):
#  for pin in pins:
  flash(random.choice(pins))

GPIO.cleanup()   
