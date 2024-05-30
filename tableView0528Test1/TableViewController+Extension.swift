//
//  File.swift
//  tableView0528Test1
//
//  Created by 홍석평 on 5/29/24.
//

import UIKit

// 확장은 어디서든 사용가능 UIViewControllor 에서
extension UIViewController{
    
    func showAlert(title: String) {
        // 1.
        // action sheet- > 아래에서 위로  alert -> 팝업
        // title이랑 message에 nil을 주면 버튼만 있게 된다
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        present(alert,animated: true)
    }
}

