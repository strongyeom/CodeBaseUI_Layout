//
//  ExampleOneViewController.swift
//  CodeBaseUI_Layout
//
//  Created by 염성필 on 2023/08/22.
//

import UIKit
import SnapKit

class ExampleOneViewController: UIViewController {
    
    let topView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let titleTextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "제목을 입력해주세요"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15)
        return textField
    }()
    
    let calendarTextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = "달력을 입력해주세요"
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 15)
        return textField
    }()
    
    let bottomView = {
        let view = UIView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    lazy var stackView = {
       let stack = UIStackView(arrangedSubviews: [titleTextField, calendarTextField])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        [topView, stackView, bottomView].forEach {
            view.addSubview($0)
        }
        
        topView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(100)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        
        
    }
}
