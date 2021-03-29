import Foundation

/**
 * \class SensorTemperature
 * \brief declaration of the temperature sensor
 */
class SensorTemperature: Sensor
{
    private var temperature : Float = 0.0
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,temperature : Float,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.temperature = temperature
    }
    

    
    func getTemp()->Float
    {
        return temperature
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
