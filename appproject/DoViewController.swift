//
//  DoViewController.swift
//  appproject
//
//  Created by 이유진 on 10/04/2019.
//  Copyright © 2019 이유진. All rights reserved.
//

import UIKit

class DoViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate {
    //,UIPickerViewDelegate,UIPickerViewDataSource 피커뷰
    
    //키보드 내리는 코드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    //피커뷰에 띄울 내용
    let dayArray: [String] = ["오전", "오후"]
    let timeArray: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    //튜플
    typealias dothings = (dayinfo: String, timeinfo: Int, doing: String)
    //추후에 시간별로 정렬할 수 있기 위해 timeinfo는 정수형으로
    var daygarr:[dothings] = [] //오전을 보내고 전달받은걸 담을 배열
    var nightarr:[dothings] = [] //오후를 보내고 전달받은걸 담을 배열
    var dothing:dothings! = ("0",0,"0")

    @IBOutlet weak var doText: UITextField! //할일을 적을 텍스트필드
    @IBOutlet weak var pickerDo: UIPickerView! //피커뷰
    
    //피커뷰의 컴포넌트 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2 //두개
    }
    
    //피커뷰 컴포넌트별 항목 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 { //오전 오후
            return dayArray.count
        }
        else { //시간(1~12)
            return timeArray.count
        }
    }
    
    //피커뷰에 띄움
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent
        component: Int) -> String? {
        if component == 0 {
            return dayArray[row]
        }
        else {
            return (String(timeArray[row]) + ":00") //int형을 string으로
        }
    }
    
    //전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goDo"{
            //배열로 정리해서 세그웨이 전달
            dothing.dayinfo = dayArray[self.pickerDo.selectedRow(inComponent: 0)]
            dothing.timeinfo = timeArray[self.pickerDo.selectedRow(inComponent: 1)]
            dothing.doing = doText.text!
            
            let destVC =  segue.destination as! DoTableViewController
            
            //오전이면 오전에 관한 배열로 전달
            if dothing.dayinfo == "오전"{
                daygarr.append(dothing)
                destVC.day = daygarr
                destVC.night=nightarr
            }
            else{ //오후면 오후에 관한 배열로 전달
                nightarr.append(dothing)
                destVC.day = daygarr
                destVC.night=nightarr
            }
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
