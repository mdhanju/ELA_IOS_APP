
import Foundation

class SensorEdystone: Sensor
{
    private var NID : String = ""
    private var BID : String = ""
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,NID : String,BID : String,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.NID = NID
        self.BID = BID
    }
    
    
    override func ExecuterCommmande()
    {
        print("commande executer")
    }
}
