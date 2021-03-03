import Foundation


class SensorTemperatureHumidity: Sensor
{
    private var temperature: Float = 0
    private var humidity: Int = 0
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,temperature : SensorTemperature,humidity : Int,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.temperature = temperature.getTemp()
        self.humidity = humidity
    }
    
    func getTemp()->Float
    {
        return temperature
    }
    
    func getHum()->Int
    {
        return humidity
    }
    
    func getBatterie()->Int
    {
        return batterylevel
    }
    
    override func ExecuterCommmande()
    {
        print("commande executer")
    }
}
