//
//  ViewController.swift
//  SliderProject
//
//  Created by Omer Keskin on 9.07.2024.
//


import UIKit

class ViewController: UIViewController {

    let imageView = UIImageView(image: .dragon)
    let slider = UISlider()
    let valueLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .white


        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .green
        view.addSubview(imageView)


        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.value = 0
        slider.thumbTintColor = .blue
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        view.addSubview(slider)
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        valueLabel.text = "Value: 0"
        view.addSubview(valueLabel)


        NSLayoutConstraint.activate([

            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),

            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            slider.widthAnchor.constraint(equalToConstant: 250),
            
            valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             valueLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 20),
             valueLabel.widthAnchor.constraint(equalToConstant: 100),
             valueLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    @objc func sliderValueChanged(_ sender: UISlider) {
        let sliderValue = sender.value
        let percentage = CGFloat(sliderValue / slider.maximumValue)
        let color = UIColor(red: percentage, green: 1 - percentage, blue: 0, alpha: 1)
        imageView.backgroundColor = color
        slider.minimumTrackTintColor = color
        
        print("Slider Value: \(Int(sliderValue))")
        valueLabel.text = "Value: \(Int(sliderValue))"
    }
}

