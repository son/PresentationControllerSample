//
//  DialogViewController.swift
//  UIPresentationController
//
//  Created by Takeru Sato on 2018/12/19.
//  Copyright © 2018 son. All rights reserved.
//

import UIKit

final class DialogViewController: UIViewController {
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let okButton = UIButton(type: .system)
    private var stackView: UIStackView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addConstraint()
    }
    
    private func setupView() {
        view.backgroundColor = .clear
        
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        titleLabel.text = "Title"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.text = "descriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabeldescriptionLabel"
        descriptionLabel.textColor = .black
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.setTitle("OK", for: .normal)
        okButton.setTitleColor(.blue, for: .normal)
        okButton.titleLabel?.textAlignment = .center
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        
        stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, okButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        containerView.addSubview(stackView)
    }
    
    private func addConstraint() {
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true

        stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
    }
    
    @objc private func okButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension DialogViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DialogPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DialogAnimationController(forPresented: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DialogAnimationController(forPresented: false)
    }
}
