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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        settingColorView()
        setupLable()
        
        redLable.text = string(from: redSlider)
        greenLable.text = string(from: greenSlider)
        blueLable.text = string(from: blueSlider)
        
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        settingColorView()
        argumentTransfer()
        
        redLable.text = string(from: redSlider)
        greenLable.text = string(from: greenSlider)
        blueLable.text = string(from: blueSlider)
        
    }
    
    
    // MARK: - Private Methods
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
}

