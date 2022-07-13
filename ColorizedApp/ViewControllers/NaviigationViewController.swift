//
//  NaviigationViewController.swift
//  ColorizedApp
//
//  Created by Алексей Гайдуков on 13.07.2022.
//

import UIKit



class NaviigationViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewVC = segue.destination as? ViewController  else { return }
        viewVC.delegate = self
        viewVC.viewColor = view.backgroundColor
       }
        
}
  
protocol ViewControllerDelegate {
    func setColor(_ color: UIColor)
}

// MARK: ViewDelegate
extension NaviigationViewController: ViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
