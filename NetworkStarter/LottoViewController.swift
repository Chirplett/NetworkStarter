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
    
    private let infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = "당첨번호 안내"
        infoLabel.font = .systemFont(ofSize: 14, weight: .medium)
        infoLabel.textColor = .black
        return infoLabel
    }()
    
    private let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = "2025-05-30 추첨"
        dateLabel.font = .systemFont(ofSize: 12, weight: .regular)
        dateLabel.textColor = .gray
        return dateLabel
        
    }()
    
    private let dividerLineView: UIView = {
        let dividerLineView = UIView()
        dividerLineView.backgroundColor = .gray
        return dividerLineView
        
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
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(dividerLineView)
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
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(drawNumberTextField.snp.bottom).offset(24)
            make.leading.equalTo(drawNumberTextField.snp.leading)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(infoLabel)
            make.trailing.equalTo(drawNumberTextField.snp.trailing)
        }
        
        dividerLineView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(14)
            make.horizontalEdges.equalTo(drawNumberTextField)
            make.height.equalTo(0.2)
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
