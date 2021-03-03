import Foundation
import CoreBluetooth


class SensorFactory
{
    private var dictionnarySensor : [String : Sensor] = [:]
    
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
    
    
    /**
     * \fn returnDictionnary
     * \brief returndictionnary
     * \param none
     * \return Dtictionnaire
     */
    
    func returnDtictionnary()->  Dictionary<String,Sensor>
    {
        return dictionnarySensor
    }
    
    
    /**
     * \fn printDictionnary
     * \brief print dictionnary of sensor
     * \param [in] dictionnarySensor: dictionnary of sensor
     * \return Dtictionnaire
     */
    
    func printDtictionnary()
    {
        for (key) in dictionnarySensor {
            print("la valeur du dico " + " \(key)")
        }
    }
    
    
    
    
    
    /**
     * \fn updateDictionnary
     * \brief add Sensor to dictionnary
     * \param [in] identifier: similar to mac adress Sensor: capteur de temperature dictionnarySensor: dictionnary of sensor
     * \return Dtictionnaire
     */
    
    func updateDtictionnary(tagidentifier : String,sensor : Sensor)
    {
        
        
        
        dictionnarySensor.updateValue(sensor, forKey: tagidentifier)
        
        
    }
    
    
    
    /**
     * \fn addDictionnary
     * \brief add Sensor to dictionnary
     * \param [in] identifier: similar to mac adress Sensor: capteur de temperature dictionnarySensor: dictionnary of sensor
     * \return Dtictionnaire
     */
    
    func addDtictionnary(tagidentifier : String,sensor : Sensor)
    {
        
        
        if(sensor is SensorMove)
        {
            if let mov = sensor as? SensorMove
            {
                dictionnarySensor[tagidentifier] = mov
            }
        }
        
        
        else if(sensor is SensorAngle)
        {
            if let angle = sensor as? SensorAngle
            {
                dictionnarySensor[tagidentifier] = angle
                
            }
        }
        
        else if(sensor is SensorTemperature)
        {
            if let tempfloat = sensor as? SensorTemperature
            {
                dictionnarySensor[tagidentifier] = tempfloat
                
            }
        }
        
        
        else if(sensor is SensorTemperatureHumidity)
        {
            if let humidity = sensor as? SensorTemperatureHumidity
            {
                dictionnarySensor[tagidentifier] = humidity
                
            }
        }
        
        
        
        else if(sensor is SensorMagnetic)
        {
            if let magnetic = sensor as? SensorMagnetic
            {
                dictionnarySensor[tagidentifier] = magnetic
                
            }
        }
        
    }
    
    /**
     * \fn getDataSensor
     * \brief get data of sensor
     * \param [in] identifier: similar to mac adress Sensor: capteur de temperature dictionnarySensor: dictionnary of sensor
     * \return void
     */
    
    func getDataSensor(id: Sensor)
    {
        if(id is SensorMove)
        {
            if let mov = id as? SensorMove
            {
                print("nbr pas : " + String(mov.getNbrPas()))
                print("nbr pas : " + String(mov.batterylevel))
            }
        }
        
        if(id is SensorAngle)
        {
            if let angle = id as? SensorAngle
            {
                print("Angle x : " + String(angle.getX()))
                print("Angle y: " + String(angle.getY()))
                print("Angle z: " + String(angle.getZ()))
                print("battery : "+String(angle.batterylevel))
                
            }
        }
        
        else if(id is SensorTemperature)
        {
            if let tempfloat = id as? SensorTemperature
            {
                print("My temperature found : " + String(tempfloat.getTemp()))
                print("My battery found : " + String(tempfloat.getBatterie()))
                
            }
        }
        
        
        
        
        else if(id is SensorTemperatureHumidity)
        {
            if let humidity = id as? SensorTemperatureHumidity
            {
                print("My temperature found : " + String(humidity.getTemp()))
                print("My humidity found : " + String(humidity.getHum()))
                print("My battery found : " + String(humidity.getBatterie()))
                
            }
        }
        
        
        
        else if(id is SensorMagnetic)
        {
            if let magnetic = id as? SensorMagnetic
            {
                print("Magnetic nbr aimant : " + String(magnetic.getNbrObject()))
                print("Etat magnetic : " + String(magnetic.getEtat()))
                print("Magnetic battery" + String(magnetic.batterylevel))
                
            }
        }
        
        
        
        
        
        
        
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
            let data = sensorData![CBUUID(string: "2A3F")]?.debugDescription.dropFirst().dropLast()
            var battery : Int = -1
            //
            if(sensorData![CBUUID(string: "180F")] != nil)
            {
                let tempStrBattery : String? = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(tempStrBattery!))
            }
            if(sensorData![CBUUID(string: "2A19")] != nil)
            {
                let tempStrBattery : String? = sensorData![CBUUID(string: "2A19")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(tempStrBattery!))
            }
            
