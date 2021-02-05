//
//  SideMenu.swift
//  burger
//
//  Created by ELA Innovation on 14/01/2021.
//  Copyright © 2021 ELA Innovation. All rights reserved.
//

import Foundation
import UIKit

protocol MenuControllerDelegate
{
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String,CaseIterable
        {
            case ELA = "Home"
            case blueID = "Blue ID"
            case blueT = "Blue T"
            case blueRHT = "blue RHT"
            case blueMOV = "blue MOV"
            case blueMAG = "blue MAG"
            case blueANG = "blue ANG"
            case debug = "Debug"
        }

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}

  class MenuController: UITableViewController {
    
    
    
    let devCousesImages = [ UIImage(named: "logo")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),
    //resizeImage(image: UIImage(named: "logo")!,targetSize:  CGSize(width: 60, height: 60)),
    UIImage(named: "blue")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "temp")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "humidite_blue"),UIImage(named: "mouvement_blue")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "porte_blue")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "angle")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "parameter")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45))]
    
    

      public var delegate: MenuControllerDelegate?

      private let menuItems: [SideMenuItem]
    /*  private let color = UIColor(red: 33/255.0,
                                  green: 33/255.0,
                                  blue: 33/255.0,
                                  alpha: 1)
*/
      init(with menuItems: [SideMenuItem]) {
          self.menuItems = menuItems
          super.init(nibName: nil, bundle: nil)
          tableView.register(UITableViewCell.self,
                             forCellReuseIdentifier: "cell")
      }
    


      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }

      override func viewDidLoad() {
          super.viewDidLoad()
         // tableView.backgroundColor = color
         // view.backgroundColor = color
      }

      // Table

      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return menuItems.count
      }

      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
          cell.textLabel?.textColor = .white
         // cell.backgroundColor = color
         // cell.contentView.backgroundColor = color
        cell.textLabel?.textColor = .black;
        switch indexPath.row {
              case 0:
                  cell.backgroundColor = .link
                   self.tableView.rowHeight = 60
         

              default:
                 cell.backgroundColor = .white
          }
        cell.imageView?.image = devCousesImages[indexPath.row]
        
        
          return cell
      }

      override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
          // Relay to delegate about menu item selection
        
          let selectedItem = menuItems[indexPath.row]
          delegate?.didSelectMenuItem(named: selectedItem)
      }
    
    

  }
