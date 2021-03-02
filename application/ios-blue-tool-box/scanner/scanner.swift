import UIKit
import CoreBluetooth

import os.log
class Scanner1: NSObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    var myCharacteristic : CBCharacteristic!
    
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    // MARK: Identifier unique similar as mac adress
    private var identifier: [String] = []
    
    // MARK: Dictionnary who stock sensor
    public var dictionnarySensor : Event<([String : Sensor])>
    
    // MARK:
    private var sensorTypeFiler : SensorTypes? = nil
    
    
    
    override init()
    {
        dictionnarySensor = Event<([String : Sensor])>()
    }
    /**
     * \fn defineFilterType
     * \brief function to initialize a new scanner sensor when function initialize is call
     * \param [sensorTypes] : sensor
     * \return None
     **/
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
      //  print("Central state update")
        if central.state != .poweredOn
        {
        //    print("Central is not powered on")
        }
        else
        {
          //  print("Central scanning for", ParticlePeripheral.uartRx);
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    
    
    
    /**
     * \fn initializeScanner
     * \brief handle the result of the scan : filter type of sensor and we add dictionnary to the array
     
     **/
    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)
    {
        if(advertisementData[CBAdvertisementDataServiceDataKey] != nil)
        {
            let sensorData = advertisementData[CBAdvertisementDataServiceDataKey] as? Dictionary<CBUUID,NSData>
            
            
            
            
            
            // And finally, connect to the peripheral.
            //     os_log("Connecting to perhiperal %@", peripheral)
            //    centralManager.connect(peripheral, options: nil)
            
            //      os_log("Connecting to peripheral %@", peripheral)
            
            //  centralManager.connect(peripheral, options: nil)
            
            
            
            
            
            //      os_log("Connecting to peripheral %@", peripheral)
            
            //   peripheral.discoverServices([ParticlePeripheral.uartRx])
            
            
            
            
            
            
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



