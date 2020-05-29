//
//  MemoListTableViewController.swift
//  HimMemo
//
//  Created by Himchan Park on 2020/05/28.
//  Copyright © 2020 Himchan Park. All rights reserved.
//

import UIKit

class MemoListTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let vc = segue.destination as? DetailViewController {
                vc.memo = Memo.dummyMemoList[indexPath.row]
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.tableView.reloadData()
        }
        
    }
    


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
