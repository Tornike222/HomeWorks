//
//  SearchViewController.swift
//  HW15Horoscope
//
//  Created by telkanishvili on 10.04.24.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: UI Objects
    let descriptionStackView: UIStackView = {
        let descriptionStackView = UIStackView()
        descriptionStackView.spacing = 10
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.axis = .vertical
        
        return descriptionStackView
    }()
    
    let mishaTsagareliLabel: UILabel = {
        let mishaTsagareliLabel = UILabel()
        mishaTsagareliLabel.text = "მიშა ცაგარელის ჰაბი"
        mishaTsagareliLabel.textColor = UIColor.white
        mishaTsagareliLabel.font = UIFont.systemFont(ofSize: 27)
        mishaTsagareliLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return mishaTsagareliLabel
    }()
    
    let descriptionOfApplication: UILabel = {
        let descriptionOfApplication = UILabel()
        descriptionOfApplication.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        descriptionOfApplication.numberOfLines = 4
        descriptionOfApplication.layer.opacity = 0.8
        descriptionOfApplication.textColor = UIColor.white
        descriptionOfApplication.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionOfApplication
    }()
    
    let inputAndButtonStackView: UIStackView = {
        let inputAndButtonStackView = UIStackView()
        inputAndButtonStackView.spacing = 20
        inputAndButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        inputAndButtonStackView.axis = .vertical
        
        return inputAndButtonStackView
    }()
    
    let zodiacStackView: UIStackView = {
        let zodiacStackView = UIStackView()
        zodiacStackView.spacing = 10
        zodiacStackView.translatesAutoresizingMaskIntoConstraints = false
        zodiacStackView.axis = .vertical
        
        return zodiacStackView
    }()
    
    let zodiacInputLabel: UILabel = {
        let zodiacInputLabel = UILabel()
        zodiacInputLabel.text = "ზოდიაქოს სახელი"
        zodiacInputLabel.textColor = UIColor.white
        zodiacInputLabel.font = UIFont.systemFont(ofSize: 15)
        zodiacInputLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return zodiacInputLabel
    }()
    
    let zodiacInputField: UITextField = {
        let zodiacInputField = UITextField()
        zodiacInputField.borderStyle = .roundedRect
        zodiacInputField.layer.cornerRadius = 5
        zodiacInputField.layer.borderWidth = 1
        zodiacInputField.layer.borderColor = UIColor.lightGray.cgColor
        zodiacInputField.backgroundColor = UIColor.clear
        zodiacInputField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: სასწორი",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        zodiacInputField.textColor = UIColor.white
        
        return zodiacInputField
    }()
    
    let nextButton: CustomButton = {
        let nextButton = CustomButton()
        nextButton.setTitle("შემდეგი", for: .normal)
        
        return nextButton
    }()
    
    
    
    

    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackgroundToView()
        addDescriptionStackView()
        addMishaTsagareliLabel()
        addDescriptionOfApplication()
        addInputAndButtonStackView()
        addZodiacStack()
        addZodiacInputFieldLabel()
        addZodiacInputField()
        addNextButton()
        
    }
    //MARK: Functions
    func addBackgroundToView(){
        let backgroundImage = UIImage(named: "starryNightImage")
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        view.layer.contentsGravity = .resizeAspectFill
        view.layer.contents = backgroundImage?.cgImage
    }

    func addDescriptionStackView(){
        view.addSubview(descriptionStackView)
        
        descriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        descriptionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
        descriptionStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        descriptionStackView.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    func addMishaTsagareliLabel(){
        descriptionStackView.addArrangedSubview(mishaTsagareliLabel)
    }
    
    func addDescriptionOfApplication(){
        descriptionStackView.addArrangedSubview(descriptionOfApplication)
        
        descriptionOfApplication.leadingAnchor.constraint(equalTo: descriptionStackView.leadingAnchor, constant: 6).isActive = true // ეს ვიცი რომ არაა კარგი პრაქტიკა, უბრალოდ დიზაინში დისქრიფშენის ტექსტი ცოტა შეწეული იყო და სხვანაირად ვერ მივიღე იგივე შედეგი. ( ამისგამოა კონსოლში ყვითელი ვორნინგი ) 
    }
    
    func addInputAndButtonStackView(){
        view.addSubview(inputAndButtonStackView)
        
        inputAndButtonStackView.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor, constant: 90).isActive = true
        inputAndButtonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        inputAndButtonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func addZodiacStack(){
        inputAndButtonStackView.addArrangedSubview(zodiacStackView)
        zodiacStackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    func addZodiacInputFieldLabel(){
        zodiacStackView.addArrangedSubview(zodiacInputLabel)
        
    }
    
    func addZodiacInputField(){
        zodiacStackView.addArrangedSubview(zodiacInputField)
        zodiacInputField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func addNextButton(){
        inputAndButtonStackView.addArrangedSubview(nextButton)
//        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        nextButton.addTarget(self, action: #selector(buttonTouchedUp(_:)), for: .touchUpInside)

    }
    
    //MARK: OBJC Functions
    @objc func buttonTouchedUp(_ sender: CustomButton) {
        let zodiacModelNames = [aquarius,
                                pisces,
                                aries,
                                taurus,
                                gemini,
                                cancer,
                                leo,
                                virgo,
                                libra,
                                scorpio,
                                sagittarius,
                                capricorn]
        
        let matchedInputedTextToZodiac = zodiacModelNames.first(where: { $0.name.lowercased() == zodiacInputField.text?.lowercased()})
                
        if matchedInputedTextToZodiac != nil {
            zodiacInputField.layer.borderColor = UIColor.lightGray.cgColor
            let dvc = DetailsViewController()
            dvc.zodiacModel = matchedInputedTextToZodiac
            dvc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(dvc, animated: false)
        } else {
            zodiacInputField.layer.borderColor = UIColor.red.cgColor
        }
        
    }
    
}

#Preview {
    SearchViewController()
}
