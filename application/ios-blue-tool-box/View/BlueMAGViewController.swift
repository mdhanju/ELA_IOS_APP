//
//  BlueMAGViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//
import UIKit
import CoreBluetooth
import SwiftUI

class BlueMAGViewController: UIViewController,UITableViewDataSource{
    
    
    private let refreshControl = UIRefreshControl()
    
    var isStartButton : Bool = true
    var dictionnaryDoublon : [String: Sensor] = [:]
    
    struct DisplayObject {
        var name: String
        var RSSI: Int
        var identifier : String
    }
    
   // var display = [ DisplayObject(name: "P_MOV_007", RSSI: 100),DisplayObject(name: "P_MOV_008", RSSI: 101)]
   // let display1 = [ DisplayObject(name: "P_MOV_007", RSSI: 100),DisplayObject(name: "P_MOV_008", RSSI: 101)]
    var display: [ DisplayObject] = []
    //let display1 : [ DisplayObject] = []
   // var display = [getSensorMagnetic(handle)]
   // let display1 = [getSensorMagnetic]
    
    
    
    
    func showToast(message: String, font: UIFont) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = .white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        let maxWidthPercentage: CGFloat = 0.8
        let maxTitleSize = CGSize(width: view.bounds.size.width * maxWidthPercentage, height: view.bounds.size.height * maxWidthPercentage)
        var titleSize = toastLabel.sizeThatFits(maxTitleSize)
        titleSize.width += 20
        titleSize.height += 10
        toastLabel.frame = CGRect(x: view.frame.size.width / 2 - titleSize.width / 2, y: view.frame.size.height - 50, width: titleSize.width, height: titleSize.height)
        
        view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
    
    var prenom = ["henri","noel","pierre"]
    var prenom1 = ["henri","noel","pierre"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return display.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // cell.textLabel?.text = prenom[indexPath.row]
        let objectDiplay = display[indexPath.row]
        cell.textLabel?.text = "le nom " + objectDiplay.name + " et le RSSI : " + String(objectDiplay.RSSI)
        return cell
    }
    
    private let tableview : UITableView =
    {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
        
    }()
    
    private var scanner: Scanner1!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // centralManager = CBCentralManager(delegate: self, queue: nil)
        // Do any additional setup after loading the view.
      
  scanner = Scanner1()
        scanner.initializeScanner()
        
        /*  tableview.layoutMargins = UIEdgeInsets(top: self.view.layoutMargins.top,
         left: 64,
         bottom: self.view.layoutMargins.bottom,
         right: 64)
         */
        tableview.contentInset = UIEdgeInsets(top: 60,left: 0,bottom: 0,right: 0)
        tableview.backgroundColor = .green
        
        //  tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 120.0).isActive = true
        tableview.dataSource = self
        
      //  tableview.dataSource = BlueMAGViewController(cell ")
            //WeatherDataSource(cellIdentifier: "WeatherCell", weatherViewModels: self.weatherListViewModel)

        
        //ta//bleview.topAnchor.constraint(equalTo: view.topAnchor, constant: 120.0).isActive = true
        //tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
        //  tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0).isActive = true
        
        view.addSubview(tableview)
        
        
        
          tableview.reloadData()
        
        let button = UIButton(frame: CGRect(x: 100, y: 50, width: 60, height: 60))
        //  button.setTitle("pencil", for: .normal)
        //  button.backgroundColor = .black
        //     button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        let buttonStop =  UIButton(frame: CGRect(x: 180, y: 50, width: 60, height: 60))
        
        buttonStop.setImage(UIImage(systemName: "stop"), for: .normal)
        buttonStop.addTarget(self, action: #selector(self.buttonTappedStop), for: .touchUpInside)
        view.addSubview(buttonStop)
    }
    
    @objc func buttonTapped(sender : UIButton) {
        
        if (isStartButton == true)
        {
            
            
           scanner = Scanner1()
                 scanner.initializeScanner()
            
            //ta//bleview.topAnchor.constraint(equalTo: view.topAnchor, constant: 120.0).isActive = true
            //tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
            //  tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0).isActive = true
            
          
             // scanner = Scanner1()
            
       
     //   scanner.evNewInfoAvailable.addHandler { a, b in print("Le nom \(a), et l'identifier \(b)") }
    //    scanner.dictionnarySensor.addHandler { a in print("le nom du sensor  \(a)") }
        /*scanner.dictionnarySensor.addHandler { _ in  for (key) in a {
                   print("la valeur du dico " + " \(key)")
               }
        }
 */
        scanner.dictionnarySensor.addHandler(handler : handleNewObjectAvailable)
        print("El toro de Mardid")
        
        self.showToast(message: "Le scan a démarré", font: .systemFont(ofSize: 12.0))
       // display = display1
       
         isStartButton = false
        }
    }
    
    @objc func buttonTappedStop(sender : UIButton) {
        
        scanner.stopScanner()
    
        print("El toro de Mardid")
        self.showToast(message: "Le scan est terminé", font: .systemFont(ofSize: 12.0))
        
        display.removeAll()
        tableview.reloadData()
        isStartButton = true
    }
    
    override func  viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    func handleNewObjectAvailable(data: ([String : Sensor])) {
      
   /*     for key in data {
            print("Hello je suis ta clé \(key)")
        }
 */
                      //
                    getSensorMagnetic(data: data)
         
          
        
  
    
    }
    
    func getSensorMagnetic(data: ([String : Sensor])) -> DisplayObject {
        
        /*     for key in data {
         print("Hello je suis ta clé \(key)")
         }
         */
        
        var trouve = true
     //  tableview.refreshControl?.beginRefreshing()
        
        var a : DisplayObject = DisplayObject(name: "null", RSSI: 0, identifier: "")
        for (key,value) in data
        {
            if(value is SensorMagnetic)
            {
                if let magnetic = value as? SensorMagnetic
                {
                    //
                    for var cle in display
                    {
                        print("indetifier cle" + cle.identifier + "identifier data " + key + cle.name)
                        if(key == cle.identifier)
                        {
                            cle.RSSI = value.RSSI
                            
                            print("cle RSSSSSi" + String(cle.RSSI))
                          
                            print("updated !!!!!!!!!!!!!")
                            trouve  = false
                        }
                 
                    }
                 
                    self.tableview.reloadData()
             //       tableview.refreshControl?.endRefreshing()
      
                    
                    /*
                    
                    if(dictionnaryDoublon[key] != nil)
                    {
                        print("impossible")
                        for var cle in display
                        {
                            print("indetifier cle" + cle.identifier + "identifier data " + key)
                            if(key == cle.identifier)
                            {
                                
                                cle.RSSI = value.RSSI
                            }
                        }
                    }
                    
                    dictionnaryDoublon[key] = value
 */
                    
                    //
                    if(trouve == true)
                    {
                    a = DisplayObject(name: magnetic.name, RSSI: magnetic.RSSI, identifier:  magnetic.idenfitfier)
                    display.append(a)
                 
                    }
                    
                }
            }
            
        }
          
        return a
    }
}






