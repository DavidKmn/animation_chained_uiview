//
//  ViewController.swift
//  ChainedAnimationsDemo
//
//  Created by David on 30/03/2018.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel = UILabel()

    let bodyLabel = UILabel()
    
    fileprivate func setupLabels() {
        titleLabel.text = "Welcom to Company XYZ"
        titleLabel.font = UIFont(name: "Futura", size: 34)
        titleLabel.numberOfLines = 0
        
        bodyLabel.text = "Hey There! Thank you for downloading our application and so much for the support you hav egiven us, good reviews on the App Store can take us to profitability."
        bodyLabel.numberOfLines = 0
    }
    
    fileprivate func setupStackView() {
        setupLabels()
        
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLabels()
        setupStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
        
    }

    @objc fileprivate func handleTapAnimation() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
    }
}

