import Foundation

//1. შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)
enum Gender {
    case man
    case women
}
//2. შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender
protocol SuperBeing {
    var name: String { get }
    var strength: Int { get }
    var speed: Int { get }
    var weakness: String { get }
    var gender: Gender { get }

}
//3. SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა
extension SuperBeing {
    var strength: Int { 10 }
    var speed: Int { 100 }
}


//4. შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.
//5. გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String


class Superhero: SuperBeing {
    var name: String
    var weakness: String
    var gender: Gender
    var outfitColor: String
    var equipment: String
    var vehicle: String

    init(name: String, weakness: String, gender: Gender, outfitColor: String, equipment: String, vehicle: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.outfitColor = outfitColor
        self.equipment = equipment
        self.vehicle = vehicle

    }
    //6. გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს -
    //“‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).
    func rescue(victim: String) {
        print("\(name) არ შეუშინდა სახიფათო სიტუაციას და \(victim) გადაარჩინა სიკვდილს")
    }
    //7. გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -
    //“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)
    func combat(villain: SuperVillain){
        print("\(name) შეერკინა და დაამარცხა \(villain.name)")
    }
}
let soxumskiMaxo = Superhero(name: "სოხუმსკი მახო", weakness: "უფულობა", gender: .man, outfitColor: "შავი", equipment: "ბენდენა", vehicle: "None")
soxumskiMaxo.rescue(victim: "გელა გნოლიძე")

//8. გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String

class SuperVillain: SuperBeing{
    var name: String
    var weakness: String
    var gender: Gender
    var evilScheme: String
    var obsession: String
    var rivalry: String

    init(name: String, weakness: String, gender: Gender, evilScheme: String, obsession: String, rivalry: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
        self.evilScheme = evilScheme
        self.obsession = obsession
        self.rivalry = rivalry
    }

    //9. გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
    //“ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)
    func attack(hero: Superhero){
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(hero.name) მის შეჩერებას თუ შეძლებს ")
    }
    //10. გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
    //“‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)
    func experimentation(subject: String){
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა")
    }
}
let vakhoBrooklyn = SuperVillain(name: "ბრუკლინელი ვახო", weakness: "None", gender: .man, evilScheme: "ბრუკლინის გეტოს დაპყრობა", obsession: "შავი დიპლომით ფლექსაობა", rivalry: "სოხუმსკი მახო")

soxumskiMaxo.combat(villain: vakhoBrooklyn)

vakhoBrooklyn.attack(hero: soxumskiMaxo)

vakhoBrooklyn.experimentation(subject: "დომენიკ მანგო")



//11. შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან
let ironMan = Superhero(name: "Iron Man", weakness: "None", gender: .man, outfitColor: "Red and Gold", equipment: "Iron Man Suit", vehicle: "Iron Man Armor")
let spiderMan = Superhero(name: "Spider-Man", weakness: "None", gender: .man, outfitColor: "Red and Blue", equipment: "Web-shooters", vehicle: "None")
let blackWidow = Superhero(name: "Black Widow", weakness: "None", gender: .women, outfitColor: "Black", equipment: "Widow's Bite", vehicle: "None")
let thor = Superhero(name: "Thor", weakness: "None", gender: .man, outfitColor: "Red and Silver", equipment: "Mjolnir", vehicle: "Bifrost")

let thanos = SuperVillain(name: "Thanos", weakness: "Arrogance", gender: .man, evilScheme: "Collecting Infinity Stones", obsession: "Balancing the Universe", rivalry: "The Avengers")
let loki = SuperVillain(name: "Loki", weakness: "Hubris", gender: .man, evilScheme: "Conquest", obsession: "Power", rivalry: "Thor")
let redSkull = SuperVillain(name: "Red Skull", weakness: "His own ego", gender: .man, evilScheme: "World Domination", obsession: "Supremacy", rivalry: "Captain America")
let magneto = SuperVillain(name: "Magneto", weakness: "Emotional vulnerabilities", gender: .man, evilScheme: "Mutant Supremacy", obsession: "Protecting Mutants", rivalry: "X-Men")



//PS: ყველა ფროფერთი არის თქვენზე დამოკიდებული რა მნიშვნელობას მიიღებს. სურვილისამებრ შეგიძლიათ დაბეჭდილი მნიშვნელობებიც შეცვალოთ



//Optional:

//
//
//წარმოიდგინეთ სცენა სადაც ორი სუპერგმირი - დრეიკი და ლექს-სენი ერთმანეთს ეჯიბრებიან თუ რომელი უფრო სწრაფია. დრეიკი ამბობს რომ ის ყველაზე სწრაფია მსოფლიოში და რიანაც უდასტურებს.
//
//-“ლექს-სენს არცერთი შეჯიბრი არ წაუგია ისტორიაში” აცხადებს მისი კოლაბორატორი თაკო და დასძენს, რომ დრეიკი შიშისაგან უნდა კანკალებდეს, რადგან არც კი იცის რა ელოდება. ამ სუპერგმირების ბედი თქვენზეა დამოკიდებული, თქვენ უნდა გადაწყვიტოთ ვინ არის მსოფლიოში ყველაზე სწრაფი და ვინ შეძლებს ბილბორდის ტოპ ჩარტების განადგურებას.
//


//1. დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს
//2. ფუნქციის ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის
//3. დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია)
func compareSwiftness<T: SuperBeing>(firstHero: T, secondHero: T) -> String {
    if firstHero.speed > secondHero.speed{
        return "\(firstHero.name)-ს სიჩქარე მეტია \(secondHero.name)-ზე )"
    }else if firstHero.speed < secondHero.speed{
        return "\(firstHero.name)-ს სიჩქარე ნალებია \(secondHero.name)-ზე )"
    }
    else {
        return "\(firstHero.name)-ს და \(secondHero.name)-ის სიჩქარეები ტოლებია "
    }

}

print(compareSwiftness(firstHero: soxumskiMaxo, secondHero: thor))
