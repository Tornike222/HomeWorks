import Foundation

//ცოტა სთორილაინს გავს და ვფიქრობთ გაგიმარტივებთ შემოწმებას :დ (ვეცადე ყოველშემთხვევაში )

//1. შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    static var ind = 0
    var bookId: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(title: String, author: String, isBorrowed: Bool) {
        self.bookId = Book.ind
        Book.ind += 1
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func makeBorrowWith(bookID: Int) {
        isBorrowed = true
    }
    func returnBorrowedWith(bookID: Int) {
        isBorrowed = false
    }
    func printBookInfo(){
        print("BookId \(self.bookId) | Title is \(title) | Author is \(author) | Is Borrowed : \(isBorrowed)")
    }
}

func printEachElementOf(book:[Book]){
    for each in book{
        each.printBookInfo()
    }
}

var sherlock = Book(title: "Sherlock Holmes", author: "Arthur Conan Doyle", isBorrowed: false)
var mglisBiliki = Book(title: "მგლის ბილიკი", author: "ალექსანდრე იასაღაშვილი", isBorrowed: false)


//2. შევქმნათ Class Owner
//
//Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
//Designated Init.
//Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
//Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.
class Owner{
    static var ind = 0
    var ownerId: Int
    var name: String
    var borrowedBooks: [Book]
    
    init(name: String, borrowedBooks: [Book]) {
        self.ownerId = Owner.ind
        Owner.ind += 1
        self.name = name
        self.borrowedBooks = borrowedBooks
    }
    
    func getBookFromLibrary(book: Book) {
        if book.isBorrowed == false{
            book.makeBorrowWith(bookID: book.bookId)
            borrowedBooks.append(book)
        }else{
            print("წიგნი \(book.title) ამჟამად სხვას აქვს წაღებული")
        }
    }
    func returnBookToLibrary(book: Book) {

        if book.isBorrowed {
            book.returnBorrowedWith(bookID: book.bookId)
            if borrowedBooks.count > 1{
                borrowedBooks.remove(at: book.bookId)
            }else{
                borrowedBooks = []
            }
        }
    }
    func printOwnerInfo(){
        print("Owner ID is \(ownerId) | Name is \(name) | BorrowedBook(s) is/are :")
        for each in borrowedBooks where borrowedBooks.count != 0{
            each.printBookInfo()
        }
        if borrowedBooks.count == 0{
            print("None")
        }
    }
}
func printEachElementOf(owner:[Owner]){
    for each in owner{
        each.printOwnerInfo()
    }
}



var tornike = Owner(name: "Tornike", borrowedBooks: [])
var gela = Owner(name: "Gela", borrowedBooks: [])
print("\n________________________დავალება 2________________________\n")
tornike.getBookFromLibrary(book: sherlock)
tornike.getBookFromLibrary(book: mglisBiliki)

print("თორნიკემ გამოიტანა 2 წიგნი ბიბლიოთეკიდან ")
printEachElementOf(book: tornike.borrowedBooks)

print("\nშერლოკ ჰოლმსი გამოტანილია ბიბლიოთეკიდან :",sherlock.isBorrowed)
print("მგლის ბილიკი გამოტანილია ბიბლიოთეკიდან :",mglisBiliki.isBorrowed)

print("\nთორნიკესა და მის წიგნებზე ინფო :")
tornike.printOwnerInfo()
tornike.returnBookToLibrary(book: sherlock)

print("\nდააბრუნა შერლოკ ჰოლმსი და ახლა გამოტანილი აქვს :")
printEachElementOf(book: tornike.borrowedBooks)

print("\nშერლოკ ჰოლმსი გამოტანილია ბიბლიოთეკიდან :",sherlock.isBorrowed)
print("მგლის ბილიკი გამოტანილია ბიბლიოთეკიდან :",mglisBiliki.isBorrowed)


print("\n________________________დავალება 3________________________\n")



//
//
//3. შევქმნათ Class Library
//
//Properties: Books Array, Owners Array.
//Designated Init.
//Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
//Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
//Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
//Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
//Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
//Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
//Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია. (ეს დავალება getBookFromLibrary მეთოდშივე მაქ გაკეთებული ცალკე აღარ დავამატე მეთოდი )

class Library {
    var books: [Book]
    var owners: [Owner]
    
    init(books: [Book], owners: [Owner]) {
        self.books = books
        self.owners = owners
    }
    
    func addBookInLibrary(book: Book) {
        books.append(book)
    }
    
    func addOwnerInLibrary(owner: Owner) {
        owners.append(owner)
    }
    
    func getNonBorrowedBooks() -> [Book] {
        var nonBorrowedBooks = [Book]()
        for each in books{
            if each.isBorrowed == false{
                nonBorrowedBooks.append(each)
            }
        }
        return nonBorrowedBooks
    }
    
    func getBorrowedBooks() -> [Book] {
        var borrowedBooks = [Book]()
        for each in books{
            if each.isBorrowed == true{
                borrowedBooks.append(each)
            }
        }
        return borrowedBooks
    }
    
    func getOwnerInfoBy(ownerId: Int) -> [Owner] {
        var ownerInfos = [Owner]()
        for each in owners{
            if each.ownerId == ownerId{
                ownerInfos.append(each)            
            }
        }
        return ownerInfos
    }
    
    func getBookInfoBy(ownerId: Int) -> [Book] {
        var borrowedBookInfo = [Book]()
        
        for each in owners where each.ownerId == ownerId {
            borrowedBookInfo += each.borrowedBooks
        }
        return borrowedBookInfo
    }
}


