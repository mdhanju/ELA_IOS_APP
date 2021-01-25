//
//  ELAViewController.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit

class ELAViewController: UIViewController {
    
    
    /*
       override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           super.viewWillTransition(to: size, with: coordinator)
           
           
                  
           
           
           // landscape
          if UIDevice.current.orientation.isLandscape {
            view.subviews.forEach { $0.removeFromSuperview() }
            
   let imageView0 = UITextView()
                         imageView0.text = "Blue Tool Box"
                         imageView0.textColor = UIColor.red
                         imageView0.font = UIFont.systemFont(ofSize: 25.0)
                         imageView0.font = UIFont.boldSystemFont(ofSize: 25)
                             imageView0.frame = CGRect(x: 80, y: 120, width: 350, height: 100)
                         imageView0.backgroundColor = .none
                           self.view.addSubview(imageView0)
                         
                           //Imageview on Top of View
                           self.view.bringSubviewToFront(imageView0)
               
        
             print("landscape")
           }
           
           // portrait
           else {
              view.subviews.forEach { $0.removeFromSuperview() }
            let imageView0 = UITextView()
                        imageView0.text = "Blue Tool Box"
                        imageView0.textColor = UIColor.red
                        imageView0.font = UIFont.systemFont(ofSize: 25.0)
                        imageView0.font = UIFont.boldSystemFont(ofSize: 25)
                            imageView0.frame = CGRect(x: 80, y: 300, width: 350, height: 100)
                        imageView0.backgroundColor = .none
                          self.view.addSubview(imageView0)
                        
                          //Imageview on Top of View
                          self.view.bringSubviewToFront(imageView0)
            
            
            
            let imageName = "log"
                          let image = UIImage(named: imageName)
                          let imageView = UIImageView(image: image!)
                          imageView.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
               
               
               print("Portrait")
               
                   self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back_main")!.scalePreservingAspectRatio(targetSize: CGSize(width: 700, height: 700)))
    
              
               
           }
       }
*/
    override func viewDidLoad() {
        super.viewDidLoad()

        
                           self.view.backgroundColor = UIColor(patternImage: UIImage(named: "back_main")!.scalePreservingAspectRatio(targetSize: CGSize(width: 700, height: 700)))
        
        let imageView0 = UITextView()
             imageView0.text = "Blue Tool Box"
             imageView0.textColor = UIColor.red
             imageView0.font = UIFont.systemFont(ofSize: 25.0)
             imageView0.font = UIFont.boldSystemFont(ofSize: 25)
                 imageView0.frame = CGRect(x: 80, y: 300, width: 350, height: 100)
             imageView0.backgroundColor = .none
               self.view.addSubview(imageView0)
             
               //Imageview on Top of View
               self.view.bringSubviewToFront(imageView0)
        
        
        let imageName = "log"
               let image = UIImage(named: imageName)
               let imageView = UIImageView(image: image!)
               imageView.frame = CGRect(x: 50, y: 100, width: 200, height: 100)
               
             self.view.addSubview(imageView)
           
             //Imageview on Top of View
             self.view.bringSubviewToFront(imageView)
               
               
                 let imageName1 = "blue"
                 let image1 = UIImage(named: imageName1)
                 let imageView1 = UIImageView(image: image1!)
                 imageView1.frame = CGRect(x: 50, y: 450, width: 45, height: 45)
               self.view.addSubview(imageView1)
               
               //Imageview on Top of View
               self.view.bringSubviewToFront(imageView1)
               
               
               
                 let imageName2 = "temp"
                 let image2 = UIImage(named: imageName2)
                 let imageView2 = UIImageView(image: image2!)
                 imageView2.frame = CGRect(x: 150, y: 450, width: 45, height: 45)
               self.view.addSubview(imageView2)
               //Imageview on Top of View
               self.view.bringSubviewToFront(imageView2)
               
               
               
                 let imageName3 = "humidite_blue"
                 let image3 = UIImage(named: imageName3)
                 let imageView3 = UIImageView(image: image3!)
                 imageView3.frame = CGRect(x: 250, y: 450, width: 45, height: 45)
               self.view.addSubview(imageView3)
               //Imageview on Top of View
               self.view.bringSubviewToFront(imageView3)
               
               
                 let imageName4 = "mouvement_blue"
                 let image4 = UIImage(named: imageName4)
                 let imageView4 = UIImageView(image: image4!)
                 imageView4.frame = CGRect(x: 50, y: 520, width: 45, height: 45)
               self.view.addSubview(imageView4)
               //Imageview on Top of View
               self.view.bringSubviewToFront(imageView4)
               
               
               
                let imageName5 = "porte_blue"
                 let image5 = UIImage(named: imageName5)
                 let imageView5 = UIImageView(image: image5!)
                 imageView5.frame = CGRect(x: 150, y: 520, width: 45, height: 45)
               self.view.addSubview(imageView5)
               //Imageview on Top of View
               self.view.bringSubviewToFront(imageView5)
               
               
                let imageName6 = "angle"
                 let image6 = UIImage(named: imageName6)
                 let imageView6 = UIImageView(image: image6!)
                 imageView6.frame = CGRect(x: 250, y: 520, width: 45, height: 45)
               self.view.addSubview(imageView6)
               //Imageview on Top of View
               self.view.bringSubviewToFront(imageView6)
        
        
        
        
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
