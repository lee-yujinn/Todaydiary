//
//  DoTableViewController.swift
//  appproject
//
//  Created by 이유진 on 10/04/2019.
//  Copyright © 2019 이유진. All rights reserved.
//

import UIKit

class DoTableViewController: UITableViewController {
    
    //튜플
    typealias dothings = (dayinfo: String, timeinfo: Int, doing: String)
    var doingarray:[dothings] = [] //오전 오후를 합쳐서 저장할 배열
    
    //나누는 이유? 테이블뷰에 오전배열을 먼저 띄우고 그 다음에 오후를 띄우기 위해
    var day:[dothings] = [] //오전을 저장할 배열
    var night:[dothings] = [] //오후를 저장할 배열

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doingarray = day + night //오전과 오후를 합쳐서 하나의 배열로 다시 저장
        
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
        return doingarray.count ////배열의 개수만큼
    }

    ////테이블뷰에 띄울 정보들
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:DoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "doCell") as! DoTableViewCell //DoTableViewCell -> cell의 내용을 class로
        cell.doThing.text = doingarray[indexPath.row].doing //할일을 담을 레이블
        cell.time.text = (String(doingarray[indexPath.row].timeinfo)+":00") //시간을 담을 레이블
        cell.dayNight.text = doingarray[indexPath.row].dayinfo //오전,오후를 담을 레이블
        
        return cell
    }
    
    //세그웨이 전달(DoViewController가 목적지뷰)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goDo"{
            let destVC =  segue.destination as! DoViewController
            //오전오후 각각의 배열을 전달
            destVC.daygarr = day
            destVC.nightarr = night
        }
    }

}
