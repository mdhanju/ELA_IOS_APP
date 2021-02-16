//
//  targetMagViewController.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 12/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit
import Charts
import UICircularProgressRing
class targetMagViewController: UIViewController {
    
    
    private var capteur: Capteur!
    let btnPerson = UIButton()
    
    
    let UIimagelowPerson = UIImage(named: "PersonRunning")
    let UIimagelowPersonStatic = UIImage(named: "Person")
    
    let progressRing = UICircularProgressRing(frame:  CGRect(x: 150, y: 200, width: 100, height: 100))


    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    
    
    private var displayObject : [Capteur.DisplayObject]
    
       private var scanner: Scanner1!
     
     var sensorT : SensorTypes? = nil
    
    init(nameSensor : String,RSSI: Int, identifier : String, battery : Int, typedata : SensorTypes,array: [Capteur.Cap],displayObject : [Capteur.DisplayObject]) {
        self.nameSensor = nameSensor
        self.RSSI = RSSI
        self.identifier = identifier
        self.battery = battery
        self.typedata = typedata
        self.array = array
        self.displayObject = displayObject
        
        
        super.init(nibName : nil , bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleNewObjectAvailable(data: ([String : Sensor])) {
        print("test 1930")
        updateSensorUI(data: data)
    }
    
    
    func updateSensorUI(data: ([String : Sensor])) -> Capteur.DisplayObject {
        
        var trouve = true
        let objectTemp1 = Capteur.Temp(temp: 0)
        //  let objectHum = TempHum(temp: 0, hum: 0)
        
        var newobject : Capteur.DisplayObject = Capteur.DisplayObject(name: "null", RSSI: 0, identifier: "",battery : 0, typedata : SensorTypes.SensorID, array: [objectTemp1])
        
        for (key,value) in data
        {
            
            if(key == identifier)
            {
                
                
                
                
                
                if(value is SensorMagnetic)
                {
                    if let move = value as? SensorMagnetic
                    {
                        let objectMove =
                            Capteur.Move(nbrPas: move.nbrObjet, etat: move.etat)
                        //  newobject = DisplayObject(name : cle.name, RSSI : cle.RSSI, identifier:  cle.identifier, battery: cle.battery, typedata : cle.typedata,array: [objectTemp] )
                        //  display.addData(data: objectTemp)
                        
                        progressRing.value = CGFloat(move.nbrObjet)
                        print("progress ring" + String(move.nbrObjet) + "son nom " + move.name )
                        if(move.etat == true)
                        {
                            btnPerson.setImage(UIimagelowPerson, for: .normal)
                        }
                        else {
                            
                            btnPerson.setImage(UIimagelowPersonStatic, for: .normal)
                        }
                    }
                    
                }
                
                
                
                trouve  = false
                
                displayObject.append(newobject)
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        return newobject
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        
        scanner = Scanner1()
        scanner.initializeScanner()
        
        //   scanner.defineFilterType(sensor: sensorT!)
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        
        
        let imageTemp = "temp"
        let UIimageTemp = UIImage(named: imageTemp)
        let imageViewTemp = UIImageView(image: UIimageTemp!)
        imageViewTemp.frame = CGRect(x: 20, y: 70, width: 45, height: 45)
        self.view.addSubview(imageViewTemp)
        
        let UInameSensor = UITextView()
        UInameSensor.text = nameSensor
        UInameSensor.textColor = UIColor.black
        UInameSensor.font = UIFont.systemFont(ofSize: 25.0)
        UInameSensor.isUserInteractionEnabled = false
        UInameSensor.font = UIFont.boldSystemFont(ofSize: 25)
        UInameSensor.frame = CGRect(x: 80, y: 70, width: 350, height: 100)
        UInameSensor.backgroundColor = .none
        self.view.addSubview(UInameSensor)
        self.view.bringSubviewToFront(UInameSensor)
        
        
        let UInameEtat = UITextView()
        UInameEtat.text = "Etat : En déplacement"
        UInameEtat.textColor = UIColor.black
        UInameEtat.font = UIFont.systemFont(ofSize: 15)
        UInameEtat.isUserInteractionEnabled = false
        UInameEtat.font = UIFont.boldSystemFont(ofSize: 15)
        UInameEtat.frame = CGRect(x: 80, y: 130, width: 350, height: 100)
        UInameEtat.backgroundColor = .none
        self.view.addSubview(UInameEtat)
        self.view.bringSubviewToFront(UInameEtat)
        
        if(battery != -1)
        {
            
            let UIbatterie = UITextView()
            
            //  UIbatterie.text = "La batterie est de : " + String(battery) + " mV"
            UIbatterie.text = "Low battery"
            
            UIbatterie.textColor = UIColor.red
            UIbatterie.font = UIFont.systemFont(ofSize: 25.0)
            UIbatterie.isUserInteractionEnabled = false
            UIbatterie.font = UIFont.boldSystemFont(ofSize: 15)
            UIbatterie.frame = CGRect(x: 170, y: 560, width: 350, height: 100)
            UIbatterie.backgroundColor = .none
            self.view.addSubview(UIbatterie)
            self.view.bringSubviewToFront(UIbatterie)
            
            
            let imagelowBattery = "lowBattery"
            let UIimagelowBattery = UIImage(named: imagelowBattery)
            
            
            let btn = UIButton()
            btn.frame = CGRect(x: 120, y: 560, width: 45, height: 45)
            btn.blink()
            btn.setImage(UIimagelowBattery, for: .normal)
            self.view.addSubview(btn)
            
            
            
            
            //   Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
        }
        
        for cle in displayObject {
            if( cle.identifier == identifier)
                
            {
                if let Move : [Capteur.Mag] = cle.array as? [Capteur.Mag]
                {
                    
                    
                    print(Move[array.count-1].etat == false)
                    if(Move[array.count-1].etat == true)
                    {
                        let imagePerson = "PersonRunning"
                        let UIimagelowPerson = UIImage(named: imagePerson)
                        
                        
                        let btnPerson = UIButton()
                        btnPerson.frame = CGRect(x: 250, y: 130 ,width: 45, height: 45)
                        btnPerson.blink()
                        btnPerson.setImage(UIimagelowPerson, for: .normal)
                        self.view.addSubview(btnPerson)
                    }
                    else {
                        
                        
                        let imagePersonStatic = "Person"
                        let UIimagelowPersonStatic = UIImage(named: imagePersonStatic)
                        
                        
                        let btnPersonStatic = UIButton()
                        btnPersonStatic.frame = CGRect(x: 300, y: 130 ,width: 45, height: 45)
                        
                        btnPersonStatic.setImage(UIimagelowPersonStatic, for: .normal)
                        self.view.addSubview(btnPersonStatic)
                        
                        
                    }
                    
                }
            }
        }
        
        
        
        
        
        // Do any additional setup after loading the view.
        //progressRing = UICircularProgressRing()
        let progressRing = UICircularProgressRing(frame:  CGRect(x: 150, y: 200, width: 100, height: 100))
        // Change any of the properties you'd like
        progressRing.minValue = 1
        progressRing.maxValue = 32000
        for cle in displayObject {
            if( cle.identifier == identifier)
                
            {
                if let temp : [Capteur.Mag] = cle.array as? [Capteur.Mag]
                {
                    for x in 0..<cle.array.count
                        
                    {
                        progressRing.value = CGFloat(temp[x].nbrMagnet)
                    }
                }
            }
        }
        progressRing.innerRingColor = UIColor.orange
        //  progressRing.valueFormatter = "pas" as! UICircularRingValueFormatter
        
        progressRing.valueFormatter = UICircularProgressRingFormatter(valueIndicator: " aimant", rightToLeft: false, showFloatingPoint: false, decimalPlaces: 0)
        //self.view.backgroundColor = UIColor.green
        
        self.view.addSubview(progressRing)
    }
    
    
}



// Do any additional setup after loading the view.



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


