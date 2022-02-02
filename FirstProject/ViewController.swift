//
//  ViewController.swift
//  FirstProject
//
//  Created by Tatsiana Marchanka on 2.02.22.
//

import UIKit

class ViewController: UIViewController {

  var languagesArray = ["English", "Беларуская", "Русский"]

  var greeting : UILabel = {
    var text = UILabel()
    text.font = .boldSystemFont(ofSize: 20)
    text.textAlignment = .center
    text.numberOfLines = 0
    text.text = "Выберите язык приветствия"
    return text
  }()

  var image : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "baseline_pets")
    return image
  }()

  var lenguagePicker : UIPickerView = {
    var picker = UIPickerView()
    return picker
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    lenguagePicker.dataSource = self
    lenguagePicker.delegate = self
    //
    greeting.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
    image.frame = CGRect(x: 100, y: 300, width: 300, height: 300)
    lenguagePicker.frame = CGRect(x: 10, y: 200, width: 100, height: 100)
    //
    view.addSubview(greeting)
    view.addSubview(image)
    view.addSubview(lenguagePicker)
  }


}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    3
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return languagesArray[row]
  }
}