var library = Library(books: [mglisBiliki], owners: [tornike])
print("ბიბლიოთეკაში ამჟამად არის წიგნ(ებ)ი:")
printEachElementOf(book: library.books)

print("\nბიბლიოთეკაში ამჟამად არიან Owner(ებ)ი:")
printEachElementOf(owner: library.owners)

library.addBookInLibrary(book: sherlock)
library.addOwnerInLibrary(owner: gela)

print("\nბიბლიოთეკაში დავამატეთ წიგნი შერლოკ ჰოლმსი და ოუნერი გელა შესაბამისად")

print("ბიბლიოთეკაში ამჟამად არის წიგნები:")
printEachElementOf(book: library.books)

print("\nბიბლიოთეკაში ამჟამად არიან Owner-ები:")
printEachElementOf(owner: library.owners)

print("\nვნახოთ ყველა ხელმისაწვდომი წიგნი:")
printEachElementOf(book: library.getNonBorrowedBooks())
print("ვნახოთ ყველა წაღებული წიგნი:")
printEachElementOf(book: library.getBorrowedBooks())

print("\nთორნიკემ დააბრუნა წიგნი მგლის ბილიკი")

tornike.returnBookToLibrary(book: mglisBiliki)

print("\nვნახოთ ხელახლა ყველა ხელმისაწვდომი წიგნი:")
printEachElementOf(book: library.getNonBorrowedBooks())
print("ვნახოთ ყველა წაღებული წიგნი:")
printEachElementOf(book: library.getBorrowedBooks())

print("\nვიპოვოთ ოუნერზე ინფორმაცია ownerID გადაწოდებით, ამშემთხვევაში შევიყანოთ 0")
printEachElementOf(owner: library.getOwnerInfoBy(ownerId: 0))
print("ვიპოვოთ ოუნერზე ინფორმაცია ownerID გადაწოდებით, ამშემთხვევაში შევიყანოთ 2")
printEachElementOf(owner: library.getOwnerInfoBy(ownerId: 2))

print("\nახლა მოვძებნოთ წიგნები კონკრეტული ოუნერ აიდის მიხედვით, ამშემთხვევაში 1 რაც გელას ოუნერ აიდია:")
printEachElementOf(book: library.getBookInfoBy(ownerId: 1))

print("\nწიგნი არ მოიძებნა რადგან გელას არ ქონდა გატანილი წიგნი, შესაბამისად გელამ გადაწყვიტა შერლოკი გაეტანა ბიბლიოთეკიდან")
gela.getBookFromLibrary(book: sherlock)
print("გელამ გაიტანა წიგნი")
print("\nაბა ახლა მოვძებნოთ წიგნი გელას ოუნერ აიდის მიხედვით რაც 1-ია")
printEachElementOf(book: library.getBookInfoBy(ownerId: 1))

print("\nშეგვიძლია იგივეს გელას ოუნერ ტიპის კლასის მეთოდითაც მივწვდეთ")
printEachElementOf(book: gela.borrowedBooks)

print("\nდიდი ხნის შემდეგ გელამ გადაწყვიტა წაღებული მგლის ბილიკიც დაებრუნებინა და ლაღი ცხოვრება გაეგრძელებინა ბაბი კირკიტაძესთან ერთად")
gela.returnBookToLibrary(book: mglisBiliki)
//
//4. გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
//დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
//წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
//დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.

//
print("\n \n \n \nმეოთხე დავალების მოთხოვნები 1/2/3 დავალების ტესტირებამ მოიცვა, შესაბამისად ცალკე კიდევ აღარ ვწერ\n \n \n \n")
//
//
//Optional:
//
//
//
//შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია. შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია:
//
print("___________________OPTIONAL______________________\n")
class JokeGenerator {
    var jokeArray: [String]
    
    init(jokeArray: [String]) {
        self.jokeArray = jokeArray
    }
    func printRandomJoke() {
        print(jokeArray.randomElement() ?? "https://youtu.be/VPOGpB6pYOQ?si=P-spFVQUqWlQ6-Bd")
    }
    func addOrRemove(joke: String, whatToDo: String = "Add"){
        if whatToDo.lowercased() == "remove"{
            var ind = Int(jokeArray.lastIndex(of: joke) ?? -1)
            if ind != -1 {
                jokeArray.remove(at: ind )
            }
        } else {
            jokeArray.append(joke)
        }
    }
}

var joke = JokeGenerator(jokeArray: ["დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე. ”"])

joke.addOrRemove(joke: "ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად", whatToDo: "Add")
joke.addOrRemove(joke: "სულის ტკივილამდე ვტკივილობ….")
joke.addOrRemove(joke: "იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ")
joke.addOrRemove(joke: "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ")
joke.addOrRemove(joke: "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე")
joke.addOrRemove(joke: "თქვენ მოჰკალით ძერა?")
joke.addOrRemove(joke: "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...")
joke.addOrRemove(joke: "მზე აღარ ამოდის ჩაგვიჭრეს")
print("ყველა ობიექტის შექმნის შემდეგ, ერეიში ობიექტების რაოდენობაა: ",joke.jokeArray.count)

joke.addOrRemove(joke: "მზე აღარ ამოდის ჩაგვიჭრეს", whatToDo: "remove")
print("\nწავშალეთ ბოლო ელემენტი და ახლა ელემენტების რაოდენობაა: ",joke.jokeArray.count)




