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
    image.translatesAutoresizingMaskIntoConstraints = false
    image.tintColor = UIColor(named: "Color")
    return image
  }()

  var accessButton : UIButton = {
    var button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(UIImage(systemName: "lock"), for: .normal)
    button.tintColor = UIColor(named: "Color")
    button.addTarget(self, action: #selector(accessChangeLanguage), for: .touchUpInside)
    return button
  }()

  var lenguagePicker : UIPickerView = {
    var picker = UIPickerView()
    picker.isUserInteractionEnabled = false
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()

  var lightAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.setTitle("light", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitleColor(.systemMint, for: .highlighted)
    button.widthAnchor.constraint(equalToConstant: 80).isActive = true
    button.addTarget(self, action: #selector(lightMode), for: .touchUpInside)
    return button
  }()

  var darkAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.setTitle("dark", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitleColor(.systemMint, for: .highlighted)
    button.widthAnchor.constraint(equalToConstant: 80).isActive = true
    button.addTarget(self, action: #selector(darkMode), for: .touchUpInside)
    return button
  }()

  var unspecifiedAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("default", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitleColor(.systemMint, for: .highlighted)
    button.widthAnchor.constraint(equalToConstant: 80).isActive = true
    button.addTarget(self, action: #selector(unspecifiedMode), for: .touchUpInside)
    return button
  }()

  @objc func accessChangeLanguage () {
    if  !lenguagePicker.isUserInteractionEnabled {
      lenguagePicker.isUserInteractionEnabled = true
      accessButton.setBackgroundImage(UIImage(systemName: "lock.open"), for: .normal)
    }
    else {
      lenguagePicker.isUserInteractionEnabled = false
      greeting.text = "Выберите язык приветствия"
      accessButton.setBackgroundImage(UIImage(systemName: "lock"), for: .normal)
    }
  }

  @objc func lightMode () {
    overrideUserInterfaceStyle = .light
  }

  @objc func darkMode () {
    overrideUserInterfaceStyle = .dark
  }

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
    view.addSubview(accessButton)
    view.addSubview(lenguagePicker)
    view.addSubview(lightAppearanceButton)
    view.addSubview(darkAppearanceButton)
    view.addSubview(unspecifiedAppearanceButton)

    elementsConfig(view: greeting)
    elementsConfig(view: lightAppearanceButton)
    elementsConfig(view: darkAppearanceButton)
    elementsConfig(view: unspecifiedAppearanceButton)

    createGreetingConstraint()
    createImageConstraint()
    createAccessButtonConstraint()
    createLenguagePickereConstraint()
    createButtonsConstraint()
  }

  func createGreetingConstraint () {
    greeting.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
    greeting.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    greeting.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
  }

  func createAccessButtonConstraint () {
    accessButton.topAnchor.constraint(equalTo: greeting.bottomAnchor, constant: 10).isActive = true
    accessButton.widthAnchor.constraint(equalTo: image.widthAnchor, constant: 10).isActive = true
    accessButton.heightAnchor.constraint(equalTo: image.heightAnchor, constant: 10).isActive = true
    accessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }

  func createImageConstraint () {
    image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    image.topAnchor.constraint(equalTo: accessButton.bottomAnchor, constant: 10).isActive = true
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

  func elementsConfig (view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGray6
    view.layer.masksToBounds = true
    view.layer.cornerRadius = 10
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
