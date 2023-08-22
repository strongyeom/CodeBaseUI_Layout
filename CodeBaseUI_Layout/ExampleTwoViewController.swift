//
//  ExampleTwoViewController.swift
//  CodeBaseUI_Layout
//
//  Created by 염성필 on 2023/08/22.
//

import UIKit
import SnapKit

class ExampleTwoViewController: UIViewController {
    
    let backImageView = {
        let image = UIImageView()
        image.backgroundColor = .yellow
        image.contentMode = .scaleToFill
        return image
    }()
    
    let lineView = {
       let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let elementButton = {
        let button = UIButton()
        button.configuration = configureButton(title: "예시 1")
        return button
    }()
    
    let element2Button = {
        let button = UIButton()
        button.configuration = configureButton(title: "예시 2")
        return button
    }()
    
    let element3Button = {
        let button = UIButton()
        button.configuration = configureButton(title: "예시 3")
        return button
    }()
    
    
    lazy var elementStackView = {
        let stack = UIStackView(arrangedSubviews: [elementButton, element2Button, element3Button])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    let posterImage = {
       let image = UIImageView()
       // image.frame.size = CGSize(width: 100, height: 100)
        image.backgroundColor = .green
        image.clipsToBounds = true
        return image
    }()
    
    let posterLabel = {
       let label = UILabel()
        label.textColor = .green
        label.text = "안녕하세요"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var posterStackView = {
       let stack = UIStackView(arrangedSubviews: [posterImage, posterLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavi()
        setup()
    }
    
    func setupNavi() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonClicked(_:)))
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "doc.fill"), style: .plain, target: self, action: #selector(rightThirdBarButtonClicked(_:))),
            UIBarButtonItem(image: UIImage(systemName: "book.fill"), style: .plain, target: self, action: #selector(rightSecondBarButtonClicked(_:))),
            UIBarButtonItem(image: UIImage(systemName: "flame"), style: .plain, target: self, action: #selector(rightFirstBarButtonClicked(_:))),
        ]
    }
    
    @objc func backButtonClicked(_ sender: UIBarButtonItem) {
        print("왼쪽 바 버튼 아이템 눌림 ")
        dismiss(animated: true)
    }
    
    @objc func rightFirstBarButtonClicked(_ sender: UIBarButtonItem) {
        print("첫번째 버튼 눌림")
        
    }
    
    @objc func rightSecondBarButtonClicked(_ sender: UIBarButtonItem) {
        print("두번째 버튼 눌림")
        
    }
    
    @objc func rightThirdBarButtonClicked(_ sender: UIBarButtonItem) {
        print("세번째 버튼 눌림")
        
    }
    
    
    
    
    func setup() {
        [backImageView, elementStackView, lineView, posterStackView].forEach {
            view.addSubview($0)
        }
        
        // 프로퍼티가 생성되고 나서 cornerRadius를 처리해야 circle을 만들 수 있다.
        DispatchQueue.main.async {
            self.posterImage.layer.cornerRadius = self.posterImage.frame.width / 2
        }
        
        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        

        
        elementStackView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(view).inset(40)
        }
        
        lineView.snp.makeConstraints { make in
            make.bottom.equalTo(elementStackView.snp.top).inset(-20)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(2)
        }
        
        posterImage.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        posterStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(lineView.snp.top).offset(-30)
        }
        
        
        
        
    }
    
    static func configureButton(title: String) -> UIButton.Configuration {
        var config = UIButton.Configuration.bordered()
        config.baseForegroundColor = .blue
        //let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        
        config.title = title
        config.imagePlacement = .top
        config.imagePadding = 5
        // UIButtonConfiguration에서 이미지 사이즈 조절
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 30)
        config.buttonSize = .large
        config.image = UIImage(systemName: "flame")
        return config
    }

}
