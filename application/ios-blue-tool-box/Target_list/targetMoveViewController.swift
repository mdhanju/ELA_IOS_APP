//
//  targetMoveViewController.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 11/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit
import Charts
import UICircularProgressRing
class targetMoveViewController: UIViewController,ChartViewDelegate {


     
     private let nameSensor : String
     private let RSSI : Int
     private let identifier : String
     private let battery : Int
     private let typedata : SensorTypes
     private let array : [Capteur.Cap]
     private let displayObject : [Capteur.DisplayObject]
     
     //    private let relatedItem : [String]
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
     
     
     @objc func imageTapTemp() {
         self.navigationController?.pushViewController(ConnectViewController(nameSensor: nameSensor, RSSI: RSSI, identifier: identifier, battery: battery, typedata: typedata, array: array, displayObject: displayObject), animated: true)
         view.layoutIfNeeded()
     }

     
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    

      override func viewDidLoad() {
        super.viewDidLoad()
           view.backgroundColor = .white
        // 2^15
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
                  UInameSensor.frame = CGRect(x: 80, y: 50, width: 350, height: 100)
                  UInameSensor.backgroundColor = .none
                  self.view.addSubview(UInameSensor)
                  self.view.bringSubviewToFront(UInameSensor)
        
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
        

          // Do any additional setup after loading the view.
          //progressRing = UICircularProgressRing()
           let progressRing = UICircularProgressRing(frame:  CGRect(x: 150, y: 200, width: 100, height: 100))
          // Change any of the properties you'd like
          progressRing.minValue = 1
          progressRing.maxValue = 32000
        for cle in displayObject {
                 if( cle.identifier == identifier)
                     
                 {
                     if let temp : [Capteur.Move] = cle.array as? [Capteur.Move]
                     {
                        for x in 0..<cle.array.count
                                           {
                                            progressRing.value = CGFloat(temp[x].nbrPas)
                        }
                    }
            }
        }
          progressRing.innerRingColor = UIColor.orange
      //  progressRing.valueFormatter = "pas" as! UICircularRingValueFormatter
   
        progressRing.valueFormatter = UICircularProgressRingFormatter(valueIndicator: " pas", rightToLeft: false, showFloatingPoint: false, decimalPlaces: 0)
          self.view.backgroundColor = UIColor.green
        
          self.view.addSubview(progressRing)
}
 
    
}
