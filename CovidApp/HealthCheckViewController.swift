//
//  HealthCheckViewController.swift
//  CovidApp
//
//  Created by みねた on 2021/02/21.
//

import UIKit
import FSCalendar

class HealthCheckViewController: UIViewController {
    
    let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGroupedBackground
        
        let scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        view.addSubview(scrollView)
        
        let calendar = FSCalendar()
        calendar.frame = CGRect(x: 20, y: 10, width: view.frame.size.width - 40, height: 300)
        scrollView.addSubview(calendar)
        
        let checkLabel = UILabel()
        
        checkLabel.text = "要チェック"
        checkLabel.textColor = colors.white
        checkLabel.frame = CGRect(x: 0, y: 340, width: view.frame.size.width, height: 21)
        checkLabel.backgroundColor = colors.blue
        checkLabel.textAlignment = .center
        checkLabel.center.x = view.center.x
        scrollView.addSubview(checkLabel)
        
        let uiview1 = createView(y: 380)
        scrollView.addSubview(uiview1)
        createimage(parentView: uiview1, imageName: "check1")
        createLabel(parentView: uiview1, text: "37.5度以上の熱がある")
        createUISwitch(parentView: uiview1, action: #selector(switchAction))
        let uiview2 = createView(y: 465)
        scrollView.addSubview(uiview2)
        createimage(parentView: uiview2, imageName: "check2")
        createLabel(parentView: uiview2, text: "のどの痛みがある")
        createUISwitch(parentView: uiview2, action: #selector(switchAction))
        let uiview3 = createView(y: 550)
        scrollView.addSubview(uiview3)
        createimage(parentView: uiview3, imageName: "check3")
        createLabel(parentView: uiview3, text: "匂いを感じない")
        createUISwitch(parentView: uiview3, action: #selector(switchAction))
        let uiview4 = createView(y: 635)
        scrollView.addSubview(uiview4)
        createimage(parentView: uiview4, imageName: "check4")
        createLabel(parentView: uiview4, text: "味が薄く感じる")
        createUISwitch(parentView: uiview4, action: #selector(switchAction))
        let uiview5 = createView(y: 720)
        scrollView.addSubview(uiview5)
        createimage(parentView: uiview5, imageName: "check5")
        createLabel(parentView: uiview5, text: "だるさがある")
        createUISwitch(parentView: uiview5, action: #selector(switchAction))
        
    }
    
    @objc func switchAction(sender: UISwitch) {
        if sender.isOn {
            print("on")
        } else {
            print("off")
        }
    }
    
    func createUISwitch(parentView: UIView, action: Selector) {
        let uiSwitch = UISwitch()
        uiSwitch.frame = CGRect(x: parentView.frame.size.width - 60, y: 20, width: 50, height: 30)
        uiSwitch.addTarget(self, action: action, for: .valueChanged)
        parentView.addSubview(uiSwitch)
    }
    
    func createLabel(parentView: UIView, text: String) {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: 60, y: 15, width: 200, height: 40)
        parentView.addSubview(label)
    }
    
    func createimage(parentView: UIView, imageName: String) {
        let imageview = UIImageView()
        imageview.image = UIImage(named: imageName)
        imageview.frame = CGRect(x: 10, y: 12, width: 40, height: 40)
        parentView.addSubview(imageview)
    
    }
    
    func createView(y: CGFloat) -> UIView {
        let uiview = UIView()
        uiview.frame = CGRect(x: 20, y: y, width: view.frame.size.width - 40, height: 70)
        uiview.backgroundColor = .white
        uiview.layer.cornerRadius = 20
        uiview.layer.shadowColor = UIColor.black.cgColor
        uiview.layer.shadowOpacity = 0.3
        uiview.layer.shadowRadius = 4
        uiview.layer.shadowOffset = CGSize(width: 0, height: 2)
        return uiview
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
