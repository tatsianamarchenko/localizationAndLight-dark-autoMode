//
//  ViewController.swift
//  FirstProject
//
//  Created by Tatsiana Marchanka on 2.02.22.
//

import UIKit

class ViewController: UIViewController {

  var languagesArray = ["English", "Беларуская", "Русский"]
  var languageIndex = 0

  var greeting : UILabel = {
    var text = UILabel()
    text.font = .boldSystemFont(ofSize: 20)
    text.textAlignment = .center
    text.numberOfLines = 0
    text.text = NSLocalizedString("initialMessage", comment: "first message after init")
    return text
  }()

  var image : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "baseline_lock")
    image.translatesAutoresizingMaskIntoConstraints = false
    image.tintColor = UIColor(named: "Color")
    return image
  }()

  var languagePicker : UIPickerView = {
    var picker = UIPickerView()
    picker.isUserInteractionEnabled = false
    picker.isHidden = true
    picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
  }()

  var lightAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.setTitle(NSLocalizedString("lightButton", comment: ""), for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitle("", for: .highlighted )
    button.imageView?.contentMode = .scaleAspectFit
    button.setImage(UIImage(systemName: "lightbulb.fill")?.withTintColor(.systemMint, renderingMode: .alwaysOriginal), for: .highlighted)
    button.addTarget(self, action: #selector(lightMode), for: .touchUpInside)
    return button
  }()

  var darkAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.setTitle(NSLocalizedString("darkButton", comment: ""), for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitle("", for: .highlighted )
    button.imageView?.contentMode = .scaleAspectFit
    button.setImage(UIImage(systemName: "lightbulb.slash.fill")?.withTintColor(.systemMint, renderingMode: .alwaysOriginal), for: .highlighted)
    button.addTarget(self, action: #selector(darkMode), for: .touchUpInside)
    return button
  }()

  var unspecifiedAppearanceButton : UIButton = {
    var button = UIButton(type: .roundedRect)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(NSLocalizedString("unspecifiedButton", comment: ""), for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
    button.setTitleColor(UIColor(named: "Color"), for: .normal)
    button.setTitleColor(.systemMint, for: .highlighted)
    button.addTarget(self, action: #selector(unspecifiedMode), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(accessChangeLanguage))
    image.isUserInteractionEnabled = true
    image.addGestureRecognizer(tapGestureRecognizer)

    languagePicker.dataSource = self
    languagePicker.delegate = self

    view.addSubview(greeting)
    view.addSubview(image)
    view.addSubview(languagePicker)
    view.addSubview(lightAppearanceButton)
    view.addSubview(darkAppearanceButton)
    view.addSubview(unspecifiedAppearanceButton)

    elementsConfig(view: greeting)
    elementsConfig(view: lightAppearanceButton)
    elementsConfig(view: darkAppearanceButton)
    elementsConfig(view: unspecifiedAppearanceButton)

    createGreetingConstraint()
    createImageConstraint()
    createLenguagePickereConstraint()
    createButtonsConstraint()
  }

  func createGreetingConstraint () {
    greeting.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
    greeting.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    greeting.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
  }

  func createImageConstraint () {
    image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    image.widthAnchor.constraint(equalTo: image.heightAnchor, constant: 3).isActive = true
    image.topAnchor.constraint(equalTo: greeting.bottomAnchor, constant: 3).isActive = true
    image.bottomAnchor.constraint(equalTo: languagePicker.topAnchor, constant: 3).isActive = true
  }

  func createLenguagePickereConstraint () {
    languagePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    languagePicker.bottomAnchor.constraint(equalTo: lightAppearanceButton.topAnchor).isActive = true
  }

  func createButtonsConstraint () {
    lightAppearanceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    lightAppearanceButton.trailingAnchor.constraint(equalTo: darkAppearanceButton.leadingAnchor, constant: -30).isActive = true
    lightAppearanceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    darkAppearanceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    darkAppearanceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    darkAppearanceButton.topAnchor.constraint(equalTo: lightAppearanceButton.topAnchor).isActive = true
    darkAppearanceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    unspecifiedAppearanceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    unspecifiedAppearanceButton.topAnchor.constraint(equalTo: lightAppearanceButton.topAnchor).isActive = true
    unspecifiedAppearanceButton.leadingAnchor.constraint(equalTo: darkAppearanceButton.trailingAnchor, constant: 30).isActive = true
    unspecifiedAppearanceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
  }

  func elementsConfig (view: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGray6
    view.layer.masksToBounds = true
    view.layer.cornerRadius = 10
  }

  @objc func accessChangeLanguage () {
    if  !languagePicker.isUserInteractionEnabled {
      languagePicker.isUserInteractionEnabled = true
      languagePicker.isHidden = false
      image.image = UIImage(named: "baseline_lock_open")
      choosedLanguage(row: languageIndex)
    }
    else {
      languagePicker.isUserInteractionEnabled = false
      languagePicker.isHidden = true
      greeting.text = "🔒/🔑"
      image.image = UIImage(named: "baseline_lock")
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

  func choosedLanguage (row: Int) {
    switch row {
    case 0 :
      adaptationOfLocalization(language: "en")
      languageIndex = 0
    case 1 :
      adaptationOfLocalization(language: "be-BY")
      languageIndex = 1
    case 2 : adaptationOfLocalization(language: "ru")
      languageIndex = 2
    default:
      break
    }
   func adaptationOfLocalization (language: String) {
      greeting.text = "greetingPhrase".localized(language)
      lightAppearanceButton.setTitle("lightButton".localized(language), for: .normal)
      darkAppearanceButton.setTitle("darkButton".localized(language), for: .normal)
      unspecifiedAppearanceButton.setTitle("unspecifiedButton".localized(language), for: .normal)
    }
  }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 3
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return languagesArray[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    choosedLanguage(row: row)
  }
}

extension String {
  func localized(_ lang: String) -> String {
    let path = Bundle.main.path(forResource: lang, ofType: "lproj")
    let bundle = Bundle(path: path!)
    return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
  }
}
