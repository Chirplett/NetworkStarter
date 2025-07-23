//
//  ViewController.swift
//  NetworkStarter
//
//  Created by Jude Song on 7/23/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let goToLottoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Lotto", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.backgroundColor = UIColor.white.cgColor
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        
    }
    
    @objc
    private func goToLottoButtonTapped(_ sender: UIButton) {
        let viewController = LottoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ViewController: ViewDesignProtocol {
    
    func configureHierarchy() {
        view.addSubview(goToLottoButton)
    }
    
    func configureView() {
        view.backgroundColor = .white
        goToLottoButton.addTarget(self, action: #selector(goToLottoButtonTapped), for: .touchUpInside)
    }
    
    func configureLayout() {
        goToLottoButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    
   


}

