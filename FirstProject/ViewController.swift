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
    text.translatesAutoresizingMaskIntoConstraints = false
    text.textAlignment = .center
    text.numberOfLines = 0
    text.text = "Выберите язык приветствия"
    return text
  }()

  var image : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "baseline_pets")
    image.translatesAutoresizingMaskIntoConstraints = false
    image.tintColor = UIColor(named: "Color")
    return image
  }()
  
  var lenguagePicker : UIPickerView = {
    var picker = UIPickerView()
    picker.translatesAutoresizingMaskIntoConstraints = false
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

    lenguagePicker.dataSource = self
    lenguagePicker.delegate = self
    
    view.addSubview(greeting)
    view.addSubview(image)
    view.addSubview(lenguagePicker)
    view.addSubview(lightAppearanceButton)
    view.addSubview(darkAppearanceButton)
    view.addSubview(unspecifiedAppearanceButton)

    createGreetingConstraint()
    createImageConstraint()
    createLenguagePickereConstraint()
    createButtonsConstraint()
  }

  func createGreetingConstraint () {
    greeting.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
    greeting.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    greeting.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
  }

  func createImageConstraint () {
    image.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
    image.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -530).isActive = true
    image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    image.topAnchor.constraint(equalTo: greeting.bottomAnchor, constant: 10).isActive = true
  }

  func createLenguagePickereConstraint () {
    lenguagePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    lenguagePicker.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
  }

  func createButtonsConstraint () {
    lightAppearanceButton.topAnchor.constraint(equalTo: lenguagePicker.bottomAnchor, constant: 10).isActive = true
    lightAppearanceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    darkAppearanceButton.topAnchor.constraint(equalTo: lightAppearanceButton.bottomAnchor, constant: 10).isActive = true
    darkAppearanceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    unspecifiedAppearanceButton.topAnchor.constraint(equalTo: darkAppearanceButton.bottomAnchor, constant: 10).isActive = true
    unspecifiedAppearanceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
