//
//  ViewController.swift
//  PincruxSwiftCategorySample
//
//  Created by Melo on 2/7/25.
//

import UIKit
import PincruxOfferwall

class ViewController: UIViewController {
    @IBOutlet weak var financePointLabel: UILabel!
    @IBOutlet weak var cpaPointLabel: UILabel!
    @IBOutlet weak var socialPointLabel: UILabel!
    @IBOutlet weak var cpsPointLabel: UILabel!
    
    @IBOutlet weak var financeButton: UIButton!
    @IBOutlet weak var cpaButton: UIButton!
    @IBOutlet weak var socialButton: UIButton!
    @IBOutlet weak var cpsButton: UIButton!
    
    var offerwall : PincruxOfferwallSDK?
    let pubkey = "911872" // TODO: (필수) 핀크럭스에서 발급 받은 매체 고유 키 입력
    let userkey = "test_user" // TODO: (필수) 매체에서 핀크럭스에게 제공할 유저 고유 키 입력
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 현재 적립 가능한 포인트 호출
        initOfferwall()
        offerwall?.pointDelegate = self
        offerwall?.getAdPoint(pubkey)
    }

    @IBAction func financeButtonClick(_ sender: Any) {
        initOfferwall()
        startOfferwall(.Finance)
    }
    
    @IBAction func cpaButtonClick(_ sender: Any) {
        initOfferwall()
        startOfferwall(.CPA)
    }
    
    @IBAction func socialButtonClick(_ sender: Any) {
        initOfferwall()
        startOfferwall(.Social)
    }
    
    @IBAction func cpsButtonClick(_ sender: Any) {
        initOfferwall()
        startOfferwall(.CPS)
    }
    
    func initOfferwall() {
        self.offerwall = PincruxOfferwallSDK.initWithPubkeyAndUsrkey(pubkey, userkey)
        self.offerwall?.setDarkMode(.LIGHT_ONLY)
        self.offerwall?.setAdDetail(true)
        self.offerwall?.setEnableScrollTopButton(true)
        self.offerwall?.setEnableTab(true)
    }
    
    func startOfferwall(_ category: OfferwallCategory) {
        offerwall?.setOfferwallCategory(category)
        offerwall?.startOfferwall(vc: self)
    }
}

extension ViewController: OfferwallPointDelegate {
    func getAdPoint(_ point: OfferwallPointItems) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        DispatchQueue.main.async {
            self.financePointLabel.text = "\(numberFormatter.string(for: point.financeCoin)!)P"
            self.cpaPointLabel.text = "\(numberFormatter.string(for: point.cpaCoin)!)P"
            self.socialPointLabel.text = "\(numberFormatter.string(for: point.socialCoin)!)P"
            self.cpsPointLabel.text = "\(numberFormatter.string(for: point.cpsCoin)!)P"
        }
    }
}
