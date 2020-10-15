//
//  Product.swift
//  EUNPPINGMALL
//
//  Created by 60080252 on 2020/10/15.
//

import Foundation

struct Product {
    var name: String
    var description: String
    var amount: Int
    var price: Int
    var img: String?
    var wish: Bool
    
    init(name: String, description: String, amount: Int, price: Int, img: String?, wish: Bool) {
        self.name = name
        self.description = description
        self.amount = amount
        self.price = price
        self.img = img
        self.wish = wish
    }
        
    static var dummyProductList = [
        Product(name: "연필", description: "최고로 튼튼한 연필이라네", amount: 45, price: 1800, img: nil, wish: true),
        Product(name: "지우개", description: "최고로 잘 지워지는 지우개라네", amount: 20, price: 500, img: nil, wish: true),
        Product(name: "자", description: "제알 정확한 자", amount: 18, price: 1000, img: nil, wish: false),
        Product(name: "파일", description: "모든 것을 꽂을 수 있는 파일입니다~~ 싸요 싸", amount: 208, price: 2500, img: nil, wish: false),
        Product(name: "도장", description: "참 잘했어요 도장", amount: 28, price: 2900, img: nil, wish: true),
        Product(name: "모니터 받침대", description: "모니터를 받쳐서 거북목을 예방해요", amount: 16, price: 21000, img: nil, wish: true),
        Product(name: "에어팟 케이스", description: "에어팟을 보호해주는 케이스", amount: 49, price: 19000, img: nil, wish: false),
        Product(name: "포스트잇(소)", description: "메모를 작성할 수 있는 포스트 잇 소형 입니다.", amount: 82, price: 2300, img: nil, wish: true),
        Product(name: "흑색 볼펜", description: "검정색 심 볼펜", amount: 532, price: 1000, img: nil, wish: false),
        Product(name: "포스트잇(중)", description: "메모를 작성할 수 있는 포스트 잇 중형 입니다.", amount: 42, price: 3200, img: nil, wish: true),
    ]
    
    static var dummyRecentList: Set<Int> = []
}
