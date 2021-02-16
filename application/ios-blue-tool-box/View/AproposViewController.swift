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
        
        self.view.addSubview(githubText)
        self.view.bringSubviewToFront(githubText)
        
        
    }
    
    
}
