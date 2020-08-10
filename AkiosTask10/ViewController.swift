//
//  ViewController.swift
//  AkiosTask10
//
//  Created by Nekokichi on 2020/08/10.
//  Copyright © 2020 Nekokichi. All rights reserved.
//
/*
 都道府県のデータを用意する/しない
 structやenumを用意する/しない
 別ファイルで都道府県のデータを管理する/しない
 */

struct Prefecture {
    //都道府県のデータ
    private let prefectureDatas = ["北海道", "青森県", "岩手県", "宮城県", "秋田県","山形県", "福島県", "茨城県", "栃木県", "群馬県","埼玉県", "千葉県", "東京都", "神奈川県","新潟県","富山県", "石川県", "福井県", "山梨県", "長野県","岐阜県", "静岡県", "愛知県", "三重県","滋賀県","京都府", "大阪府", "兵庫県", "奈良県", "和歌山県","鳥取県", "島根県", "岡山県", "広島県", "山口県","徳島県", "香川県", "愛媛県", "高知県", "福岡県","佐賀県", "長崎県", "熊本県", "大分県", "宮崎県","鹿児島県", "沖縄県"]
    //引数番目に対応した都道府県を返す
    func getPrefectureValue(prefectureNum:Int) -> String {
        return prefectureDatas[prefectureNum]
    }
    //都道府県の数を返す
    func getPrefectureCount() -> Int {
        return prefectureDatas.count
    }
}

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var prefecture = Prefecture()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefecture.getPrefectureCount()
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        //右、左のテキスト
        guard let prefectureLabel = cell.prefectureLabel else {
            return cell
        }
        guard let prefectureDetailLabel = cell.prefectureDetailLabel else {
            return cell
        }
        prefectureLabel.text = prefecture.getPrefectureValue(prefectureNum: indexPath.row)
        let prefectureTextNum = indexPath.row + 1
        prefectureDetailLabel.text = "\(prefectureTextNum)番目の都道府県です"
        
        //背景色の設定
        let prefectureColorNum = (indexPath.row + 1) % 3
        switch prefectureColorNum {
        case 1:cell.backgroundColor = .systemRed
        case 2:cell.backgroundColor = .systemGreen
        case 0:cell.backgroundColor = .systemBlue
        default:break
        }
        
        return cell
    }

}

