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
    text.text = "Выберите язык приветствия, для этого нажмите на кнопку : 🔒"
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
      picker.isHidden = true
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
      lenguagePicker.isHidden = false
      accessButton.setBackgroundImage(UIImage(systemName: "lock.open"), for: .normal)
    }
    else {
      lenguagePicker.isUserInteractionEnabled = false
      lenguagePicker.isHidden = true
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
    greeting.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
  }

  func createAccessButtonConstraint () {
    accessButton.topAnchor.constraint(equalTo: greeting.bottomAnchor, constant: 3).isActive = true
    accessButton.widthAnchor.constraint(equalTo: image.widthAnchor).isActive = true
    accessButton.heightAnchor.constraint(equalTo: image.heightAnchor).isActive = true
    accessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }

  func createImageConstraint () {
    image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    image.widthAnchor.constraint(equalTo: image.heightAnchor, constant: 3).isActive = true
    image.topAnchor.constraint(equalTo: accessButton.bottomAnchor, constant: 3).isActive = true
    image.bottomAnchor.constraint(equalTo: lenguagePicker.topAnchor, constant: 3).isActive = true
  }

  func createLenguagePickereConstraint () {
    lenguagePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    lenguagePicker.bottomAnchor.constraint(equalTo: lightAppearanceButton.topAnchor).isActive = true
  }

  func createButtonsConstraint () {
    lightAppearanceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    lightAppearanceButton.trailingAnchor.constraint(equalTo: darkAppearanceButton.leadingAnchor, constant: -30).isActive = true
    darkAppearanceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    darkAppearanceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    darkAppearanceButton.topAnchor.constraint(equalTo: lightAppearanceButton.topAnchor).isActive = true
    unspecifiedAppearanceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    unspecifiedAppearanceButton.topAnchor.constraint(equalTo: lightAppearanceButton.topAnchor).isActive = true
    unspecifiedAppearanceButton.leadingAnchor.constraint(equalTo: darkAppearanceButton.trailingAnchor, constant: 30).isActive = true
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
    case 0 :   greeting.text = "Hello, Good morning, Good afternoon, Good evening, It is nice to meet you"
    case 1 :   greeting.text = "Прывет, Добрай раніцы, Добры дзень, Добрага вечара, Добрай ночы!"
    case 2 :   greeting.text = "Здравствуйте, Приветствую, Добрый день, Доброе утро, Добрый вечер"
    default:
      break
    }
  }
}
