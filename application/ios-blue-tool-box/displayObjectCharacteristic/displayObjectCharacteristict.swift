import Foundation



    
    /// DisplayObject i used for store data of sensor
public class DisplayObject : Sensor{
        
     
      
    

        public var array : [displayData]
        
        init(name : String, RSSI: Int, identifier : String, battery_level : Int, typedata : SensorTypes,array : [displayData] = [displayData.init()])
        {
            
            self.array = array
            
            super.init(name: name, RSSI: RSSI, batterylevel: battery_level, sensorTypes: typedata, identifier: identifier)
            //self.typedata = typedata
            
        }
        
        
        public func addData(data : displayData)
        {
            self.array.append(data)
            if(self.array.count > 20)
            {
                self.array.remove(at: 0)
            }
        }
    }

