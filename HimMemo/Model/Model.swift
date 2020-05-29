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
    
    // 날짜 포매터
    let fomatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .short
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko-kr")
        return f
    }()
    
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    static var dummyMemoList = [
    Memo(content: "Lorem Ipsum"),
    Memo(content: "스타벅스 커피")
    ]

}
