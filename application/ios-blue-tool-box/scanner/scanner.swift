import UIKit
import CoreBluetooth

class Scanner1: NSObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    
    private var centralManager: CBCentralManager!
    private var peripheral: CBPeripheral!
    
    /** \brief */
    private var identifier: [String] = []
    
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
    
    
    //call
    //var str1: String = "AB0A"
    //print(Conversion(str : str1))
    
    // Handles the result of the scan
    func centralManager (_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)
    {
       // print(peripheral.identifier);
        print(peripheral.name)

        if(advertisementData[CBAdvertisementDataServiceDataKey] != nil)
        {
      //  print(advertisementData[CBAdvertisementDataServiceDataKey])
         let sensorData = advertisementData[CBAdvertisementDataServiceDataKey] as? Dictionary<CBUUID,NSData>
        //   print(advertisementData[CBAdvertisementDataServiceDataKey])
           print(sensorData)
            print(advertisementData[CBAdvertisementDataServiceDataKey])
            var cpt : Int = 0
            
            
            
            if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && ConvertionToolbox.convertHexaToEtat(str: sensorData![CBUUID(string: "2A3F")]!.description) == true ){
                
                print(advertisementData[CBAdvertisementDataServiceDataKey])
                print(advertisementData.debugDescription)
                 print(peripheral.debugDescription)
                
                
                
            }
            
        
          
            if(peripheral.name?.description == "FB_T_PUCK_11_80")
            {
                print("lol")
              var test = sensorData![CBUUID(string: "180F")]!.debugDescription
              var test1 = advertisementData[CBAdvertisementDataServiceDataKey]
                print("lol1")
                var a : Int = 0;
             
     
            }
          
            
         /*   if(sensorData![CBUUID(string: "2A6F")] != nil)
                                      {
                                      print("alpha")
                                        var  a = sensorData![CBUUID(string: "2A6F")]?.debugDescription.dropFirst().dropLast()
                                        print(a!)
                                      print("beta")
                                      }
            */
            
            if(identifier.count <= 0) {
              identifier.append(peripheral.identifier.description)
            }
            else{
                if(!identifier.contains(peripheral.identifier.description))
                {
                    print("New Device = " +  peripheral.identifier.description)
                    identifier.append(peripheral.identifier.description)
 
        
                     /*
                        if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && ConvertionToolbox.convertHexaToEtat(str: sensorData![CBUUID(string: "2A3F")]!.description) == false ){
                          
                            var id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription), nbrObjet: ConvertionToolbox.convertHexaToSumExpo(str :ConvertionToolbox.hexaToBinary(str: "2A06")), etat: ConvertionToolbox.convertHexaToEtat(str: sensorData![CBUUID(string: "2A3F")]!.description))
                            
                            
                            
                            print("captuer magnétique")
                        }
                        
                        
                        
                        if(sensorData![CBUUID(string: "2A6E")] != nil && sensorData![CBUUID(string: "2A6F")] != nil && sensorData![CBUUID(string: "2A58")] != nil){
                            
                            
                            let temperature = SensorTemperature(name: peripheral.name ?? "", RSSI: Int(RSSI), sensorTypes: .SensorTemperature, temperature: Float(ConvertionToolbox.ConvertTemperature(str: sensorData![CBUUID(string: "2A58")].debugDescription)))
                                                       
                            
                            
                            var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription), humidity: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A6F")].debugDescription), objectTemperature: temperature)
                            
                            
                            
                                          }
                        
                         if(sensorData![CBUUID(string: "2A6E")] != nil && sensorData![CBUUID(string: "2A6F")] != nil){
                           
                            
                            
                              var temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                              var hum = sensorData![CBUUID(string: "2A6F")]?.debugDescription.dropFirst().dropLast()
                            var tempObjet = SensorTemperature(name: peripheral.name ?? "", RSSI: Int(RSSI), sensorTypes: .SensorTemperature, temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                            
                              print("bravo")
                              if(temp != nil)
                              {
                            
                              print("delta")
                                 // var id = SensorFactory.shared().getSensorTemperatur
                                  print("temperature  sensor found !!!!!!!!!!")
                                  if(id is SensorTemperature)
                                  {
                                      //
                                      if let tempfloat = id as? SensorTemperature {
                                          print("My RHT found : " + String(tempfloat.getTemp()))
                                      }
                                  }
                                                         
                              }
                        }
                            
                            */
                    
                    if( sensorData![CBUUID(string: "2A3F")] != nil)
                    {
                    print("ales")
                        print(  sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
                        var MarOrAng = sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()
                    print("ales1")
                    }
                    
                    
                    //MARK:: move sans batterie
                                           
                                           if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "1"){
                                                               
                                                                  // print(key)
                                                                   var mag = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
                                            var etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
                                                                   
                                               
                                                                 
                                                                   
                                                                                           
                                                                                               
                                                                   if(mag != nil && etat != nil)
                                                                   {
                                                                       
                                                                       
                                                                     //  var magnétique = SensorMagnetic(name: peripheral.name ?? "", RSSI: Int(RSSI),sensorTypes: .sensorMagnetic, nbrObjet: , etat: )
                                                                    
                                                                     //  var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                                                                       var id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(RSSI), nbrPas: ConvertionToolbox.ConvertAdvertisingValue(str: String(mag!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: etat))
                                                                   
                                                                       
                                                                       
                                                                       print("magnetic found !!!!!!!!!!")
                                                                       if(id is SensorMove)
                                                                       {
                                                                           //
                                                                           if let magnetic = id as? SensorMove {
                                                                               print("nbr pas : " + String(magnetic.nbrPas))
                                                                          
                                                                           }
                                                                       }
                                                                                              
                                                                   }
                                                               }
                                       
                    
                    
                    
                    
                    //MARK:: move avec batterie
                        
                        if(sensorData![CBUUID(string: "180F")] != nil && sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "1"){
                                            
                                               // print(key)
                                                var mag = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
                            var etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
                                                var battery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                            
                                              
                                                
                                                                        
                                                                            
                                                if(mag != nil && etat != nil && battery != nil)
                                                {
                                                    
                                                    
                                                  //  var magnétique = SensorMagnetic(name: peripheral.name ?? "", RSSI: Int(RSSI),sensorTypes: .sensorMagnetic, nbrObjet: , etat: )
                                                 
                                                  //  var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                                                    var id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(battery!)), nbrPas: ConvertionToolbox.ConvertAdvertisingValue(str: String(mag!)), etat: ConvertionToolbox.convertHexaToEtatInv(str: etat))
                                                
                                                    
                                                    
                                                    print("magnetic found !!!!!!!!!!")
                                                    if(id is SensorMove)
                                                    {
                                                        //
                                                        if let magnetic = id as? SensorMove {
                                                            print("nbr pas : " + String(magnetic.nbrPas))
                                                       
                                                        }
                                                    }
                                                                           
                                                }
                                            }
                    
                    
                    
                    //MARK::ANG avec batterie
                     
                    
                     
                     
                    if(sensorData![CBUUID(string: "2AA1")] != nil && sensorData![CBUUID(string: "180F")] != nil   ){
                                        
                                           // print(key)
                                            var ang = sensorData![CBUUID(string: "2AA1")]?.debugDescription.dropFirst().dropLast()
                                            var battery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                                     //       var etat = sensorData![CBUUID(string: "2A3F")]?.debugDescription.dropFirst().dropLast()
                        
                                          
                                            
                                                                    
                                                                        
                                            if(ang != nil && battery != nil)
                                            {
                                              //  var magnétique = SensorMagnetic(name: peripheral.name ?? "", RSSI: Int(RSSI),sensorTypes: .sensorMagnetic, nbrObjet: , etat: )
                                             
                                              //  var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                                              //  var id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(RSSI), nbrObjet: ConvertionToolbox.ConvertAdvertisingValue(str: String(mag!)), etat: ConvertionToolbox.convertHexaToEtat(str: String(etat!)))
                                                var id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: peripheral.name ?? "", RSSI: Int(RSSI),  x: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 0))), y: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 4))), z: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 9))))
                                            
                                                
                                                
                                                print("magnetic found !!!!!!!!!!")
                                                if(id is SensorAngle)
                                                {
                                                    //
                                                    if let angle = id as? SensorAngle {
                                                        print("Angle x : " + String(angle.x))
                                                        print("Angle y: " + String(angle.y))
                                                        print("Angle z: " + String(angle.z))
                                                        print("battery : "+String(angle.batterylevel))
                                                    }
                                                }
                                                                       
                                            }
                                        }
                    
                    
                    
                    
                    
                     //MARK::ANG sans batterie
                     
                     
                     
                    if(sensorData![CBUUID(string: "2AA1")] != nil  ){
                                        
                                           // print(key)
                                            var ang = sensorData![CBUUID(string: "2AA1")]?.debugDescription.dropFirst().dropLast()
                                     //       var etat = sensorData![CBUUID(string: "2A3F")]?.debugDescription.dropFirst().dropLast()
                        
                                          
                                            
                                                                    
                                                                        
                                            if(ang != nil)
                                            {
                                              //  var magnétique = SensorMagnetic(name: peripheral.name ?? "", RSSI: Int(RSSI),sensorTypes: .sensorMagnetic, nbrObjet: , etat: )
                                             
                                              //  var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                                              //  var id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(RSSI), nbrObjet: ConvertionToolbox.ConvertAdvertisingValue(str: String(mag!)), etat: ConvertionToolbox.convertHexaToEtat(str: String(etat!)))
                                                var id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: peripheral.name ?? "", RSSI: Int(RSSI),  x: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 0))), y: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 4))), z: Int(ConvertionToolbox.ConvertAngle(str: ConvertionToolbox.ANG(str: String(ang!), index: 9))))
                                            
                                                
                                                
                                                print("magnetic found !!!!!!!!!!")
                                                if(id is SensorAngle)
                                                {
                                                    //
                                                    if let angle = id as? SensorAngle {
                                                        print("Angle x : " + String(angle.x))
                                                        print("Angle y: " + String(angle.y))
                                                        print("Angle z: " + String(angle.z))
                                                    }
                                                }
                                                                       
                                            }
                                        }
                    
                    
                    
                    //MARK:: magnétique avec batterie
                    
                    if(sensorData![CBUUID(string: "180F")] != nil && sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "0" ){
                                        
                                           // print(key)
                                            var mag = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
                                            var etat = String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast())
                                            var battery = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                        
                                          
                                            
                                                                    
                                                                        
                                            if(mag != nil && etat != nil && battery != nil)
                                            {
                                                
                                                
                                              //  var magnétique = SensorMagnetic(name: peripheral.name ?? "", RSSI: Int(RSSI),sensorTypes: .sensorMagnetic, nbrObjet: , etat: )
                                             
                                              //  var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                                                var id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(battery!)), nbrObjet: ConvertionToolbox.ConvertAdvertisingValue(str: String(mag!)), etat: ConvertionToolbox.convertHexaToEtat(str: etat))
                                            
                                                
                                                
                                                print("magnetic found !!!!!!!!!!")
                                                if(id is SensorMagnetic)
                                                {
                                                    //
                                                    if let magnetic = id as? SensorMagnetic {
                                                        print("Magnetic nbr aimant : " + String(magnetic.getNbrObject()))
                                                        print("Etat magnetic : " + String(magnetic.getEtat()))
                                                        print("Magnetic battery" + String(magnetic.batterylevel))
                                                    }
                                                }
                                                                       
                                            }
                                        }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                     //MARK::Magnétique sans batterie
                     
                     
                     
                    if(sensorData![CBUUID(string: "2A3F")] != nil && sensorData![CBUUID(string: "2A06")] != nil && String(sensorData![CBUUID(string: "2A3F")]!.debugDescription.dropFirst().dropFirst().dropLast()) == "0" ){
                                        
                                           // print(key)
                                            var mag = sensorData![CBUUID(string: "2A06")]?.debugDescription.dropFirst().dropLast()
                                            var etat = String(sensorData![CBUUID(string: "2A3F")].debugDescription.dropFirst().dropLast())
                        
                                          
                                            
                                                                    
                                                                        
                                            if(mag != nil && etat != nil)
                                            {
                                              //  var magnétique = SensorMagnetic(name: peripheral.name ?? "", RSSI: Int(RSSI),sensorTypes: .sensorMagnetic, nbrObjet: , etat: )
                                             
                                              //  var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                                                var id = SensorFactory.shared().getSensorMagnetic(sensorTypes: .SensorMagnetic, name: peripheral.name ?? "", RSSI: Int(RSSI), nbrObjet: ConvertionToolbox.ConvertAdvertisingValue(str: String(mag!)), etat: ConvertionToolbox.convertHexaToEtat(str: etat))
                                                
                                                
                                            
                                                
                                                
                                                print("magnetic found !!!!!!!!!!")
                                                if(id is SensorMagnetic)
                                                {
                                                    //
                                                    if let magnetic = id as? SensorMagnetic {
                                                        print("Magnetic nbr aimant : " + String(magnetic.getNbrObject()))
                                                        print("Etat magnetic : " + String(magnetic.getEtat()))
                                                    }
                                                }
                                                                       
                                            }
                                        }
                    
                    
                    
                    
                    
                    
                            
                            
                       //MARK:: temperature humidite avec batterie
                     
                     
                    if(sensorData![CBUUID(string: "2A6E")].debugDescription != nil && sensorData![CBUUID(string: "2A6F")].debugDescription != nil && sensorData![CBUUID(string: "180F")].debugDescription != nil ){
                       
                          // print(key)
                           var temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                           var hum = sensorData![CBUUID(string: "2A6F")]?.debugDescription.dropFirst().dropLast()
                           var batterie = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                                                   
                                                       
                           if(temp != nil && hum != nil && batterie != nil)
                           {
                               var temperature = SensorTemperature(name: peripheral.name ?? "", RSSI: Int(RSSI), sensorTypes: .SensorTemperature, temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                            
                               var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(batterie!)),  humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                               
                               print("humidity  sensor found !!!!!!!!!!")
                               if(id is SensorTemperatureHumidity)
                               {
                                   //
                                   if let tempfloat = id as? SensorTemperatureHumidity {
                                       print("My temperature found : " + String(tempfloat.getTemp()))
                                       print("My humidity found : " + String(tempfloat.getHum()))
                                       print("My battery found : " + String(tempfloat.getBatterie()))
                                   }
                               }
                                                      
                           }
                       }
                     
                     
             
                    //MARK::temperatureHumidite sans batterie
                    
                    
                    
                   else if(sensorData![CBUUID(string: "2A6E")].debugDescription != nil && sensorData![CBUUID(string: "2A6F")].debugDescription != nil ){
                                       
                                          // print(key)
                                           var temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                                           var hum = sensorData![CBUUID(string: "2A6F")]?.debugDescription.dropFirst().dropLast()
                                           
                                                                   
                                                                       
                                           if(temp != nil && hum != nil)
                                           {
                                               var temperature = SensorTemperature(name: peripheral.name ?? "", RSSI: Int(RSSI), sensorTypes: .SensorTemperature, temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                                            
                                               var id = SensorFactory.shared().getSensorTemperatureHumidity(sensorTypes: .SensorTemperatureHumidity, name: peripheral.name ?? "", RSSI: Int(RSSI), humidity: ConvertionToolbox.ConvertHumidite(str: String(hum!)), objectTemperature: temperature)
                                               
                                               print("humidity  sensor found !!!!!!!!!!")
                                               if(id is SensorTemperatureHumidity)
                                               {
                                                   //
                                                   if let tempfloat = id as? SensorTemperatureHumidity {
                                                       print("My temperature found : " + String(tempfloat.getTemp()))
                                                       print("My humidity found : " + String(tempfloat.getHum()))
                                                   }
                                               }
                                                                      
                                           }
                                       }
                    
                    
                    
                    
                    
                    
                    
                    /*
                                                        
                                                        /////////////////CAPTEUR DE TEMPERATURE AVEC BATTERIE//////////////////////////////////////
                                                        
                                                */
                    //MARK:: temperareture avec batterie
                
                                                   else if(sensorData![CBUUID(string: "2A6E")].debugDescription != nil  && sensorData![CBUUID(string: "180F")].debugDescription != nil  ){
                                                   
                                                      // print(key)
                                                       var temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                                                       var batterie = sensorData![CBUUID(string: "180F")]?.debugDescription.dropFirst().dropLast()
                                                       print("bravo")
                                                       if(temp != nil && batterie != nil)
                                                       {
                                                     
                                                       print("delta")
                                                           var id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperature, name: peripheral.name ?? "", RSSI: Int(RSSI),batterylevel: ConvertionToolbox.ConvertAdvertisingValue(str: String(batterie!)),temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                                                           print("temperature  sensor found !!!!!!!!!!")
                                                           if(id is SensorTemperature)
                                                           {
                                                               //
                                                               if let tempfloat = id as? SensorTemperature {
                                                                   print("My temperature found : " + String(tempfloat.getTemp()))
                                                                   print("My battery found : " + String(tempfloat.getBatterie()))
                                                               }
                                                           }
                                                                                  
                                                       }
                                                   }
                            
                            
                            
                            
                        /*
                             
                             /////////////////CAPTEUR DE TEMPERATURE SANS BATTERIE//////////////////////////////////////
                             
                        */
                    //MARK:: temperetaure sans batterie
                            
                       else if(sensorData![CBUUID(string: "2A6E")].debugDescription != nil ){
                        
                           // print(key)
                            var temp = sensorData![CBUUID(string: "2A6E")]?.debugDescription.dropFirst().dropLast()
                            print("bravo")
                            if(temp != nil)
                            {
                          
                            print("delta")
                                var id = SensorFactory.shared().getSensorTemperature(sensorTypes: .SensorTemperature, name: peripheral.name ?? "", RSSI: Int(RSSI),temperature: ConvertionToolbox.ConvertTemperature(str: String(temp!)))
                                print("temperature  sensor found !!!!!!!!!!")
                                if(id is SensorTemperature)
                                {
                                    //
                                    if let tempfloat = id as? SensorTemperature {
                                        print("My temperature found : " + String(tempfloat.getTemp()))
                                    }
                                }
                                                       
                            }
                        }
                            //MARK:: rht humidite + temperature
                                                    
                  
                            
                       
                       
                            
                            
                                 /*                  else    if(sensorData![CBUUID(string: "2A06")].debugDescription != nil && ConvertionToolbox.convertHexaToEtatInv(str: sensorData![CBUUID(string: "2A3F")].debugDescription) == true ){
                                                    
                                        
                                 
                                    // print(key)
                                 
                          //  var id = SensorFactory.shared().getSensorMove(sensorTypes: .SensorMove, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription), nbrPas: ConvertionToolbox.convertHexaToSumExpo(str :ConvertionToolbox.hexaToBinary(str: "2A06")), etat: ConvertionToolbox.convertHexaToEtat(str :ConvertionToolbox.hexaToBinary(str: "2A06")))
                            
                            
                            
                          //     print("le move la valeur est : " + String(ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2A58")].debugDescription)))
                                         print("move  sensor found !!!!!!!!!!")
                                      
                            
                            
                                     }
                            
                        else if(sensorData![CBUUID(string: "2AA1")] != nil ){
                                 
                                    // print(key)
                                 
                        //    var id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel: ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2AA1")].debugDescription), x: ConvertionToolbox.ConvertHexaToDecimal(str: ConvertionToolbox.ANG(str: sensorData![CBUUID(string: "2AA1")].debugDescription, index: 0)), y: , z: Int(<#T##Double#>))
                            
                            var id = SensorFactory.shared().getSensorAngle(sensorTypes: .SensorAngle, name: peripheral.name ?? "", RSSI: Int(RSSI), batterylevel:ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2AA1")].debugDescription), x: ConvertionToolbox.ConvertHexaToDecimal(str: ConvertionToolbox.ANG(str: sensorData![CBUUID(string: "2AA1")].debugDescription, index: 0)), y: ConvertionToolbox.ConvertHexaToDecimal(str: ConvertionToolbox.ANG(str: sensorData![CBUUID(string: "2AA1")].debugDescription, index: 4)), z: ConvertionToolbox.ConvertHexaToDecimal(str: ConvertionToolbox.ANG(str: sensorData![CBUUID(string: "2AA1")].debugDescription, index: 8)))
                            
                    
                        
     
                               print("le move la valeur est : " + String(ConvertionToolbox.ConvertHexaToDecimal(str: sensorData![CBUUID(string: "2AA1")].debugDescription)))
                                         print("ANG  sensor found !!!!!!!!!!")
   
                            
                                     }
 */
   
                            
                        else
                       {
                       
                            print("Sensor uknow")
                        }
                       // print(key)
                        cpt = cpt + 1
                    }
                   
                    }
                    
                    
                       }
                        else
                        {
                            print("déja trouvé")
                        }

                    }
                    
                    
                }

 
   //     }

  
  //  }

