//
//  ManageModel.swift
//  DemoRX
//
//  Created by Anh vũ on 11/16/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ManageDataVM {
    var disposeBag = DisposeBag()
    let listLoan = BehaviorRelay<[ContentModel]>(value: [])
    let listBorrow = BehaviorRelay<[ContentModel]>(value: [])
    
    func configData() {
        getMockDataLoan()
        getMockDataBorrow()
    }
    
   private func getMockDataLoan() {
        let listLoan = [ContentModel(name: "Nguyên Văn Thắng", content: "Đi bộ xuyên việt", price: "1000đ", date: "20/09/2020"), ContentModel(name: "Ngô Bảo Ngọc", content: "Ủng hộ lũ lụt miền trung", price: "150.000đ", date: "20/09/2020"), ContentModel(name: "Nguyên Văn Trung", content: "Đi phượt Hà Giang", price: "500.000đ", date: "20/09/2020")]
        self.listLoan.accept(listLoan)
    }
    
   private func getMockDataBorrow() {
        let listLoan = [ContentModel(name: "Ngô Văn Du", content: "Mua xe máy trả góp", price: "1500.000đ", date: "20/09/2020"), ContentModel(name: "Nguyên Văn Trung", content: "Đi bộ xuyên việt", price: "500.000đ", date: "20/09/2020")]
        self.listBorrow.accept(listLoan)
    }
}
