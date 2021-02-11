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
        
        

          // Do any additional setup after loading the view.
          //progressRing = UICircularProgressRing()
           let progressRing = UICircularProgressRing(frame:  CGRect(x: 200, y: 200, width: 100, height: 100))
          // Change any of the properties you'd like
          progressRing.minValue = 1
          progressRing.maxValue = 50
          progressRing.value = 3
          progressRing.innerRingColor = UIColor.orange
      //  progressRing.valueFormatter = "pas" as! UICircularRingValueFormatter
   
        progressRing.valueFormatter = UICircularProgressRingFormatter(valueIndicator: " pas", rightToLeft: true, showFloatingPoint: false, decimalPlaces: 0)
          self.view.backgroundColor = UIColor.green
        
          self.view.addSubview(progressRing)
}
 
    
}
