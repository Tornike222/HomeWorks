import Foundation

print("\n1. დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)")
func isMirrorableString(word:String) -> Bool{
    var reversedWord = ""
    for each in word{
        reversedWord = String(each) + reversedWord
    }
    return word == reversedWord ? true:false
}

print(isMirrorableString(word: "მადამ"))

print("\n2. დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.")
func makeItDouble(array:[Int]) -> [Int]{
    var doubledArray = [Int]()
    for each in array{
        doubledArray += [each * each]
        print(doubledArray)
    }
    return doubledArray
}
makeItDouble(array:[1,2,3,4,123,5123,55])

print("\n3. დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.")
let getOnlyEvenNumbers: ([Int]) -> ([Int]) = { array in
    var evenNumArray = [Int]()
    for each in array{
        if each % 2 == 0{
            evenNumArray += [each]
        }
    }
    return evenNumArray
}
print(getOnlyEvenNumbers([1,2,3,4,5,6,7,8,9,10,15123,1232,55,46]))

print ("\n4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.")

let sumOfIntArray = { (array:[Int]) in
    var sumOfElements = 0
    for each in array{
        sumOfElements += each
    }
    print("ელემენტების ჯამია:",sumOfElements)
}

func arithmeticOperatiosForIntArrays(array:[Int], closure: @escaping ([Int]) -> () ) {
    DispatchQueue.main.asyncAfter(deadline: .now()+5){
        sumOfIntArray(array)
        print("მეოთხე დავალების შედეგი დაიბეჭდა 5 წამის შემდეგ")
    }
    print("შემოვიდა")
}
arithmeticOperatiosForIntArrays(array: [1,2,3,4,5,6,7,8,9,10], closure: sumOfIntArray)

print("\n5. შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი")

var contactDictionary:[String:Int] = [:]
contactDictionary = ["ელისო":511223344] //ცვლადზე დიქშენერის მინიჭება
contactDictionary["ვაჟა"] = 511223343 //დამატება
contactDictionary["გიორგი"] = 511223342 //დამატება
contactDictionary["გივი"] = 511223341 //დამატება
contactDictionary["გივი"] = 511223340 //თავზე გადაწერა
contactDictionary.updateValue(511223339, forKey: "გივი")//თავზე გადაწერა updateValue თი


print(contactDictionary) //დაბეჭდვა
print(contactDictionary.keys) //დაბეჭდვა დიქშენერის ქიების
print(contactDictionary.values)//დაბეჭდვა დიქშენერის ველიუების
print(contactDictionary["გივი"] ?? "არ მოიძებნა მსგავსი Key თი ჩანაწერი")//მოძებნა გივის შესაბამისი ველიუსი
print(contactDictionary["გივი1"] ?? "არ მოიძებნა მსგავსი Key თი ჩანაწერი")//მოძებნა გივის შესაბამისი ველიუსი
contactDictionary.removeValue(forKey: "გივი")
print(contactDictionary["გივი"] ?? "არ მოიძებნა მსგავსი Key თი ჩანაწერი")//მოძებნა გივის შესაბამისი ველიუსი




print("\n6. დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.")
func sortedDictionaryKeys(dict:[String:Int]) -> [String]{
    return dict.keys.sorted()
}

print(sortedDictionaryKeys(dict: [
    "Ani":20,
    "Eka":39,
    "Mariami":25,
    "Badri":15,
    "Cotne":12,
    "Dimitri":14
]))

print("\n7. შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.")
let arrayOfDoubles:[Double] = [1.0,2,5,3,3.45,123,95,23.3]
var tempHighestValue = arrayOfDoubles[0]

for i in 0...arrayOfDoubles.count-2{
    if tempHighestValue < arrayOfDoubles[i]{
        tempHighestValue = arrayOfDoubles[i]
    }
}

print(tempHighestValue)
//
//Optional:
//
//
//
//მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:
//
let lelaWhatMovementIsThis: [String: Int] = [
    "ღამის სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
]
//
//
//
print("\n1. დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში")
func getSumDuration(dic:[String: Int]){
    var sumOfSeconds = 0.0
    var array = Array(dic.values)
    for i in 0...array.count-1{
        sumOfSeconds += Double(array[i])
        
    }
    print(Int(sumOfSeconds/60), "წუთი და", Int(sumOfSeconds) % 60,"წამი")
    
}
getSumDuration(dic: lelaWhatMovementIsThis)

print("\n2. დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.")
func getMinAndMaxDurationSong(dic:[String: Int]){
    var songDuration = 0
    var nameOfMaxDurationSong = ""
    var nameOfMinDurationSong = ""
    
    for song in dic.enumerated(){
        if songDuration < song.element.value{
            nameOfMaxDurationSong = song.element.key
            songDuration = song.element.value
        }
    }
    songDuration = dic.values.max()!
    for song in dic.enumerated(){
        if songDuration >= song.element.value{
            songDuration = song.element.value
            nameOfMinDurationSong = song.element.key
        }
    }
    
    print(nameOfMaxDurationSong, "არის ყველაზე გრძელი სიმღერა.")
    print(nameOfMinDurationSong, "არის ყველაზე მოკლე სიმღერა.")
}
getMinAndMaxDurationSong(dic: lelaWhatMovementIsThis)
//3. დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას
func getAverageDuration(dic:[String: Int]){
    var songDuration = 0.0
    for song in dic.enumerated(){
        songDuration += Double(song.element.value)
    }
    print()
    print("ლელა წურწუმიას სიმღერების საშუალო ხანგრძლივობაა",songDuration/Double(dic.count),"წამი ანუ",Int(songDuration/Double(dic.count)/60), "წუთი და", Int(songDuration/Double(dic.count)) % 60,"წამი")

}
getAverageDuration(dic: lelaWhatMovementIsThis)


//4. დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს
func getRandomSong(dic:[String: Int]){
    print(dic.randomElement()?.key ?? "დიქშენერში არაა ელემენტები")
}

getRandomSong(dic: lelaWhatMovementIsThis)
