//
//  SettingViewController.swift
//  PincruxSwiftSample
//
//  Created by K_JINY on 2022/07/22.
//

import UIKit
import PincruxOfferwall

class SettingViewController: UIViewController {
    var offerwall : PincruxOfferwallSDK?
    var pubkey = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func initOfferwall() {
        self.offerwall = PincruxOfferwallSDK.initWithPubkeyAndUsrkey(pubkey, "pincrux_test")
    }
    
    @IBAction func modalBarLandStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.BAR_TYPE)
        offerwall?.setViewControllerType(.Modal)
        offerwall?.setOrientationLandscape(true)
        settingAndStart(self)
    }
    
    @IBAction func pushBarStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.BAR_TYPE)
        offerwall?.setViewControllerType(.NavigationPush)
        settingAndStart(self)
    }
    
    @IBAction func pushPremiumStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.PREMIUM_TYPE)
        offerwall?.setViewControllerType(.NavigationPush)
        settingAndStart(self)
    }
    
    @IBAction func modalBarStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.BAR_TYPE)
        offerwall?.setViewControllerType(.Modal)
        settingAndStart(self)
    }
    
    @IBAction func modalPremiumStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.PREMIUM_TYPE)
        offerwall?.setViewControllerType(.Modal)
        settingAndStart(self)
    }
    
    @IBAction func viewBarStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.BAR_TYPE)
        offerwall?.setViewControllerType(.ViewType)
        viewTypeStart()
    }
    
    @IBAction func pushBarPremiumStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.BAR_PREMIUM_TYPE)
        offerwall?.setViewControllerType(.NavigationPush)
        settingAndStart(self)
    }
    
    @IBAction func modalBarPremiumStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.BAR_PREMIUM_TYPE)
        offerwall?.setViewControllerType(.Modal)
        settingAndStart(self)
    }
    
    @IBAction func viewBarPremiumStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.BAR_PREMIUM_TYPE)
        offerwall?.setViewControllerType(.ViewType)
        viewTypeStart()
    }
    
    @IBAction func viewPremiumStart(_ sender: Any) {
        initOfferwall()
        offerwall?.setOfferwallType(.PREMIUM_TYPE)
        offerwall?.setViewControllerType(.ViewType)
        viewTypeStart()
    }
    
    func viewTypeStart() {
        let viewtypeVC = self.storyboard?.instantiateViewController(withIdentifier: "viewTypeVC") as? ViewTypeViewController ?? ViewTypeViewController()
        viewtypeVC.offerwallSettingVC = self
        viewtypeVC.off = self.offerwall
        self.navigationController?.pushViewController(viewtypeVC, animated: true)
    }
    
    func settingAndStart(_ startVC: UIViewController) {
        // Make tabs visible.
        offerwall?.setEnableTab(true)
        // Show the scroll button to the top.
        offerwall?.setEnableScrollTopButton(true)
        // Enables access to the advertisement detail page.
        offerwall?.setAdDetail(true)
        // Set a custom title for the Offerwall.
        offerwall?.setOfferwallTitle("Offerwall")
        // Set a custom color for the Offerwall.
        offerwall?.setThemeColor("")
        // Running an offerwall in Unity
        offerwall?.setUnityOfferwall(false)
        // Disable CPS.
        offerwall?.setDisableCPS(false)
        // Set dark mode.
        offerwall?.setDarkMode(.LIGHT_ONLY)
        
        offerwall?.startOfferwall(vc: startVC)
    }
}
