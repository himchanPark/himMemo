//
//  DetailViewController.swift
//  HimMemo
//
//  Created by Himchan Park on 2020/05/30.
//  Copyright © 2020 Himchan Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var memo: Memo? // 이전화면에서 전달된 메모가 전달
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            cell.textLabel?.text = memo?.content
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            cell.textLabel?.text = memo?.fomatter.string(for: memo?.insertDate)
            return cell
            
        default:
            fatalError()
        }
        
    }
    
    
}
