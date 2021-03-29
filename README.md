[![Coverage Status](https://coveralls.io/repos/github/elaInnovation/Android-Blue-Tool-Box/badge.svg?branch=master)](https://coveralls.io/github/elaInnovation/Android-Blue-Tool-Box?branch=master)
[![Build Status](https://travis-ci.com/elaInnovation/Android-Blue-Tool-Box.svg?branch=master)](https://travis-ci.com/elaInnovation/Android-Blue-Tool-Box)

# iOS-Blue-Tool-Box
This repository is a sample for an iOS application to scan and connect to ELA Tags.provide by ELA Innovation Company. You can directly clone this project from Github. This project contains the code of a simple app to manage Bluetooth scanner for your mobile project and use Gatt and Services to use the connected mode from our Bluetooth tag. You can found the app on the Apple Store : link_available_later 



# Build
Before starting, please download Xcode(version >= 12.4)  and install it. Then, to build the application, open the solution file using Xcode and generate the solution. You can use your own phone. Don't forget to set a team for work on the application.

## Requirements
This app is build for Apple 8 and above. Note that this app could not work on old phones. The phone must support BLE.
Only ELA BLE tags form ELA Innovation can work, other BLE devices will be not recognized by the app

## Code
### Scanner BLE
To start the Scanner, you have to get the BLE adapter of your phone and handle this. You also have to intent this to get event from the adapter. To use the ELA scanner don't forget to instantiate the adapter to the BlueScanner instance.

```swift
func initializeScanner()
{
    centralManager = CBCentralManager(delegate: self, queue: nil)
}
```


### Connect
To connect to an ELA Innovation Tag, you need to know the target tag. Then, you can create use the instance of BlueScanner and the conenct function to connect to the tag. 

not_avaible_now

After connection you have access to some commands to enable or disable LED, BUZZER or some other stuffs. An exemple below to power on the LED on the tag.

not_available_now

When all operations is finished, disconnect from the tag with the disconnect method from BlueScanner

not_available_now

### Sensors values
To decode advertising values from our tags, a couple of functions are in the tag factory. You can access them on the BleFactory file. Here, is an example of a BLUE tag Temperature.

```swift

else if(sensorData![CBUUID(string: "2A6E")] != nil)
{
    let temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
    
    var battery : Int = -1
    if(sensorData![CBUUID(string: "180F")] != nil)
    {
        let temperatureStrBattery =  sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast().description
        battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(temperatureStrBattery!))
    }
    if(sensorData![CBUUID(string: "2A19")] != nil)
    {
        let temperatureStrBattery =  sensorData![CBUUID(string: "2A19")]?.debugDescription.dropFirst().dropLast().description
        battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(temperatureStrBattery!))
    }
    id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperature, name: tagname, RSSI: Int(truncating: tagRSSI),batterylevel: battery,temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)),identifier: tagidentifier)
}

```


<br />
<br />




### Sample picture of application for temperature : 





<br />
<br />
<br />
<br />




<p  align="center">
  <img src="https://github.com/elaInnovation/iOS-Blue-Tool-Box/blob/prod/picture/temp.png" width="350" title="temperature graph">
</p>


