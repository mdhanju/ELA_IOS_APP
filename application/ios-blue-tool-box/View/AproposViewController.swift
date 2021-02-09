//
//  AproposViewController.swift
//  ios-blue-tool-box
//
//  Created by ELA Innovation on 08/02/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import UIKit






class AproposViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 view.backgroundColor = .white
        
    let descriptionText = NSMutableAttributedString(string:"To learn more, check out our ", attributes: [:])

    let linkText = NSMutableAttributedString(string: "Github", attributes: [NSAttributedString.Key.link: URL(string: "https://github.com/elaInnovation")!])

    descriptionText.append(linkText)
        
        
        let githubText = UITextView()
      githubText.attributedText = descriptionText
        githubText.textColor = UIColor.black
        githubText.font = UIFont.systemFont(ofSize: 25.0)
     
        githubText.font = UIFont.boldSystemFont(ofSize: 18)
        githubText.frame = CGRect(x: 30, y: 300, width: 350, height: 100)
        githubText.backgroundColor = .none
     /*   imageView0.isSelectable = true
        imageView0.isEditable = false
 */
        self.view.addSubview(githubText)
        self.view.bringSubviewToFront(githubText)

  

        // Define how links should look like within the text view
   //     imageView0.linkTextAttributes = [
           // .foregroundColor: NSColor.blue,
     //       .underlineStyle: NSUnderlineStyle.styleSingle.rawValue
      //  ]
        
        
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
