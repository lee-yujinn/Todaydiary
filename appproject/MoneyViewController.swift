//
//  MoneyViewController.swift
//  appproject
//
//  Created by 이유진 on 10/04/2019.
//  Copyright © 2019 이유진. All rights reserved.
//

import UIKit

class MoneyViewController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //delegate method
        textField.resignFirstResponder()
        return true
    }

    @IBOutlet weak var moneySeg: UISegmentedControl! //수입,지출 세그먼트컨트롤
    @IBOutlet weak var nametext: UITextField! //품목 텍스트필드
    @IBOutlet weak var pricetext: UITextField! //금액 텍스트필드
    
    //튜플
    typealias pay = (index: Int,name: String,price: String)
    var item:pay! //사용자가 입력한값을 저장할 pay 변수
    var array:[pay]! //목적지에 보내기도 하고 테이블뷰에서 전달받은것을 저장하기도 할 배열
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
   //전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goMoney"{
            let destVC =  segue.destination as! MoneyTableViewController
            //MoneyTableViewController 목적지뷰
            item = (moneySeg.selectedSegmentIndex,nametext.text! ,pricetext.text!)
            //사용자가 입력한 값들 저장
            array.append(item) //배열에 추가
            destVC.itemarray = array //배열 전달
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
