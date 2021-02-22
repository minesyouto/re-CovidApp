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
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 950)
        view.addSubview(scrollView)
        
        let calendar = FSCalendar()
        calendar.frame = CGRect(x: 20, y: 10, width: view.frame.size.width - 40, height: 300)
        scrollView.addSubview(calendar)
        calendar.appearance.headerTitleColor = colors.bluePurple
        calendar.appearance.weekdayTextColor = colors.bluePurple
        calendar.delegate = self
        
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
        
        let resultButton = UIButton(type: .system)
        resultButton.frame = CGRect(x: 0, y: 820, width: 200, height: 40)
        resultButton.center.x = scrollView.center.x
        resultButton.titleLabel?.font = .systemFont(ofSize: 20)
        resultButton.layer.cornerRadius = 5
        resultButton.setTitle("診断完了", for: .normal)
        resultButton.setTitleColor(colors.white, for: .normal)
        resultButton.backgroundColor = colors.blue
        resultButton.addTarget(self, action: #selector(resultButtonAction), for: [.touchUpInside, .touchUpOutside])
        scrollView.addSubview(resultButton)
    }
    @objc func resultButtonAction() {
        print("resultButtonTapped")
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
extension HealthCheckViewController: FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        return .clear
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderDefaultColorFor date: Date) -> UIColor? {
        if dateFormatter(day: date) == dateFormatter(day: Date()) {
        return colors.bluePurple
    }
        return .clear
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderRadiusFor date: Date) -> CGFloat {
        return 0.5
    }
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        return colors.black
    }
    
    func dateFormatter(day: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: day)
    }
    
}

