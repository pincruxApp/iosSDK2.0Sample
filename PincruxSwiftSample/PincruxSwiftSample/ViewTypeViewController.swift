//
//  ViewTypeViewController.swift
//  SwiftSample
//
//  Created by K_JINY on 2022/07/21.
//

import Foundation
import UIKit
import PincruxOfferwall

class ViewTypeViewController: UIViewController {
    var offerwallSettingVC : SettingViewController?
    @IBOutlet weak var customView: UIView!
    var off : PincruxOfferwallSDK? = nil
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "Offerwall"
        
        off?.viewtypeDelegate = self
        guard let setting = offerwallSettingVC else { return }
        setting.settingAndStart(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(enterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    
    @objc func enterForeground() {
        self.off?.enterForeground()
    }
}

extension ViewTypeViewController: OfferwallViewTypeDelegate {
    func offerwallReqClose() { }
    
    func offerwallReceived(_ offerwallView: UIView) {
        self.customView.addSubview(offerwallView)
        offerwallView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: offerwallView, attribute: .top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: offerwallView.superview, attribute: .top, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: offerwallView, attribute: .leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: offerwallView.superview, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: offerwallView, attribute: .trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: offerwallView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: offerwallView, attribute: .bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: offerwallView.superview, attribute: .bottom, multiplier: 1, constant: 0)

        offerwallView.superview?.addConstraints([topConstraint, leadingConstraint, bottomConstraint, trailingConstraint])
    }
    
    func offerwallInitSuccess() {
        print("offerwallInitSuccess")
    }
    
    func offerwallInitFailed(_ errCode: Int) {
        print("offerwallInitFailed")
    }
}
