//
//  uswMakeSchedule.swift
//  uswTimeVersion1.0
//
//  Created by 한지석 on 2021/12/24.
//

import UIKit

class uswMakeSchedule: UIViewController {
    
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var semeTextField: UITextField!
    
    let yearList = ["2022", "2023", "2024"]
    let semeList = ["1", "2"]
    
    var yearPickerView = UIPickerView()
    var semePickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yearTextField.inputView = yearPickerView
        semeTextField.inputView = semePickerView
        //123
        yearTextField.placeholder = "20XX"
        semeTextField.placeholder = "X"
        
        yearTextField.textAlignment = .center
        semeTextField.textAlignment = .center
        
        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        semePickerView.delegate = self
        semePickerView.dataSource = self
        
        yearPickerView.tag = 1
        semePickerView.tag = 2
    }
}

extension uswMakeSchedule: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return yearList.count
        case 2:
            return semeList.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 1:
            return yearList[row]
        case 2:
            return semeList[row]
        default:
            return "데이터를 입력하세요."
        }
    }
    
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      switch pickerView.tag{
      case 1:
          yearTextField.text = yearList[row]
          yearTextField.resignFirstResponder()
      case 2:
          semeTextField.text = semeList[row]
          semeTextField.resignFirstResponder()
      default:
          return 
      }
}
    
}
