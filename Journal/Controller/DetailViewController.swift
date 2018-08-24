

import UIKit

class DetailViewController: UIViewController {
    @IBAction func clearButton(_ sender: Any) {
        theTextView.text = ""
        theTextfield.text = ""
    }
    
    var entries: Entry?
    
    @IBOutlet weak var theTextfield: UITextField!
    @IBOutlet weak var theTextView: UITextView!
    
    
    @IBAction func addEntryTextButton(_ sender: Any) {
        if theTextfield.text != "", theTextView.text != "" {
       guard let title = theTextfield.text,
        let bodyText = theTextView.text else {return}
            
            if let entry = entries {
                EntryController.shared.update(entry: entry, title: title, bodyText: bodyText)
            } else {
            EntryController.shared.createEntry(title: title, bodyText: bodyText)
            }
//            theTextfield.text = ""
//            theTextView.text = ""
            
        }
        self.navigationController?.popViewController(animated: true)

    }
    
    func updateView() {
        guard let entry = entries else {return}
        theTextView.text = entry.bodyText
        theTextfield.text = entry.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
}
