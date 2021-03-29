import Foundation

class SensorAngle: Sensor
{
    private var x: Int = 0
    private var y: Int = 0
    private var z: Int = 0
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,x : Int , y : Int, z : Int,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.x = x
        self.y = y
        self.z = z
    }
    
    func getX()-> Int
    {
        return x
    }
    
    func getY()-> Int
    {
        return y
    }
    func getZ()-> Int
    {
        return z
    }
    
    override func ExecuterCommmande()
    {
        print("commande executer")
    }
}
