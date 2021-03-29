import Foundation

class SensorIbeacon: Sensor
{
    private var UUID: String = ""
    private var minor: Int = 0
    private var major : Int = 0
    
    init(name : String,RSSI : Int,batterylevel : Int = -1, sensorTypes: SensorTypes ,UUID: String,minor : Int ,major : Int,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.UUID=UUID
        self.minor = minor
        self.major = major
    }
    
    override func ExecuterCommmande()
    {
        print("commande executer")
    }
}
