import Foundation


public class displayObjectCharacteristic
{

 public class DisplayObject {
        
        public var name: String
        public var RSSI: Int
        public var identifier : String
        public var battery : Int
        public var typedata : SensorTypes
        public var array : [SensorCaracteristic.Cap]
        
        init(name : String, RSSI: Int, identifier : String, battery : Int, typedata : SensorTypes,array : [SensorCaracteristic.Cap] = [SensorCaracteristic.Cap.init()])
        {
            self.name = name
            self.RSSI = RSSI
            self.identifier = identifier
            self.battery = battery
            self.typedata = typedata
            self.array = array
        }
        
        
        public func addData(data : SensorCaracteristic.Cap)
        {
            self.array.append(data)
            if(self.array.count > 20)
            {
                self.array.remove(at: 0)
            }
        }
    }
}
