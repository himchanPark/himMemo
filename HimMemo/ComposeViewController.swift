//
//  ComposeViewController.swift
//  HimMemo
//
//  Created by Himchan Park on 2020/05/29.
//  Copyright © 2020 Himchan Park. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var memeTextView: UITextView!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        guard let memo = memeTextView.text, memo.count > 0 else {
            alert(message: "메모를 입력하세요")
            return
        }
        
        DataManager.shared.addNewMemo(memo )
        
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
}
