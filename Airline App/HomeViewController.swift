//
//  ViewController.swift
//  Airline App
//
//  Created by Thariq Zhafran Satyagraha on 25/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        setupButton()
    }

    func setupButton() {
        view.addSubview(nextButton)

        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemBlue
        nextButton.configuration?.title = "Fetch Data"

        nextButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
