# Smart-Agriculture-System
A fully automated agriculture system that waters plants automatically when necessary while monitoring the water supply and making sure it is sufficient at all times; alarming the system’s user if something goes wrong through the utilisation of buzzers/LED lights.
# Components Used #
* DE-10 Lite Fpga
* Arduino Mega 2560
* 7-Segment Display
* Breadboard
* Water Level Sensor
* Soil Moisture Sensor
* Buzzer
* Water Pump
# Main Idea and Operations #
The project is attempting to represent a fully
automated agriculture system that waters plants
automatically when necessary while monitoring the
water supply and making sure it is sufficient at all
times; alarming the system’s user if something goes
wrong through the utilisation of buzzers/LED lights.
If the soil moisture sensor detects lack of plant
hydration,it activates an LED light as well as the
water pump if the water supply is sufficient . If the
water level detection sensor detects lack of water
supply, it activates a buzzer. A water pump placed
inside the water tank activates on command by the
soil moisture sensor to hydrate the plant when
necessary as long as the water supply is sufficient.
FPGA’s on-board 7-segment display displays
numbers corresponding to each mode of activity the
system is currently operating at. The number ‘ 1’
when displayed means that plants have sufficient
water and that there is sufficient water supply if
needed. ‘ 2’ means that the soil needs water, ‘ 3’
means that water supply is insufficient and ‘ 4’ means
that the plants need water and water supply is
insufficient, both at once.
# Component Details #
* Arduino: Acts as power supply, ground and converter from analog to digital. 
* Water level sensor: vcc and ground pins attached to breadboard and connected to arduino board in their respective ports (vcc to 3.3v, ground to GND). Analog out pin connected to an analog port on the arduino (A0). Arduino code was utilised to make a digital arduino port (D7) active high if a signal is detected on the analog port (When the sensor is active). A wire is connected from D7 to Arduino_IO0 on the FPGA. 
* Soil Moisture sensor: vcc and ground pins attached to breadboard and connected to arduino board in their respective ports (vcc to 3.3v, ground to GND). Digital out pin connected to GPIO_ [35] pin on the FPGA. Buzzer: the ‘ +’ i s connected to GPIO_ [29] while the ‘-’ i s connected to GND on the arduino. 
* Water Pump: the ‘ +’ is connected to D5 on the arduino while the ‘ -’ is connected to GND on the arduino. Arduino D6 connected to FPGA’s Arduino_IO1 as a j unction between the FPGA and the pump.
# Wiring #
![image](https://user-images.githubusercontent.com/93269352/151236264-6b251221-3ac6-49d8-97bb-61cf1353eed9.png)
