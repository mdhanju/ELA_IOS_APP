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
    var idenfitfier : String { get set }
    
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
    var idenfitfier: String = ""
 
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,identifier : String) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.idenfitfier = identifier
   
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
    var idenfitfier: String = ""
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,temperature : Float,identifier : String) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.temperature = temperature
           self.idenfitfier = identifier
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
    var idenfitfier: String = ""
   
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,temperature : SensorTemperature,humidity : Int,identifier : String) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
        self.temperature = temperature.getTemp()
        self.humidity = humidity
        self.idenfitfier = identifier
          
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
  var idenfitfier: String = ""
    
  
  
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,nbrPas : Int,etat : Bool,identifier : String) {
         self.name = name
         self.RSSI = RSSI
         self.batterylevel = batterylevel
         self.sensorTypes = sensorTypes
         self.nbrPas = nbrPas
         self.etat = etat
        self.idenfitfier = identifier
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
 var idenfitfier: String = ""
      
    
    
      init(name : String,RSSI : Int,batterylevel : Int,sensorTypes: SensorTypes,nbrObjet : Int,etat : Bool,identifier: String) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.nbrObjet = nbrObjet
           self.etat = etat
           self.idenfitfier = identifier
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
  var idenfitfier: String = ""
    
    
  
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,x : Int , y : Int, z : Int,identifier : String) {
         self.name = name
         self.RSSI = RSSI
         self.batterylevel = batterylevel
         self.sensorTypes = sensorTypes
         self.x = x
         self.y = y
         self.z = z
         self.idenfitfier = identifier
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
    var idenfitfier: String = ""
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,NID : String,BID : String,identifier : String) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.NID = NID
           self.BID = BID
           self.idenfitfier = identifier
  
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
    var idenfitfier: String = ""
    
    init(name : String,RSSI : Int,batterylevel : Int = -1, sensorTypes: SensorTypes ,UUID: String,minor : Int ,major : Int,identifier : String) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.UUID=UUID
           self.minor = minor
           self.major = major
           self.idenfitfier = identifier
        
          
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

    func getSensorID(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1, identifier : String)->Sensor
        {
            return SensorID(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes : sensorTypes, identifier: identifier)
        }

        func getSensorTemperature(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,
            temperature : Float = -1,identifier: String)->Sensor
            {
             return SensorTemperature(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes : sensorTypes,temperature : temperature,identifier: identifier)
            }
        func getSensorTemperatureHumidity(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,humidity :Int = -1,objectTemperature : SensorTemperature? = nil,identifier: String)->Sensor
         {
            return SensorTemperatureHumidity(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes : sensorTypes,temperature : objectTemperature! ,humidity : humidity,identifier: identifier)
         }
        func getSensorMove(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,nbrPas : Int = 0,etat : Bool = false,identifier: String)->Sensor
         {
            return SensorMove(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes : sensorTypes,nbrPas : nbrPas, etat : etat,identifier: identifier)
         }
         func getSensorMagnetic(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,nbrObjet : Int = 0,etat : Bool = false,identifier: String)->Sensor
         {
             return SensorMagnetic(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes: sensorTypes,nbrObjet : nbrObjet,etat : etat,identifier: identifier)
         }

        func getSensorAngle(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,x : Int = 0, y : Int = 0, z : Int = 0,identifier: String)->Sensor
        {
            return SensorAngle(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes: sensorTypes,x : x , y : y, z : z,identifier: identifier)
        }
    func getSensorEdystone(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,NID : String = "", BID : String = "",identifier : String)->Sensor
        {
            return SensorEdystone(name : name,RSSI : RSSI,batterylevel : batterylevel,sensorTypes: sensorTypes,NID : NID,BID : BID, identifier: identifier)
        }

    func getSensorIbeacon(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,UUID : String = "", minor : Int = 0,major : Int = 0,identifier : String)->Sensor
        {
             return SensorIbeacon(name : name,RSSI : RSSI,batterylevel : batterylevel ,sensorTypes: sensorTypes , UUID: UUID,minor : minor ,major : major, identifier: identifier)
        }

  
 
}

// run
let id = SensorFactory.shared().getSensorID(sensorTypes: .SensorTemperature,name : "tes", RSSI : 2,identifier: "ddddd")
