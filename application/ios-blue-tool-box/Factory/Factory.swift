//
//  Factory.swift
//  burger
//
//  Created by ELA Innovation on 15/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import Foundation

protocol Sensor
{
    var name: String { get set }
    var RSSI : Int { get set }
    var batterylevel: Int { get set }
    var sensorTypes : SensorTypes { get set }
    
    func ExecuterCommmande()
  
}

enum SensorTypes
{
    case SensorIbeacon
    case SensorEdystone
    case SensorID
    case SensorTemperature
    case SensorTemperatureHumidity
    case SensorMove
    case SensorMagnetic
    case SensorAngle

 
}





class SensorID: Sensor
{

    var name: String = ""
    var RSSI: Int = 0
    var batterylevel: Int = 0
    var sensorTypes: SensorTypes
 
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
   
       }
    
 
    
    func ExecuterCommmande()
  {
      print("commande executer")
  }
}

class SensorTemperature: Sensor
{
    var name: String = ""
    var RSSI: Int = 0
    var batterylevel: Int = 0
    var sensorTypes: SensorTypes
    var temperature : Float
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,temperature : Float) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
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

    func ExecuterCommmande()
    {
        print("commande executer")
    }
}


class SensorTemperatureHumidity: Sensor
{
    var name: String = ""
    var RSSI: Int = 0
    var batterylevel: Int = 0
    var sensorTypes: SensorTypes
    var temperature: Float = 0
    var humidity: Int = 0
   
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,temperature : SensorTemperature,humidity : Int) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
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
    
     func ExecuterCommmande()
    {
        print("commande executer")
    }

}

class SensorMove: Sensor
{
  var name: String = ""
  var RSSI: Int = 0
  var batterylevel: Int = 0
  var sensorTypes: SensorTypes
  var nbrPas: Int = 0
  var etat : Bool
    
  
  
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,nbrPas : Int,etat : Bool) {
         self.name = name
         self.RSSI = RSSI
         self.batterylevel = batterylevel
         self.sensorTypes = sensorTypes
         self.nbrPas = nbrPas
         self.etat = etat
     }
    

    
     func ExecuterCommmande()
    {
        print("commande executer")
    }
  
}

class SensorMagnetic: Sensor
{
 var name: String = ""
 var RSSI: Int = 0
 var batterylevel: Int = 0
 var sensorTypes: SensorTypes
 var nbrObjet: Int = 0
 var etat : Bool
      
    
    
      init(name : String,RSSI : Int,batterylevel : Int,sensorTypes: SensorTypes,nbrObjet : Int,etat : Bool) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.nbrObjet = nbrObjet
           self.etat = etat
       }
    
    func getEtat()->Bool
    {
        return etat
    }
      
    func getNbrObject()->Int
    {
        return nbrObjet
    }
    
    

    
     func ExecuterCommmande()
    {
        print("commande executer")
    }
}

class SensorAngle: Sensor
{
  var name: String = ""
  var RSSI: Int = 0
  var batterylevel: Int = 0
  var sensorTypes: SensorTypes
  var x: Int = 0
  var y: Int = 0
  var z: Int = 0
    
    
  
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,x : Int , y : Int, z : Int) {
         self.name = name
         self.RSSI = RSSI
         self.batterylevel = batterylevel
         self.sensorTypes = sensorTypes
         self.x = x
         self.y = y
         self.z = z
     }
  

    
     func ExecuterCommmande()
    {
        print("commande executer")
    }
}

class SensorEdystone: Sensor
{
    var name: String = ""
    var RSSI: Int = 0
    var batterylevel: Int = 0
    var sensorTypes: SensorTypes
    var NID : String = ""
    var BID : String = ""
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,NID : String,BID : String) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.NID = NID
           self.BID = BID
  
       }
    

    
     func ExecuterCommmande()
    {
        print("commande executer")
    }
}

class SensorIbeacon: Sensor
{
    var name: String = ""
    var RSSI: Int = 0
    var batterylevel: Int = 0
    var sensorTypes: SensorTypes
    var UUID: String = ""
    var minor: Int = 0
    var major : Int = 0
    
    init(name : String,RSSI : Int,batterylevel : Int = -1, sensorTypes: SensorTypes ,UUID: String,minor : Int ,major : Int) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.UUID=UUID
           self.minor = minor
           self.major = major
        
          
       }
    

    
     func ExecuterCommmande()
    {
        print("commande executer")
    }
}





class SensorFactory
{
   private static var sharedSensorFactory = SensorFactory()
   class func shared() -> SensorFactory {
       return sharedSensorFactory
   }

        func getSensorID(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1)->Sensor
        {
            return SensorID(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes : sensorTypes)
        }

        func getSensorTemperature(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,
            temperature : Float = -1)->Sensor
            {
             return SensorTemperature(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes : sensorTypes,temperature : temperature)
            }
        func getSensorTemperatureHumidity(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,humidity :Int = -1,objectTemperature : SensorTemperature? = nil)->Sensor
         {
            return SensorTemperatureHumidity(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes : sensorTypes,temperature : objectTemperature! ,humidity : humidity)
         }
        func getSensorMove(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,nbrPas : Int = 0,etat : Bool = false)->Sensor
         {
            return SensorMove(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes : sensorTypes,nbrPas : nbrPas, etat : etat)
         }
         func getSensorMagnetic(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,nbrObjet : Int = 0,etat : Bool = false)->Sensor
         {
             return SensorMagnetic(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes: sensorTypes,nbrObjet : nbrObjet,etat : etat)
         }

        func getSensorAngle(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,x : Int = 0, y : Int = 0, z : Int = 0)->Sensor
        {
            return SensorAngle(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes: sensorTypes,x : x , y : y, z : z)
        }
        func getSensorEdystone(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,NID : String = "", BID : String = "")->Sensor
        {
            return SensorEdystone(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes: sensorTypes,NID : NID,BID : BID)
        }

        func getSensorIbeacon(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,UUID : String = "", minor : Int = 0,major : Int = 0)->Sensor
        {
             return SensorIbeacon(name : name,RSSI : RSSI,batterylevel : batterylevel ,sensorTypes: sensorTypes , UUID: UUID,minor : minor ,major : major)
        }

  
 
}

// run
let id = SensorFactory.shared().getSensorID(sensorTypes: .SensorTemperature,name : "tes", RSSI : 2)
