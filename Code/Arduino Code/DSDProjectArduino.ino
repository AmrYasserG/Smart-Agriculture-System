int waterSensorValue = 0;  // holds the value
int waterSensorPin = A0; // sensor pin used
int waterPumpPin = 5;
int waterPumpsignal = 6;

void setup() {
  Serial.begin(9600);
  pinMode(7, OUTPUT);    // sets the digital pin 7 as output
  pinMode(5,OUTPUT); //Set pin 5 as OUTPUT pin for pump
  pinMode(6,INPUT); //Set pin 6 as input pin, to receive pump's signail from FPGA.
}

void loop() {
  waterSensorValue = analogRead(waterSensorPin); //Read data from analog pin and store it to waterSensorValue variable
  Serial.println(waterSensorValue);
  if (waterSensorValue>300) {
  Serial.println( "HIGH"); 
  digitalWrite(7, HIGH); // sets the digital pin 13 on
  delay(1000);            // waits for a second
  }
  else {
  Serial.println( "LOW"); 
  digitalWrite(7, LOW);  // sets the digital pin 13 off
  delay(1000);            // waits for a second
  }
   Serial.println("pump  ");
  Serial.println( digitalRead(waterPumpsignal)); 
  if (digitalRead(waterPumpsignal)==1){
    
  analogWrite(waterPumpPin, 200);
}
else{
  analogWrite(waterPumpPin, 0);
}
}
