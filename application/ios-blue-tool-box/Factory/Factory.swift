//
//  Factory.swift
//  burger
//
//  Created by ELA Innovation on 15/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import Foundation
import CoreBluetooth

/**
 * \class Sensor
 * \brief base object for all sensors
 */
class Sensor
{
    var name : String = ""
    var RSSI : Int = 0
    var batterylevel: Int = 0
    var sensorTypes : SensorTypes = SensorTypes.SensorID
    var idenfitfier : String = ""
    
    /* \brief constructor **/
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,identifier : String) {
           self.name = name
           self.RSSI = RSSI
           self.batterylevel = batterylevel
           self.sensorTypes = sensorTypes
           self.idenfitfier = identifier
    }
    
    /* \brief function execute command **/
    func ExecuterCommmande() {
        
    }
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

/**
* \class SensorID
* \brief declaration of the identification sensor
*/
class SensorID: Sensor
{
    override func ExecuterCommmande()
    {
        print("commande executer")
    }
}

/**
* \class SensorTemperature
* \brief declaration of the temperature sensor
*/
class SensorTemperature: Sensor
{
    var temperature : Float = 0.0
    
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


class SensorTemperatureHumidity: Sensor
{
    var temperature: Float = 0
    var humidity: Int = 0
    
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

class SensorMove: Sensor
{
    var nbrPas: Int = 0
    var etat : Bool = false
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,nbrPas : Int,etat : Bool,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.nbrPas = nbrPas
        self.etat = etat
    }
    
    override  func ExecuterCommmande()
    {
        print("commande executer")
    }
}

class SensorMagnetic: Sensor
{
    var nbrObjet: Int = 0
    var etat : Bool = false
    
    init(name : String,RSSI : Int,batterylevel : Int,sensorTypes: SensorTypes,nbrObjet : Int,etat : Bool,identifier: String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
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
    
    override func ExecuterCommmande()
    {
        print("commande executer")
    }
}

class SensorAngle: Sensor
{
    var x: Int = 0
    var y: Int = 0
    var z: Int = 0
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,x : Int , y : Int, z : Int,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.x = x
        self.y = y
        self.z = z
    }
    
    override func ExecuterCommmande()
    {
        print("commande executer")
    }
}

class SensorEdystone: Sensor
{
    var NID : String = ""
    var BID : String = ""
    
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

class SensorIbeacon: Sensor
{
    var UUID: String = ""
    var minor: Int = 0
    var major : Int = 0
    
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

class SensorFactory
{
    private static var sharedSensorFactory = SensorFactory()
    class func shared() -> SensorFactory {
        return sharedSensorFactory
    }
    
    /**
     * \fn get
     * \brief getter on the object type according to the sensorData as input
     * \param [in] sensorData : dictionnary of data containning bluetooth short UUID and data to decode
     * \return Sensor object typed
     */
    func get(sensorData : Dictionary<CBUUID,NSData>?, tagname : String, tagRSSI : NSNumber, tagidentifier : String) -> Sensor?
    {
        var id : Sensor? = nil
        
        //MARK:: move avec batterie
        if( sensorData![CBUUID(string: "2A3F")] != nil
            && sensorData![CBUUID(string: "2A06")] != nil)
        {
            let counter = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
            let etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
            var battery : String? = nil
            //
            if(sensorData![CBUUID(string: "180F")] != nil)
            {
                battery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast().description
            }
            //
            if(String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "1")
            {
                id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMagnetic, name: tagname ?? "", RSSI: Int(truncating: tagRSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(battery!)), nbrPas: ConvertionToolbox.ConvertAdvertisingValue(str: String(counter!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: etat),identifier: tagidentifier)
            }
            else if (String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "0")
            {
                
            }
            else if (String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "2")
            {
                
            }
        }
       /*
        if(sensorData![CBUUID(string: "180F")] != nil && sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "1")
        {
            let move = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
            let etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
            let battery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
            if(move != nil && etat != "" && battery != nil)
            {
                let id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(battery!)), nbrPas: ConvertionToolbox.ConvertAdvertisingValue(str: String(move!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: etat),identifier: peripheral.identifier.description)
                
                print("MOVE found !!!!!!!!!!")
                if(id is SensorMove)
                {
                    if let mov = id as? SensorMove
                    {
                        print("nbr pas : " + String(mov.nbrPas))
                        print("nbr pas : " + String(mov.batterylevel))
                        arraySensorMove[peripheral.identifier.description] = mov
                    }
                }
            }
        }
        //MARK:: move sans batterie
        else if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "1")
        {
            
            
            let move = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
            let etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
            
            if(move != nil && etat != "")
            {
                let id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(truncating: RSSI), nbrPas: ConvertionToolbox.ConvertAdvertisingValue(str: String(move!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: etat),identifier: peripheral.identifier.description)
                
                
                
                print("move found with battery !!!!!!!!!!")
                if(id is SensorMove)
                {
                    
                    if let mov = id as? SensorMove
                    {
                        print("nbr pas : " + String(mov.nbrPas))
                        arraySensorMove[peripheral.identifier.description] = mov
                        
                    }
                }
                
            }
        }
        */
        return id
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
    func getSensorTemperatureHumidity(sensorTypes : SensorTypes,name : String,RSSI : Int, batterylevel : Int = -1,humidity :Int = -1,objectTemperature : SensorTemperature? =       nil,identifier: String)->Sensor
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
