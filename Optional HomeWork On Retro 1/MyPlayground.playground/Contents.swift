import Foundation

//გავხსნათ ალგორითმების სეზონი.
//1)  დაწერეთ ფუნქცია რომელიც იღებს 2 პარამეტრს(სტრინგებს), და აბრუნებს Boolean ს თუ ეს ორი სტრინგი შედგება ერთიდაიგივე ასოებისგან, რიგითობას მნიშვნელობა არ აქვს.
//
//დიდ და პატარა ასოებსაც ვითვალისწინებთ.
//
//
//მაგ:
//
// "abc" და "bca" დააბრუნებს true
//
//"Abc" და "abc" აბრუნებს false. A და a სხვადასხვად ითვლება!

func isTheSameCharactersInString(firstString:String, secondString:String) -> Bool{
    firstString.sorted() == secondString.sorted()
}

print(isTheSameCharactersInString(firstString: "gela", secondString: "elga"))


//
//2) დაწერეთ ფუნქცია რომელიც მიიღებს და დააბრუნებს სტრინგს სადაც ზედმეტ სფეისებს მოაშორებს.
// 

//მაგ:
//"A[space][space][space]B[space][space]C" დააბრუნებს "A[space]B[space]C"
//"[space][space][space]a" დააბრუნებს "[space]a" ანუ 1 სფეისი ყოველთვის რჩება, ამ შემთხვევაში წინაც.

func removeExtraSpacesFrom(string: String) -> String {
    var shouldAddSpace:Bool = true
    var removedExtraSpacesString = String()
    for each in string{
        if each == " " && shouldAddSpace {
            removedExtraSpacesString += String(each)
            shouldAddSpace = false
        }else if each != " "{
            removedExtraSpacesString += String(each)
            shouldAddSpace = true
        }
        
        //        print(each)
    }
    return removedExtraSpacesString
    
}
    
print(removeExtraSpacesFrom(string: "A   B  C")) // არვიცი ესეთი ნეიმინგი რამდენად მისაღებია, მაგრამ ვასოსთან დავინახე როგორცმახსოვს და მაგიტომ დავწერე :დ
print(removeExtraSpacesFrom(string: "   a"))
print(removeExtraSpacesFrom(string: "   A B  C"))
    
//3) დაწერეთ ფუნქცია რომელიც იღებს სტრინგს(ეს სტრინგი მოიცავს ასევე ციფრებს), გაფილტრეთ/მოაშორეთ ასოები და დარჩენილი ციფრების ჯამს აბრუნებთ
//
//მაგ:
//“a1b2c3” აბრუნებს 6  ანუ(1+2+3)
//“asdf10b20c30” აბრუნებს 60 ს  (10 + 20 + 30) და ა შ.
//
func returnSumNumsFrom(inputedString:String) -> Int{
    var sumOfInts = Int()
    var wholeDigit = String()
    for each in inputedString{
        if each.isNumber{
            if let digit = Int(String(each)){
                wholeDigit.append(each)
            }
        }else if wholeDigit.count != 0 {
            if let number = Int(wholeDigit) {
                sumOfInts += number
            }
            wholeDigit = ""
            
        }
    }
    if let number = Int(wholeDigit) {
        sumOfInts += number
    }
    
    return sumOfInts
    
}

print(returnSumNumsFrom(inputedString: "1a1b2c3"))
print(returnSumNumsFrom(inputedString: "asdf10b20c0300"))


