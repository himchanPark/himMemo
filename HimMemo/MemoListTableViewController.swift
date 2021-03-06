//
//  MemoListTableViewController.swift
//  HimMemo
//
//  Created by Himchan Park on 2020/05/28.
//  Copyright © 2020 Himchan Park. All rights reserved.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    
    // 날짜 포매터
    let fomatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .short
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko-kr")
        return f
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DataManager.shared.fetchMemo()
        tableView.reloadData()
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
                vc.memo = DataManager.shared.memoList[indexPath.row]
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
        
        return DataManager.shared.memoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let target = DataManager.shared.memoList[indexPath.row]
        cell.textLabel?.text = target.content
        
        let tableDate = fomatter.string(for: target.insertDate)
        cell.detailTextLabel?.text = tableDate
        
        if #available(iOS 11.0, *) {
            cell.detailTextLabel?.textColor = UIColor(named: "myLabelColor")
        } else {
            cell.detailTextLabel?.textColor = UIColor.lightGray
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let target = DataManager.shared.memoList[indexPath.row]
            DataManager.shared.deleteMemo(target)
            DataManager.shared.memoList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
