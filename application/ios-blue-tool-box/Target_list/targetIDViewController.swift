//
//  tarfetIDViewController.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 17/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit

class targetIDViewController: UIViewController {
    
    private let nameSensor : String
    private let RSSI : Int
    private let identifier : String
    private let battery : Int
    private let typedata : SensorTypes
    private let array : [Capteur.Cap]
    private let displayObject : [Capteur.DisplayObject]

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
    
    @objc func imageTapTemp() {
        self.navigationController?.pushViewController(ConnectViewController(nameSensor: nameSensor, RSSI: RSSI, identifier: identifier, battery: battery, typedata:typedata, array: array, displayObject: displayObject), animated: true)
        view.layoutIfNeeded()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
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
            
            let imageArray = "sklia"
            let UIarray = UIImage(named: imageArray)
            
            var items = [UIBarButtonItem]()
            items.append(UIBarButtonItem(image: UIarray, landscapeImagePhone: .none, style: .done, target: self, action: #selector(imageTapTemp)))
            items.append(UIBarButtonItem(title: "Connexion", style: .plain, target: self,action: .none))
            
            self.navigationItem.setRightBarButtonItems(items, animated: true)
            
            //   Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