            if(String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "1")
            {
                id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMove, name: tagname , RSSI: Int(truncating: tagRSSI),batterylevel: battery, nbrPas: ConvertionToolbox.ConvertMagnetique1(str: String(counter!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: String(counter!)),identifier: tagidentifier)
            }
            else if (String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "0")
            {
                id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: tagname , RSSI: Int(truncating: tagRSSI), batterylevel: battery, nbrObjet: ConvertionToolbox.ConvertMagnetique1(str: String(counter!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: String(counter!)), identifier: tagidentifier)
            }
        }
        else if(sensorData![CBUUID(string: "2AA1")] != nil)
        {
            let ang = sensorData![CBUUID(string: "2AA1")]?.debugDescription.dropFirst().dropLast()
            var battery : Int = -1
            if(sensorData![CBUUID(string: "180F")] != nil)
            {
                let angleStrBattery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(angleStrBattery!))
            }
            
            if(sensorData![CBUUID(string: "2A19")] != nil)
            {
                let angleStrBattery = sensorData![CBUUID(string: "2A19")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(angleStrBattery!))
            }
            id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: tagname, RSSI: Int(truncating: tagRSSI),batterylevel: battery,  x: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 0))), y: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 4))), z: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 9))),identifier: tagidentifier)
            
        }
        
        
        else if(sensorData![CBUUID(string: "2A6E")] != nil && sensorData![CBUUID(string: "2A6F")] != nil)
        {
            let temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
            let hum = sensorData![CBUUID(string: "2A6F")]?.debugDescription.dropFirst().dropLast()
            let temperature = SensorTemperature(name: tagname, RSSI: Int(truncating: tagRSSI), sensorTypes: .SensorTemperature, temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)),identifier: tagidentifier)
            var battery : Int = -1
            if(sensorData![CBUUID(string: "180F")] != nil)
            {
                let RHTstrBattery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(RHTstrBattery!))
            }
            
            if(sensorData![CBUUID(string: "2A19")] != nil)
            {
                let RHTstrBattery = sensorData![CBUUID(string: "2A19")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(RHTstrBattery!))
            }
            id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: tagname, RSSI: Int(truncating: tagRSSI),batterylevel: battery,  humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature,identifier: tagidentifier)
            
            
            
        }
        else if(sensorData![CBUUID(string: "2A6E")] != nil)
        {
            let temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
            
            var battery : Int = -1
            if(sensorData![CBUUID(string: "180F")] != nil)
            {
                let temperatureStrBattery =  sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(temperatureStrBattery!))
            }
            if(sensorData![CBUUID(string: "2A19")] != nil)
            {
                let temperatureStrBattery =  sensorData![CBUUID(string: "2A19")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(temperatureStrBattery!))
            }
            id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperature, name: tagname, RSSI: Int(truncating: tagRSSI),batterylevel: battery,temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)),identifier: tagidentifier)
        }
        else if(tagname != "") {
            
            var battery : Int = -1
            if(sensorData![CBUUID(string: "180F")] != nil)
            {
                let temperatureStrBattery =  sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(temperatureStrBattery!))
            }
            if(sensorData![CBUUID(string: "2A19")] != nil)
            {
                let temperatureStrBattery =  sensorData![CBUUID(string: "2A19")]?.debugDescription.dropFirst().dropLast().description
                battery = ConvertionToolbox.ConvertAdvertisingValue(str: String(temperatureStrBattery!))
            }
            
            id = SensorFactory.shared().getSensorID(sensorTypes: .SensorID, name: tagname, RSSI: Int(truncating: tagRSSI),batterylevel: battery ,identifier: tagidentifier)
        }
        
        return id
    }
}


