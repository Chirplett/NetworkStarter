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
        
        let drawNumberTextField = UITextField()
        drawNumberTextField.borderStyle = .roundedRect
        drawNumberTextField.placeholder = "회차를 선택해 주세요"
        drawNumberTextField.textAlignment = .center
        return drawNumberTextField
        
    }()
    
    private let drawNumberPickerView: UIPickerView = {
        let drawNumberPickerView = UIPickerView()
        return drawNumberPickerView
        
    }()
    
    private let drawNumbers = {
        var numbers: [Int] = []
        for number in 1...1181 {
            numbers.append(number)
        }
        return numbers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawNumberPickerView.delegate = self
        drawNumberPickerView.dataSource = self
        drawNumberTextField.inputView = drawNumberPickerView
        
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

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return drawNumbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(drawNumbers[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedNumber = drawNumbers[row]
        drawNumberTextField.text = "\(selectedNumber)"
        view.endEditing(true)
    }
    
    
}
