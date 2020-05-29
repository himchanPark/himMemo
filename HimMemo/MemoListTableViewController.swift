//
//  MemoListTableViewController.swift
//  HimMemo
//
//  Created by Himchan Park on 2020/05/28.
//  Copyright © 2020 Himchan Park. All rights reserved.
//

import UIKit

class MemoListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let target = Memo.dummyMemoList[indexPath.row]
        let tableDate = target.fomatter.string(from: target.insertDate)
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = tableDate
        return cell
    }

}
