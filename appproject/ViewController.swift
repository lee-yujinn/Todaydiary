//
//  ViewController.swift
//  appproject
//
//  Created by 이유진 on 08/04/2019.
//  Copyright © 2019 이유진. All rights reserved.
//

import UIKit

//main뷰
class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate { //갤러리에서 사진 불러오기를 위해 UIImagePickerControllerDelegate,UINavigationControllerDelegate

    @IBOutlet weak var dateLabel: UILabel! //오늘날짜 레이블
    
    let formatter = DateFormatter() //날짜
    let picker = UIImagePickerController() //갤러리
    
    
    @IBOutlet weak var todayPhoto: UIImageView! //오늘의사진 이미지뷰
    @IBOutlet weak var weatherSelect: UISegmentedControl! //오늘의날씨
    //날씨를 선택할때 발생하는 이벤트
    @IBAction func weatherSelected(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{ //맑음 선택할 경우
            weatherImage.image = UIImage(named: "sunny.png")
        }
        else if sender.selectedSegmentIndex == 1 { //흐림 선택할 경우
            weatherImage.image = UIImage(named: "cloudy.png")
        }
        else if sender.selectedSegmentIndex == 2 { //비 선택할 경우
            weatherImage.image = UIImage(named: "drops.png")
        }
    }
    
    @IBOutlet weak var weatherImage: UIImageView! //날씨에 따른 그림을 띄울 이미지뷰
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //오늘날짜 레이블에 띄우기
        formatter.dateFormat = "MM월dd일"
        let date = formatter.string(from: Date())
        dateLabel.text = date
        
        picker.delegate = self
        
    }
    
    //갤러리 열기
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    //카메라 열기
    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        else{
            print("Camera not available") //디바이스에서는 돌아가지만 시뮬레이터가 안돌아간다는걸 생각해서
        }
        
    }
    
    //갤러리에서 선택한 사진 뷰컨트롤러에 있는 이미지뷰에 가져오기
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage  {
            todayPhoto.image = selectedImage
            print(info)
        }
        dismiss(animated: true, completion: nil)
    }
    
    //사진불러오기 버튼
    @IBAction func addPhotobutt(_ sender: Any) {
        let alert =  UIAlertController(title: "원하는 타이틀", message: "원하는 메세지", preferredStyle: .actionSheet)
        
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
        
    }
    
}

