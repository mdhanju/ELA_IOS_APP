import Foundation
import UIKit

protocol MenuControllerDelegate
{
    func didSelectMenuItem(named: SideMenuItem)
}




class MenuController: UITableViewController {
    
    
    
    let devCousesImages = [ UIImage(named: "logo")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),
                            UIImage(named: "blue")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "temp")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "humidite_blue"),UIImage(named: "mouvement_blue")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "porte_blue")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "angle")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45)),UIImage(named: "parameter")?.scalePreservingAspectRatio(targetSize: CGSize(width: 45, height: 45))]
    
    
    
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [SideMenuItem]

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
    }
    
    // Table
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
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
