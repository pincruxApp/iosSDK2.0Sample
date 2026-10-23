//
//  PubkeyViewController.swift
//  PincruxSwiftCategorySample
//
//  PincruxSwiftSample 의 Pub Key 입력 화면과 같은 구성.
//  입력한 Pub Key 는 기기에 저장해 두었다가 다음 실행 때 자동으로 채워 준다.
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
        let categoryVC = self.storyboard?.instantiateViewController(withIdentifier: "categoryVC") as? ViewController ?? ViewController()
        categoryVC.pubkey = pubkeyfeild.text ?? ""
        self.navigationController?.pushViewController(categoryVC, animated: true)
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
