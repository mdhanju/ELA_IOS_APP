//
//  sendScanner.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 23/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import Foundation

import UIKit
import CoreBluetooth

import os.log
class sendScanner: NSObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    
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
   
    // https://community.purplegiraffe.fr/t/se-connecter-en-bluetooth-pour-echanger-des-donnees/665
    
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
    
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        os_log("Connected %@", peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        os_log("Failed %@", peripheral)
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
            
            if(peripheral.name == "P MAG C003F5")
            {
                centralManager.stopScan()
                os_log("Connecting to peripheral %@", peripheral)
           
                centralManager.connect(peripheral, options: nil)
                
                os_log("Connecting to peripheral %@", peripheral)
                
                peripheral.discoverServices([ParticlePeripheral.uartRx])
            }
            
                
           
                // And finally, connect to the peripheral.
           //     os_log("Connecting to perhiperal %@", peripheral)
            //    centralManager.connect(peripheral, options: nil)
           
            
         
            
            
            
            
            //      os_log("Connecting to peripheral %@", peripheral)
            
            
            
            
            
       

            
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
