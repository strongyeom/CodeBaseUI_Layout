//
//  ExampleThreeViewController.swift
//  CodeBaseUI_Layout
//
//  Created by 염성필 on 2023/08/22.
//

import UIKit
import SnapKit

// 세번째 View를 보면 view안에 Label이 중복되는데 함수를 만들어서 재사용 할 수 있는 방법은 없을까?

class ExampleThreeViewController: UIViewController {
    
    let firstView = configureLabelInView(inputText: "지금은 9도 에요 1m/s의 바람이 불어요 1m/s의 바람이 불어요")
    let secondView = configureLabelInView(inputText: "78도 만큼 습해요 1m/s의 바람이 불어요")
    let thirdView = configureLabelInView(inputText: "1m/s의 바람이 불어요 1m/s의 바람이 불어요")
    let fourthView = configureLabelInView(inputText: "오늘도 행복한 하루 보내세요보내세요보내세요")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [firstView, secondView, thirdView, fourthView].forEach {
            view.addSubview($0)
        }
        
        firstView.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.lessThanOrEqualTo(view).inset(20)
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(20)
            make.leading.equalTo(firstView.snp.leading)
            make.trailing.lessThanOrEqualTo(view).inset(20)
        }
        
        thirdView.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.bottom).offset(20)
            make.leading.equalTo(firstView.snp.leading)
            make.trailing.lessThanOrEqualTo(view).inset(20)
        }
        
        fourthView.snp.makeConstraints { make in
            make.top.equalTo(thirdView.snp.bottom).offset(20)
            make.leading.equalTo(firstView.snp.leading)
            // 스토리보드에서는 greatThan: 최소 해당 constant만큼은 확보해야한다. lessThan: 해당 constant부터 시작해라
            // ‼️ But 코드로 짜게 되면 역전하게 됨 greatThan: 해당 constant부터 시작, lessThan: 최소 해당 constants까지는 확보해라
            make.trailing.lessThanOrEqualTo(view).inset(20)
        }
        
        

        view.backgroundColor = .systemMint
    }
    
   static func configureLabelInView(inputText: String) -> UIView {
        
        let text = {
           let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 20)
            label.text = inputText
            label.numberOfLines = 0
            return label
        }()
        
        let containerView = UIView()
       containerView.backgroundColor = .white
       containerView.layer.cornerRadius = 8
       containerView.clipsToBounds = true

        containerView.addSubview(text)
        
        text.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }

        
        return containerView
    }

}
