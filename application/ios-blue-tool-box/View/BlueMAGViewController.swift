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
    
    struct DisplayObject {
        var name: String
        var RSSI: Int
    }
    
    
    
    var display = [ DisplayObject(name: "P_MOV_007", RSSI: 100),DisplayObject(name: "P_MOV_008", RSSI: 101)]
    let display1 = [ DisplayObject(name: "P_MOV_007", RSSI: 100),DisplayObject(name: "P_MOV_008", RSSI: 101)]
 
    
    
    
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
    
    
    
    
/*

    
    
    private let progressView: UIProgressView =
    {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .systemBlue
           
        return progressView
    }()
    
    private let progressView1: UILabel =
    {
        let progressView1 = UILabel()
        progressView1.text = "ok"
        
        
        return progressView1
    
    }()
        
    
    
    struct ContentView: View {
        var body: some View {
            Text("Hello World")
        }
    }
    */
 
 
    
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
     
      //ta//bleview.topAnchor.constraint(equalTo: view.topAnchor, constant: 120.0).isActive = true
      //tableview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
    //  tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0).isActive = true
        
        view.addSubview(tableview)
  
     
        
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
                      print("El toro de Mardid")
        self.showToast(message: "Le scan a démarré", font: .systemFont(ofSize: 12.0))
        display = display1
               tableview.reloadData()
                    }
    
    
    @objc func buttonTappedStop(sender : UIButton) {
                      print("El toro de Mardid")
        self.showToast(message: "Le scan est terminé", font: .systemFont(ofSize: 12.0))
        
      display.removeAll()
        tableview.reloadData()
                    }
    
       /*let dic =  SensorFactory.shared().returnDtictionnary()
        for key in dic
        {
            print("www"+String(key.self.value.RSSI))
        }
        */
        
      /* view.backgroundColor = .darkGray

        
            view.addSubview(progressView)
     let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
     label.center = CGPoint(x: 160, y: 285)
     label.textAlignment = .center
     label.text = "I'm a test label"
     self.view.addSubview(label)
                progressView.frame = CGRect(x: 10, y: 100, width: view.frame.width-20, height: 20)
                progressView.setProgress(0.5, animated: true)
            
        
        */
       
     
        
    
    override func  viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    

    
}



  


