//
//  LottoViewController.swift
//  NetworkStarter
//
//  Created by Jude Song on 7/23/25.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    
    private let drawNumberTextField: UITextField = {
        
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "회차를 선택해 주세요"
        textField.textAlignment = .center
        return textField
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        
    }
    
    
    

}

extension LottoViewController: ViewDesignProtocol {
    
    func configureHierarchy() {
        view.addSubview(drawNumberTextField)
    }
    
    func configureView() {
        navigationItem.title = "Lotto"
        view.backgroundColor = .white
        
    }
    
    func configureLayout() {
        drawNumberTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(44)
        }
    }
    
}
