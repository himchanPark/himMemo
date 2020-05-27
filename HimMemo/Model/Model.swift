//
//  Model.swift
//  HimMemo
//
//  Created by Himchan Park on 2020/05/27.
//  Copyright © 2020 Himchan Park. All rights reserved.
//

import Foundation

class Memo {
    
    var content: String
    var insertDate: Date
    
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    static var dummyMemoList = [
    Memo(content: "Lorem Ipsum"),
    Memo(content: "스타벅스 커피")
    
    ]
}
