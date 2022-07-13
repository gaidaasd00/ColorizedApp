//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Алексей Гайдуков on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLable: UILabel!
    @IBOutlet var greenLable: UILabel!
    @IBOutlet var blueLable: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var delegate: ViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorView.layer.cornerRadius = 15

        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue

        settingColorView()
        setupLable()
        colorView.backgroundColor = viewColor
        
        settingTextField(for: redTF, greenTF, blueTF)

        redLable.text = string(from: redSlider)
        greenLable.text = string(from: greenSlider)
        blueLable.text = string(from: blueSlider)

    }

    @IBAction func rgbSlider(_ sender: UISlider) {
        settingColorView()
        argumentTransfer()

        switch sender {
        case redSlider:
            redLable.text = string(from: redSlider)
        case greenSlider:
            greenLable.text = string(from: greenSlider)
        default:
            blueLable.text = string(from: blueSlider)
        }




    }
    @IBAction func doneButton() {
        delegate?.setColor(colorView.backgroundColor ?? .blue)
        dismiss(animated: true)
    }
    
}

// MARK: - Private Methods
extension ViewController {
    
    private func settingColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    
    private func setupLable() {
        redLable.text = String(redSlider.value)
        greenLable.text = String(greenSlider.value)
        blueLable.text = String(blueSlider.value)
    }
    
    private func argumentTransfer() {
        redLable.text = "\(redSlider.value)"
        greenLable.text = "\(greenSlider.value)"
        blueLable.text = "\(blueSlider.value)"
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    //настройка TextField
    
    private func settingTextField(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF:
                textField.text = string(from: redSlider)
            case greenTF:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
    
}
