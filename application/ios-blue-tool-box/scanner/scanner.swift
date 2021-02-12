import UIKit
import CoreBluetooth


class Scanner1: NSObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    private var identifier: [String] = []
    
    public var evNewInfoAvailable: Event<(String, String)>
    public var dictionnarySensor : Event<([String : Sensor])>
    
    private var sensorTypeFiler : SensorTypes? = nil
    
    override init() {
        evNewInfoAvailable = Event<(String, String)>()
        dictionnarySensor = Event<([String : Sensor])>()

    }
    
    public func defineFilterType(sensor : SensorTypes)
    {
        self.sensorTypeFiler = sensor
    }
    
    /**
     * \fn initializeScanner
     * \brief function to initialize a new scanner and associate to a central manager object
     * \param [in] self : current isntance ..
     * \return None
     **/
    func initializeScanner()
    {
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    /**
     * \fn initializeScanner
     * \brief function to initialize a new scanner and associate to a central manager object
     * \param [in] self : current isntance ..
     * \return None
     **/
    func stopScanner()
    {
        centralManager.stopScan()
    }
    
    // If we're powered on, start scanning
    func centralManagerDidUpdateState(_ central: CBCentralManager)
    {
        print("Central state update")
        if central.state != .poweredOn
        {
            print("Central is not powered on")
        }
        else
        {
            print("Central scanning for", ParticlePeripheral.uartRx);
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    // Handles the result of the scan
    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)
    {
        
        if(peripheral.name == "P MOV B004EB")
             {
                print("trouvé")
                
            }
        
       // print(peripheral.name)
       // print(peripheral.identifier.description)
        if(peripheral.name != nil)
        {
            let data = (peripheral.name!, peripheral.identifier.description)
            evNewInfoAvailable.raise(data : data)
        }
        
        //
        if(advertisementData[CBAdvertisementDataServiceDataKey] != nil)
        {
            let sensorData = advertisementData[CBAdvertisementDataServiceDataKey] as? Dictionary<CBUUID,NSData>

            if(identifier.count <= 0)
            {
                identifier.append(peripheral.identifier.description)
            }
            else{
      
                    identifier.append(peripheral.identifier.description)
                    
                    let id = SensorFactory.shared().get(sensorData: sensorData, tagname: peripheral.name?.description ?? "", tagRSSI: RSSI, tagidentifier: peripheral.identifier.description)
               
              
                    
                    if( id != nil)
                    {

                        
                        if(nil == self.sensorTypeFiler)
                        {
                            dictionnarySensor.raise(data : [peripheral.identifier.description:id!])
                        }
                        else
                        {
                         
                            if(self.sensorTypeFiler == id?.sensorTypes)
                            {
                                dictionnarySensor.raise(data : [peripheral.identifier.description:id!])
                            }
                    }
      
                    }

                }
        }

    
    }
    
}



