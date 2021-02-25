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
    
    public func getName()->String
    {
        return name
    }
    
    /* \brief function execute command **/
    func ExecuterCommmande() {
        
    }
}

enum SensorTypes
{
    
    case SensorEdystone
    case SensorIbeacon
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


class SensorTemperatureHumidity: Sensor
{
    private var temperature: Float = 0
    private var humidity: Int = 0
    
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
    private var nbrPas: Int = 0
    private var etat : Bool = false
    
    init(name : String,RSSI : Int,batterylevel : Int = -1,sensorTypes: SensorTypes,nbrPas : Int,etat : Bool = true,identifier : String) {
        super.init(name:name, RSSI:RSSI, batterylevel:batterylevel, sensorTypes:sensorTypes, identifier: identifier)
        self.nbrPas = nbrPas
        self.etat = etat
    }
    
    func getNbrPas()-> Int
    {
      return nbrPas
    }
    
    func getEtat()-> Bool
    {
      return etat
    }
    
    override  func ExecuterCommmande()
    {
        print("commande executer")
    }
}

class SensorMagnetic: Sensor
{
    private var nbrObjet: Int = 0
    private var etat : Bool = false
    
    
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
                id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMove, name: tagname , RSSI: Int(truncating: tagRSSI),batterylevel: battery, nbrPas: ConvertionToolbox.ConvertMagnetique1(str: String(data!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: String(counter!)),identifier: tagidentifier)
            }
            else if (String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "0")
            {
                id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: tagname , RSSI: Int(truncating: tagRSSI), batterylevel: battery, nbrObjet: ConvertionToolbox.ConvertMagnetique1(str: String(data!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: String(counter!)), identifier: tagidentifier)
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
        else {
            
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


