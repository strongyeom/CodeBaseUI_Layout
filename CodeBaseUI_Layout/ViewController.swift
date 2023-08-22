//
//  ViewController.swift
//  CodeBaseUI_Layout
//
//  Created by 염성필 on 2023/08/22.
//

import UIKit

enum ButtonTag: Int {
    case Example1 = 0
    case Example2
    case Example3
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        let tag = ButtonTag(rawValue: sender.tag)
        switch tag {
        case .Example1:
            let vc = ExampleOneViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .Example2:
            let vc = ExampleTwoViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .Example3:
            let vc = ExampleThreeViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
}

