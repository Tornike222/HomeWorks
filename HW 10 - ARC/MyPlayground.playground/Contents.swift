import Foundation
//თქვენი დავალებაა კარგათ გაერკვეთ როგორ მუშაობს ARC სხვადასხვა იმპლემენტაციების გამოყენებით.

//შექმენით ციკლური რეფერენცები და გაწყვიტეთ
//აუცილებელია ქლოჟერების გამოყენება
//აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც
//დაიჭირეთ self ქლოჟერებში
//გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით
//წარმატებები ♡

class Table {
    let tableId: Int
    var restaurant: Restaurant?
    let maxPersonCountOnTable: Int
    let waitress: String
    
    init(tableId: Int, restaurant: Restaurant? = nil, maxPersonCountOnTable: Int, waitress: String) {
        self.tableId = tableId
        self.restaurant = restaurant
        self.maxPersonCountOnTable = maxPersonCountOnTable
        self.waitress = waitress
    }
    deinit {
        print("მაგიდა N\(tableId) მოხდა დეინიციალიზაცია")
    }
}

class Restaurant {
    let name: String
    var table: Table?
    let address: String

    init(name: String, table: Table? = nil, address: String) {
        self.name = name
        self.table = table
        self.address = address
    }
    deinit {
        print("\(name) მოხდა დეინიციალიზაცია")
    }
}

var giviReservedTable: Table? = Table(tableId: 1, maxPersonCountOnTable: 5, waitress: "ნინო")
giviReservedTable = nil //შევა დეინიტ ბლოკში რადგან 1 მიმთითებელი ქონდა კლასს რომელიც განულდა

var gelaReservedTable: Table? = Table(tableId: 2, maxPersonCountOnTable: 2, waitress: "გელა") // რეფერენს ქაუნთი == 1
var vakhoReservedTable = gelaReservedTable //რეფერენს ქაუნთი == 2

gelaReservedTable = nil // გავუნილეთ 1 რეფერენს ქაუნთი, შესაბამისად დარჩა 1, რის გამოც არ მოხდება დეალოკაცია
vakhoReservedTable = nil // რეფერენს ქაუნთი შემცირდა კიდევ 1 ით და გახდა 0 , შესაბამისად გამოიძახება დეინით ბლოკი

var shemoikhedeGenatsvale: Restaurant? = Restaurant(name: "შემოიხედე მარჯანიშვილზე", address: "მარჯანიშვილის 7") // Restaurant -ს გაუჩნდა 1 რეფერენსი
giviReservedTable = Table(tableId: 3, restaurant: shemoikhedeGenatsvale, maxPersonCountOnTable: 3, waitress: "მარიამი") // Restaurant -ს გაუჩნდა დამატებით 1 რეფერენსი ანუ ჯამში 2 , თეიბლ კლასს კი გაუჩნდა 1 რეფერენსი

shemoikhedeGenatsvale = nil // Restaurant კლასზე არსებული 2 მიმთითებლიდან დარჩა 1, რომელიც კლასიდან აკითხავს უშუალოდ და არა ობიექტიდან.

giviReservedTable?.restaurant = nil //Restaurant კლასზე დარჩენილი 1 მიმთითებელიც რომ მოვაშორეთ, მოხდა დეალოკაცია

giviReservedTable = nil //Table კლასზე ქონდა 1 რიფერენცი , შესაბამისად, როგორც კი ეს რეფერენსი განულდა, მაშინვე მოხდა დეალოკაცია


var pasanauri: Restaurant? = Restaurant(name: "ფასანაური", table: nil, address: "ბარათაშვილის ქუჩა 5") //Restaurant -ს აქვს 1 მიმთითებელი ამ ობიექტიდან

var anaReservedTable: Table? = Table(tableId: 4,restaurant: nil, maxPersonCountOnTable: 40, waitress: "მაგდა") //Table-ს აქვს +1 მიმთითებელი ამ ობიექტიდან ანუ ჯამში 2

pasanauri?.table = anaReservedTable //Table -ს აქვს +1 მიმთითებელი Restaurant ის table დან
anaReservedTable?.restaurant = pasanauri //Restaurant-საც აქვს +1 მიმთითებელი Table ის restaurant დან

pasanauri = nil
anaReservedTable = nil //თითოეულ კლასს მოაკლდა თითო-თითო რეფერსი, თუმცა ახლა თითოეული კლასი იძახებს მეორე კლასის ობიექტს, შესაბამისად მოხდა რითეინ საიქლი და არ მოხდა დეინიციალიზაცია

//თუ ჩვენ კლასები სტრონგ რეფერენსებით გვექნება დაკავშირებული არ მოხდება დეალოკაცია, შესაბამისად შევქმნათ იგივე კლასები და ობიექტები, უბრალოდ ახლა კლასების პროფერთი იყოს Weak ებით აღწერილ
protocol Description {
    var size: Int { get }
}
extension Int {
    var m2: Int { return self * 100 } // რესტორნის საიზისთვის
    var cm2: Int { return self } // მაგიდის საიზისთვის

}


class CopyTable: Description {
    let size = 100.cm2
    let tableId: Int
    weak var restaurant: CopyRestaurant?
    let maxPersonCountOnTable: Int
    let waitress: String
    var isPlacedAt: (() -> Void)?
    
    init(tableId: Int, restaurant: CopyRestaurant? = nil, maxPersonCountOnTable: Int, waitress: String, isPlacedAt: (() -> Void)? = nil) {
        self.tableId = tableId
        self.restaurant = restaurant
        self.maxPersonCountOnTable = maxPersonCountOnTable
        self.waitress = waitress
        self.isPlacedAt = isPlacedAt
    }
    deinit {
        print("მაგიდა N\(tableId) მოხდა დეინიციალიზაცია")
    }
    
