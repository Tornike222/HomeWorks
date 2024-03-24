import Foundation

//1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.
enum WeekDay {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func checkWork(day: WeekDay){
    print(day == .saturday || day ==  .sunday ? "Non-Working Day" : "Working Day")
}

checkWork(day: .sunday)
//2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს
enum GialaSquad: Int {
    case tsigroviManto
    case moshishvlebuliMkerdi
    case tuGapatio
    
    var price: Int {
        switch self{
        case .tsigroviManto:
            return 10000
        case .moshishvlebuliMkerdi:
            return 1000
        case .tuGapatio:
            return 100
        }
    }
    
    func printDonePrice(){
        print(price)
    }
}

var firstDone = GialaSquad.tsigroviManto

firstDone.printDonePrice()

//3. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
enum Weather{
    case sunny(celsius: Int)
    case cloudy(celsius: Int)
    case rainy(celsius: Int)
    case snowy(celsius: Int)
}

func getRecommendWhatToWearBy(weather: Weather) -> String {
    switch weather{
    case .sunny(let celsius):
        if celsius > 25{
            return "Wear light"
        }else{
            return "Wear light but not too much"
        }
    case .cloudy(let celsius):
        if celsius > 15{
            return "Wear jacket"
        }else{
            return "Wear warm clothes"
        }
    case .rainy(let celsius):
        if celsius > 15{
            return "Wear raincoat"
        }else{
            return "Wear warm clothes and raincoat"
        }
    case .snowy(let celsius):
        if celsius > 0{
            return "Wear lightly warm clothes"
        }else{
            return "Wear waterproof warm clothes"
        }
    }
}


print(getRecommendWhatToWearBy(weather: .snowy(celsius: -13)))
    

//4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.
struct Kanye {
    let album: String
    let releaseYear: Int
    
    init(album: String, releaseYear: Int) {
        self.album = album
        self.releaseYear = releaseYear
    }
}

var kanyeAlbumArray = [Kanye]()
kanyeAlbumArray.append(Kanye(album: "Gnolidze Loving You", releaseYear: 2020))
kanyeAlbumArray.append(Kanye(album: "Gikvarvar Tu Gkidivar", releaseYear: 2021))
kanyeAlbumArray.append(Kanye(album: "Me Maoceben Lampionebi", releaseYear: 2022))
kanyeAlbumArray.append(Kanye(album: "Mama Shvili Bagashvili", releaseYear: 2024))


func getAlbumNamesFrom(kanyeArray: [Kanye], year: Int) {
    for each in kanyeArray where each.releaseYear > year{
        print(each.album, each.releaseYear)
    }
}
getAlbumNamesFrom(kanyeArray: kanyeAlbumArray, year: 2021)

//5. შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა

@propertyWrapper
struct CachedData {
    let initializationClosure: () -> String

    init(initializationClosure: @escaping () -> String = { "lazy initialized" }) {
        self.initializationClosure = initializationClosure
    }

