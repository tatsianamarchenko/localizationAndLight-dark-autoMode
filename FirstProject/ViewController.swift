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
    image.tintColor = UIColor(named: "Color")
    return image
  }()
  
  var lenguagePicker : UIPickerView = {
    var picker = UIPickerView()
    return picker
  }()

  var lightAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("light", for: .normal)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitleColor(.systemMint, for: .highlighted)
    button.addTarget(self, action: #selector(lightMode), for: .touchUpInside)
    return button
  }()

  @objc func lightMode () {
    overrideUserInterfaceStyle = .light
  }

  var darkAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("dark", for: .normal)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitleColor(.systemMint, for: .highlighted)
    button.addTarget(self, action: #selector(darkMode), for: .touchUpInside)
    return button
  }()

  @objc func darkMode () {
    overrideUserInterfaceStyle = .dark
  }

  var unspecifiedAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("unspecified", for: .normal)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitleColor(.systemMint, for: .highlighted)
    button.addTarget(self, action: #selector(unspecifiedMode), for: .touchUpInside)
    return button
  }()

  @objc func unspecifiedMode () {
    overrideUserInterfaceStyle = .unspecified
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    //
    greeting.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
    image.frame = CGRect(x: 100, y: 300, width: 300, height: 300)
    lenguagePicker.frame = CGRect(x: 10, y: 200, width: 100, height: 100)
    lightAppearanceButton.frame = CGRect(x: 30, y: 400, width: 50, height: 50)
    darkAppearanceButton.frame = CGRect(x: lightAppearanceButton.center.x + 30, y: 400, width: 50, height: 50)
    unspecifiedAppearanceButton.frame = CGRect(x: darkAppearanceButton.center.x + 30, y: 400, width: 50, height: 50)
    //
    lenguagePicker.dataSource = self
    lenguagePicker.delegate = self
    
    view.addSubview(greeting)
    view.addSubview(image)
    view.addSubview(lenguagePicker)
    view.addSubview(lightAppearanceButton)
    view.addSubview(darkAppearanceButton)
    view.addSubview(unspecifiedAppearanceButton)
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

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch row {
    case 0 :   greeting.text = "Hello, Good morning, Good afternoon, Good evening, It is nice to meet you, It is a pleasure to meet you"
    case 1 :   greeting.text = "Прывет, Добрай раніцы, Добры дзень, Добрага вечара, Добрай ночы!"
    case 2 :   greeting.text = "Здравствуйте, Приветствую, Добрый день, Доброе утро, Добрый вечер"
    default:
      break
    }
  }
}