    func printWaitressNameWithWeak(){ //weak
        restaurant?.makeSome { [weak self] in
            print("\(self?.waitress) works on \(self?.tableId)")
        }
        print(CFGetRetainCount(self))
    }
    
    func printWaitressNameWithUnowned(){ //unowned
        restaurant?.makeSome { [unowned self] in
            print("\(self.waitress) works on \(self.tableId)")
        }
        print(CFGetRetainCount(self))
    }
    
}

class CopyRestaurant: Description {
    let size = 100.m2
    let name: String
    var table: CopyTable?
    let address: String

    init(name: String, table: CopyTable? = nil, address: String) {
        self.name = name
        self.table = table
        self.address = address
    }
    deinit {
        print("\(name) მოხდა დეინიციალიზაცია")
    }
    
    func makeSome(action: () -> ()) {
        action()
    }
}

var pasanauriCopy: CopyRestaurant? = CopyRestaurant(name: "ფასანაური", table: nil, address: "ბარათაშვილის ქუჩა 5")

var anaReservedTableCopy: CopyTable? = CopyTable(tableId: 5,restaurant: nil, maxPersonCountOnTable: 40, waitress: "მაგდა")

pasanauriCopy?.table = anaReservedTableCopy
anaReservedTableCopy?.restaurant = pasanauriCopy

//ახლა Restaurant Class ზე არის 1 რეფერენსი, ხოლო Table კლასზე არის 2 რეფერენსი

anaReservedTableCopy = nil //მოხდა 1 რეფერენსის მოშორება თეიბლზე და დარჩა 1 რეფერენსი
pasanauriCopy = nil // მოხდა 1 რეფერენსის მოშორება რესტორანზე და გაიყოლა თეიბლის 1 რეფერენსიც

//ახლა თავიდან მივანიჭოთ ისევ ობიექტები და წარმოვადგინოთ ქლოჟერები Strong და Weak რეფერენსებით
pasanauriCopy = CopyRestaurant(name: "ფასანაურიCopy", table: nil, address: "ბარათაშვილის ქუჩა 5")
anaReservedTableCopy = CopyTable(tableId: 6, restaurant: nil, maxPersonCountOnTable: 40, waitress: "მაგდა")
pasanauriCopy?.table = anaReservedTableCopy
anaReservedTableCopy?.restaurant = pasanauriCopy

anaReservedTableCopy?.isPlacedAt = { [anaReservedTableCopy] in
    print("table is placed at restaurant: \(anaReservedTableCopy?.restaurant?.name)")
}
anaReservedTableCopy = nil
pasanauriCopy = nil //მოვხსენით პირდაპირი ობიექტები, თუმცა იქიდან გამომდინარე რომ სტრონგრეფერნსი აქვს ქლოჟერს მეორე კლასზე არ მოხდა დეალოკაცია

//ავიღოთ კოპიო ობიექტები და ახლა ვცადოთ იგივე Weak ით
pasanauriCopy = CopyRestaurant(name: "ფასანაურიCopyOfCopy", table: nil, address: "ბარათაშვილის ქუჩა 5")
anaReservedTableCopy = CopyTable(tableId: 7, restaurant: nil, maxPersonCountOnTable: 40, waitress: "მაგდა")
pasanauriCopy?.table = anaReservedTableCopy
anaReservedTableCopy?.restaurant = pasanauriCopy

anaReservedTableCopy?.isPlacedAt = { [weak anaReservedTableCopy] in
    print("table is placed at restaurant: \(anaReservedTableCopy?.restaurant?.name)")
}

anaReservedTableCopy = nil
pasanauriCopy = nil //ამ შემთხვევაში კი რადგან ქლოჟერში გამოვიყენეთ Weak მოხდება ორივეს დეალოკაცია.


// ახლა ვცადოთ სელფიანი weak ქლოჟერების გამოყენება

var taghlaura: CopyRestaurant? = CopyRestaurant(name: "თაღლაურა", table: nil, address: "სანდრო ეულის ქუჩა 5ა")
var gelaGnolidzeReservedTable: CopyTable? = CopyTable(tableId: 8, restaurant: nil, maxPersonCountOnTable: 22, waitress: "გიორგი")
taghlaura?.table = gelaGnolidzeReservedTable
gelaGnolidzeReservedTable?.restaurant = taghlaura

gelaGnolidzeReservedTable?.printWaitressNameWithWeak() //ქლოჟერის გამოძახება

gelaGnolidzeReservedTable = nil
taghlaura = nil // მოხდა დეინიციალიზაცია


//ახლა ვცადოთ იგივე, ოღონდ Unowned ქლოჟერის გამოყენებით
var taghlauraCopy: CopyRestaurant? = CopyRestaurant(name: "Copy Of თაღლაურა", table: nil, address: "სანდრო ეულის ქუჩა 5ა")
var gelaGnolidzeReservedTableCopy: CopyTable? = CopyTable(tableId: 9, restaurant: nil, maxPersonCountOnTable: 22, waitress: "გიორგი")
taghlauraCopy?.table = gelaGnolidzeReservedTableCopy
gelaGnolidzeReservedTableCopy?.restaurant = taghlauraCopy

gelaGnolidzeReservedTableCopy?.printWaitressNameWithUnowned()

gelaGnolidzeReservedTableCopy = nil
taghlauraCopy = nil // მოხდა დეინიციალიზაცია






