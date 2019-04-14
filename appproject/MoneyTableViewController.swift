//
//  MoneyTableViewController.swift
//  appproject
//
//  Created by 이유진 on 12/04/2019.
//  Copyright © 2019 이유진. All rights reserved.
//

import UIKit

class MoneyTableViewController: UITableViewController {

    //튜플
    typealias pay = (index: Int,name: String,price: String)
    var itemarray:[pay] = [] //pay타입의 배열(MoneyViewController에서 받은 세그웨이값 저장하기 위함)

    @IBOutlet var tableMoney: UITableView! //테이블뷰
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    // MARK: - Table view data source

    //테이블뷰에 관한 섹션의 개수 리턴
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 //한개
    }

    //테이블뷰의 셀의 개수를 리턴
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemarray.count //배열의 개수만큼
    }

    //테이블뷰에 띄울 정보들
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:MoneyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Moneycell") as! MoneyTableViewCell //MoneyTableViewCell -> cell의 내용을 class로
        cell.Labelname?.text = itemarray[indexPath.row].name //품목을 담을 레이블
        cell.Labelprice?.text = itemarray[indexPath.row].price //가격을 담을 레이블
        if itemarray[indexPath.row].index == 0{ //세그웨이의 값에 따라 수입/지출로 나눔
            cell.Labelindex?.text = "수입"
            cell.Labelindex?.textColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
            //수입일 경우 초록색으로 표현
        }
        else{
            cell.Labelindex?.text = "지출"
            cell.Labelindex?.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            //지출일 경우 빨간색으로 표현
        }
      
        return cell
    }
    
    //세그웨이 전달(MoneyViewController가 목적지뷰)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goList"{
            let destVC =  segue.destination as! MoneyViewController
            destVC.array = itemarray //현재 저장된 가계부 내용이 담긴 배열 보냄
        }
    }


}
