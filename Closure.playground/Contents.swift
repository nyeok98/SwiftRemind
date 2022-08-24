import UIKit

// (String, String) -> Void
// func foo(x: String, y:String) -> Void { ... } 의 축약형

func sayMyName(completion: (String, String) -> Void){
    print("sayMyName() called")
    sleep(2)
    completion("녘", "Nyeok")
}

sayMyName{ first, second in
    print("첫번째:\(first), 두번째:\(second)")
}

sayMyName{ _, second in
    print("두번째만 call: \(second)")
}

sayMyName{
    print("첫번째:\($0), 두번째:\($1)")
}

//초기 Closure 값을 optional로 설정하고 nil을 기본값으로 주면 completion을 반드시 입력하지 않아도 된다.
func sayMyNameOptional(completion: (() -> Void)? = nil){
    print("sayNyName() is called")
    sleep(2)
    completion?() //optional 선언 명확히
}


sayMyNameOptional()

sayMyNameOptional(completion: {
    print("2seconds flew")
})


// 그러므로

var numbers: [Int] = [0, 1, 2, 3, 4, 5]

var transformedNumbers1 = numbers.map{ (aNumber: Int) -> String in
    return "숫자: \(aNumber)"
}

var transformedNumbers2 = numbers.map{ aNumber in
    return "숫자: \(aNumber)"
} // 이러한 map에서의 클로저 사용에 대한 이해가 가능하다.

for transformedNumber in transformedNumbers1 {
    print(transformedNumber)
}
