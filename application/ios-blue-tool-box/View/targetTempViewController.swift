//
//  targetTempViewController.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 08/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit
import Charts
class targetTempViewController: UIViewController,ChartViewDelegate {
    
  
    
    var lineChart = LineChartView()
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
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
        
        
        let UIconnecter = UITextView()
        UIconnecter.text = "Connecter/ Deconnecter"
        UIconnecter.textColor = UIColor.black
        UIconnecter.font = UIFont.systemFont(ofSize: 25.0)
        UIconnecter.isUserInteractionEnabled = false
        UIconnecter.font = UIFont.boldSystemFont(ofSize: 15)
        UIconnecter.frame = CGRect(x: 80, y: 100, width: 350, height: 100)
        UIconnecter.backgroundColor = .none
        self.view.addSubview(UIconnecter)
        self.view.bringSubviewToFront(UIconnecter)
        
        
        let UIbatterie = UITextView()
        UIbatterie.text = "La batterie est de : " + String(battery) + " mV"
        UIbatterie.textColor = UIColor.black
        UIbatterie.font = UIFont.systemFont(ofSize: 25.0)
        UIbatterie.isUserInteractionEnabled = false
        UIbatterie.font = UIFont.boldSystemFont(ofSize: 15)
        UIbatterie.frame = CGRect(x: 170, y: 560, width: 350, height: 100)
        UIbatterie.backgroundColor = .none
        self.view.addSubview(UIbatterie)
        self.view.bringSubviewToFront(UIbatterie)
        
        
        
        let imageTemp = "temp"
        let UIimageTemp = UIImage(named: imageTemp)
        let imageViewTemp = UIImageView(image: UIimageTemp!)
        imageViewTemp.frame = CGRect(x: 20, y: 70, width: 45, height: 45)
        self.view.addSubview(imageViewTemp)
        
        
        let imageConnect = "connection"
           let UIconnect = UIImage(named: imageConnect)
           let imageVIewConnect = UIImageView(image: UIconnect!)
           imageVIewConnect.frame = CGRect(x: 270, y: 100, width: 45, height: 45)
        imageVIewConnect.isUserInteractionEnabled = true
        let imageTapGestureRecognizerConnect = UITapGestureRecognizer(target: self, action: #selector(ELAViewController.imageTapTemp))
        imageViewTemp.addGestureRecognizer(imageTapGestureRecognizerConnect)

           self.view.addSubview(imageVIewConnect)
        
        
        
        lineChart.delegate = self

        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        lineChart.frame = CGRect(x: 0, y: 0,width: self.view.frame.size.width, height:self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
    
        var entries = [ChartDataEntry]()
        for cle in displayObject {
            if( cle.identifier == identifier)
                
            {
                if let temp : [Capteur.Temp] = cle.array as? [Capteur.Temp]
                {
                    for x in 0..<cle.array.count
                    {
                        entries.append(ChartDataEntry(x: Double(x),y: Double(temp[x].temp)))
                    }
                    
                }
            }
        }
        let set = LineChartDataSet(entries:entries)
        set.colors = ChartColorTemplates.material()
        
        let data = LineChartData(dataSet: set)
        
        lineChart.data = data
        
    }
    
}


