//
//  TableViewController.swift
//  tableView0528Test1
//
//  Created by 홍석평 on 5/28/24.
//

import UIKit

struct Check {
    let list: String?
    var check: Bool
}


class TableViewController: UITableViewController {
    
    
    //    var list = ["그립톡 구매하기","사이다 구매","아이패드 케이스 최저가 알아보기","양말"]
    
    var todolist = [
        Check(list: "그립톡 구매하기", check: true),
        Check(list: "사이다 구매", check: false ),
        Check(list: "아이패드 케이스 최저가", check: true ),
        Check(list: "양말", check: false)
    ]
    
    var checkList: [Check] = []
    
    // 체크 버튼을 위한 Bool 배열
    //var checkButton = true
    
    // 토글버튼 기본값 false 전체보기
   // var isOn = false
    
    @IBOutlet var mainTextField: UITextField!
    
    @IBOutlet var addButton: UIButton!
    
    
    @IBOutlet var searchTextField: UITextField!
    
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var switchButton: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        
        checkList = todolist
        self.navigationItem.title = "쇼핑"
        
        
        // 네비게이션바 아이템
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "숫자랜덤", style: .plain, target: self, action: #selector(randomButtonClicked))
        
        // 추가 버튼 생성
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        
        // 검색 버튼
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        switchButton.addTarget(self, action: #selector(switchButtonClicked), for: .touchUpInside)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todolist.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let data = todolist[indexPath.row]
        
        let name = todolist[indexPath.row].check ? "checkmark.message.fill" : "checkmark.message"
        
        let image = UIImage(systemName: name)
        cell.checkButton.setImage(image, for: .normal)
        
        cell.mainLabel.text = data.list
        
        // 테이블 뷰 셀의 버튼 태그 값을 해당 행의 인덱스 값으로 설정
        cell.checkButton.tag = indexPath.row
        // 체크 버튼 생성
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
      
        return cell
        
    }
    // 스위치 버튼 클릭시 완료상태 혹은 전체상태
    @objc func switchButtonClicked(sender: UISwitch){
        
     //   var markList: [Check] = []

        // 아이콘 checkmark.message.fill 를 true로 ...
        
//        for item in todolist {
//            if item.check == "checkmark.message.fill"{
//                
//            }
//            if sender.isOn {
//                showAlert(title: "완료된 할일보기")
//                tableView.reloadData()
//            } else if item.check == true{
//                
//                markList.append(item)
//                
//                showAlert(title: "전체 할일보기")
//                tableView.reloadData()
//            }
//        }
        
        
    }
    
    // 검색 버튼 클릭
    @objc func searchButtonClicked(sender: UIButton){
        
    }
    
    // 체크 버튼 클릭시
    @objc func checkButtonClicked(sender: UIButton){
        
        checkList
        var buttons: () = self.todolist[sender.tag].check.toggle()
        
        
        
        //  tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        todolist[sender.tag].check.toggle()
        tableView.reloadData()
        
       
        print(sender.tag)
       // todolist[sender.tag] == "checkmark.message.fill"
        //list[0].like = !list[0].like
    }
    
    @objc func addButtonClicked(){
        
        guard let text = mainTextField.text else {
            return
        }
        // 추가 버튼 클릭시 텍스트 필드에 입력한 내용을 배열에 추가
        let addText = Check(list: text, check: true)
        todolist.append(addText)
        
        
        // 텍스트필드 비워주기
        mainTextField.text = ""
        
        // 싱크 맞추기
        tableView.reloadData()
    }
    
    
    // 네비게이션바 아이템 클릭시 테이블뷰 셀에 랜덤하게 숫자 생성
    @objc func randomButtonClicked(sender: UIButton){
        
        let randomNumText = Int.random(in: 1...100)
        let randomNumResult = String(randomNumText)
        let addRandomNum = Check(list: randomNumResult, check: true)
        todolist.append(addRandomNum)
        
        tableView.reloadData()
        
    }
    
    
    
    // 테이블뷰 셀을 클릭하면 -> 삭제
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todolist.remove(at: indexPath.row)
        // 테이블뷰 싱크 맞추기
        tableView.reloadData()
    }
    
    
    
    
    
    
}

