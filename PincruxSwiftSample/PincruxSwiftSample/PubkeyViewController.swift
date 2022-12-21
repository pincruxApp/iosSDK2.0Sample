//
//  PubkeyViewController.swift
//  PincruxSwiftSample
//
//  Created by K_JINY on 2022/07/22.
//

import UIKit

class PubkeyViewController: UIViewController {
    @IBOutlet weak var pubkeyfeild: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pubkeyfeild.text = getCustomKey()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtt(_ sender: Any) {
        self.view.endEditing(true)
        setCustomKey(pubkeyfeild.text ?? "")
        let setOfferwallVC = self.storyboard?.instantiateViewController(withIdentifier: "setOfferwallVC") as? SettingViewController ?? SettingViewController()
        setOfferwallVC.pubkey = pubkeyfeild.text ?? ""
        self.navigationController?.pushViewController(setOfferwallVC, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setCustomKey(_ key: String) {
        if key.count == 0 { return }
        UserDefaults.standard.setValue(key, forKey: "offerwallPubKey")
    }
    
    func getCustomKey() -> String {
        guard let customKey = UserDefaults.standard.string(forKey: "offerwallPubKey") else {
            return ""
        }
        return customKey
    }
}