    var wrappedValue: String {
        get {
            initializationClosure()
        }
    }
}

struct InitData {
    @CachedData var cachedData: String
}

let test = InitData()

print(test.cachedData)





//Optional:
//
//
//
//ბარბარემ გადაწყვიტა პროგრამირებასთან ერთად დამატებითი სამსახური დაეწყო და ტაროს სამკითხაო ჯიხური გახსნა. მისი სახელი უცებ გავარდა და ქართველი ვარსკვლავების ყურამდეც მივიდა. ერთ დღეს მას ჯიხურში ძალიან ნაცნობი სახეები გამოეცხადა, ბედინა და შავი პრინცი. პროფესიონალმა ნათელმხილველმა გაშალა კარტი და დაიწყო მათ მომავალში ხელების ფათური. ბარბარეს ტაროს დასტა საკმაოდ უნიკალურია, ის მხოლოდ 12 კარტს შეიცავს - Star, Empress, Tower, Hanged Man, Chariot, Moon, Hierophant, Devil, Lovers, Wheel of Fortune, Fool, Magician და მათ აღწერებს -
//
//
//
//* Star: წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას.
//
//* Empress: განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში.
//
//* Tower: ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის.
//
//* Hanged Man: წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს.
//
//* Chariot: განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით.
//
//* Moon: აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს.
//
//* Hierophant: წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან.
//
//* Devil: განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას.
//
//* Lovers: აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით.
//
//* Wheel of Fortune: წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია.
//
//* Fool: განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას.
//
//* Magician: აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით.
//
//
//
//1. შექმენით Enum სახელად TarotCard და განსაზღვრეთ მასში 12 კარტის ქეისი.
enum TarotCard: String, CaseIterable {
    case star = "წარმოადგენს იმედს, შთაგონებას და სულიერ ხელმძღვანელობას. ეს ნიშნავს განახლებას, ოპტიმიზმს და მომავლის რწმენას."
    case empress = "განასახიერებს აღზრდას, სიუხვეს და დედობრივ ინსტინქტებს. ის წარმოადგენს ნაყოფიერებას, კრეატიულობას და ჰარმონიას ურთიერთობებში."
    case tower = "ნიშნავს უეცარ ცვლილებას, ქაოსს და განადგურებას. ის წარმოადგენს აჯანყებას, გამოცხადებას და ძველი სტრუქტურების ნგრევას ახალი წამოწყებისთვის."
    case hangedMan = "წარმოადგენს მსხვერპლს, დანებებას და გაშვებას. ეს ნიშნავს შეჩერების, ახალი პერსპექტივების მოპოვებისა და თვითრეფლექსიის პერიოდს."
    case chariot = "განასახიერებს ნებისყოფას, მონდომებას და გამარჯვებას. ის წარმოადგენს საკუთარ ცხოვრებაზე კონტროლის აღებას, მიზნების მიღწევას და დაბრკოლებების გადალახვას ფოკუსირებისა და სწრაფვის გზით."
    case moon = "აღნიშნავს ინტუიციას, ილუზიას და ქვეცნობიერ აზრებს. ის წარმოადგენს გაურკვევლობას, დაბნეულობას და აუცილებლობას, ენდოთ საკუთარ ინსტინქტებს უცნობისკენ ნავიგაციის დროს."
    case hierophant = "წარმოადგენს ტრადიციას, შესაბამისობას და სულიერ ხელმძღვანელობას. ეს ნიშნავს სიბრძნის ძიებას დამკვიდრებული რწმენებისგან, ინსტიტუტებისა და მენტორებისგან."
    case devil = "განასახიერებს ცდუნებას, მონობასა და მატერიალიზმს. ის წარმოადგენს ადამიანის ბუნების ბნელ ასპექტებს, დამოკიდებულებას და შემზღუდველი რწმენებისა და ჩვევებისგან თავის დაღწევის აუცილებლობას."
    case lovers = "აღნიშნავს პარტნიორობას, არჩევანს და ჰარმონიას. ის წარმოადგენს სიყვარულს, მიზიდულობას და გადაწყვეტილების მიღების აუცილებლობას ღირებულებებზე და სხვებთან კავშირებზე დაყრდნობით."
    case wheelOfFortune = "წარმოადგენს ბედს, ციკლებს და მოულოდნელ ცვლილებებს. ეს ნიშნავს იღბალს, შესაძლებლობებს და ცხოვრებისეული მოგზაურობის აღმავლობასა და ვარდნას, გვახსენებს, რომ ცვლილება გარდაუვალია."
    case fool = "განასახიერებს უდანაშაულობას, სპონტანურობას და ახალ წამოწყებებს. ეს წარმოადგენს რწმენის ნახტომს, თავგადასავლების მიღებას და სამყაროს ხელმძღვანელობისადმი ნდობას."
    case magician = "აღნიშნავს გამოვლინებას, ძალას და პოტენციალს. ის წარმოადგენს კრეატიულობას, უნარს და უნარს, იდეები რეალობად გარდაქმნას ორიენტირებული განზრახვისა და მოქმედების გზით."
//2. შექმენით სტატიკური მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტს შერჩევითად

    static func getRandomCard() -> TarotCard {
        var tarotCardArray = [TarotCard]()
        
        for each in TarotCard.allCases {
            tarotCardArray.append(each)
        }
        
        let randomNum = Int.random(in: 0...tarotCardArray.count-1)
        tarotCardArray.endIndex
        tarotCardArray.count

        return tarotCardArray[randomNum]
    }
    
//3. შექმენით მეთოდი TarotCard-ში რომელიც დააბრუნებს კარტის აღწერას string-ის სახით

    func getCardDetails() -> String {
        self.rawValue
    }
    
}

print(TarotCard.getRandomCard())

let testCard = TarotCard.devil.getCardDetails()
print(testCard)





//
//
//4. შექმენით სტრუქტურა სახელად TarotReading. გაუწერეთ ფროფერთიები წარსული, აწმყო და მომავალი. გაუკეთეთ ინიციალიზაცია ამ ფროპერთიებს რათა მათ მიიღონ შერჩევითი ტაროს კარტის აღწერის მნიშვნელობა.

struct TarotReading {
    var past: String
    var present: String
    var future: String
    
    init(past: String, present: String, future: String) {
        self.past = past
        self.present = present
        self.future = future
    }
    
    //5. შექმენით მეთოდი TarotReading-ში, რომელიც დაბეჭდავს ამ სამ არჩეულ ტაროს კარტს.

    func getTarotCards() {
        var tarotCards = [TarotCard]()
        
        for cardValue in [past, present, future] {
            if let matchingCard = TarotCard(rawValue: cardValue) {
                tarotCards.append(matchingCard)
            }
        }
        for i in 0...tarotCards.count-1{
            print(tarotCards[i])
        }
    }
}

var setRandomCardDetail = TarotReading.init(past: TarotCard.star.getCardDetails(), present: TarotCard.empress.getCardDetails(), future: TarotCard.tower.getCardDetails())

print("--------")
    

setRandomCardDetail.getTarotCards()

