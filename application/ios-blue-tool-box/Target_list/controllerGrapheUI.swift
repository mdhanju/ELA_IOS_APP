//
//  controllerGrapheUI.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 22/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit



class controllerGrapheUI: controllerUI {
    
    var UItemperature = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let line = UIView(frame: CGRect(x: 40, y: 150, width: 290, height: 3))
        line.backgroundColor =  UIColor(hexString: "#336699")
        self.view.addSubview(line)
        
        let lineBack = UIView(frame: CGRect(x: 40, y: 200, width: 290, height: 3))
        lineBack.backgroundColor = UIColor(hexString: "#336699")
        self.view.addSubview(lineBack)
        
        
       
        UItemperature.text = ""
        UItemperature.textColor = UIColor.black
        UItemperature.font = UIFont.systemFont(ofSize: 25.0)
        UItemperature.isUserInteractionEnabled = false
        UItemperature.font = UIFont.boldSystemFont(ofSize: 25)
        UItemperature.frame = CGRect(x: 150, y: 150, width: 350, height: 100)
        UItemperature.backgroundColor = .none
        self.view.addSubview(UItemperature)
        self.view.bringSubviewToFront(UItemperature)

        // Do any additional setup after loading the view.
    }
    
    
    func valueUI(donnees : String)
    {
        UItemperature.text = donnees
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
