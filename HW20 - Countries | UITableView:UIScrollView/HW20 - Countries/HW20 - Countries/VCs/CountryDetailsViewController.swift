//
//  CountryDetailsViewController.swift
//  HW20 - Countries
//
//  Created by telkanishvili on 22.04.24.
//

import UIKit
import SafariServices


class CountryDetailsViewController: UIViewController {
    //MARK: - Properties
    var country: Country?
    //MARK: - UI Components
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    let imageContainerView: UIView = {
        let imageContainerView = UIView()
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.layer.cornerRadius = 15
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowRadius = 2.0
        imageContainerView.layer.shadowOpacity = 0.5
        imageContainerView.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageContainerView.layer.masksToBounds = false
        return imageContainerView
    }()
    
    let countryImage: UIImageView = {
        let countryImage = UIImageView()
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.layer.cornerRadius = 15
        countryImage.clipsToBounds = true
        return countryImage
    }()
    
    let aboutFlagHeaderLabel: UILabel = {
        let aboutFlagHeaderLabel = UILabel()
        aboutFlagHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutFlagHeaderLabel.font = UIFont(name: "FiraGO-Bold", size: 15) ?? UIFont.systemFont(ofSize: 15)
        aboutFlagHeaderLabel.text =  "About the flag:"
        return aboutFlagHeaderLabel
    }()
    
    let aboutFlagBodyLabel: UILabel = {
        let aboutFlagBodyLabel = UILabel()
        aboutFlagBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutFlagBodyLabel.font = UIFont(name: "FiraGO-Regular", size: 13) ?? UIFont.systemFont(ofSize: 13)
        aboutFlagBodyLabel.numberOfLines = 0
        return aboutFlagBodyLabel
    }()
    
    let lineBetweenFlagAndInfo: UIView = {
        let lineBetweenFlagAndInfo = UIView()
        lineBetweenFlagAndInfo.translatesAutoresizingMaskIntoConstraints = false
        lineBetweenFlagAndInfo.backgroundColor = .lightGray
        return lineBetweenFlagAndInfo
    }()
    
    let basicInfoLabel: UILabel = {
        let basicInfoLabel = UILabel()
        basicInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        basicInfoLabel.font = UIFont(name: "FiraGO-Bold", size: 15) ?? UIFont.systemFont(ofSize: 15)
        basicInfoLabel.text =  "Basic information:"
        return basicInfoLabel
    }()
    
    let populationTitleLabel: UILabel = {
        let populationTitleLabel = UILabel()
        populationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        populationTitleLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        populationTitleLabel.text =  "Population:"
        return populationTitleLabel
    }()
    
    let populationValueLabel: UILabel = {
        let populationValueLabel = UILabel()
        populationValueLabel.translatesAutoresizingMaskIntoConstraints = false
        populationValueLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        return populationValueLabel
    }()
    
    let spellingTitleLabel: UILabel = {
        let spellingTitleLabel = UILabel()
        spellingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        spellingTitleLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        spellingTitleLabel.text =  "Spelling:"
        return spellingTitleLabel
    }()
    
    let spellingValueLabel: UILabel = {
        let spellingValueLabel = UILabel()
        spellingValueLabel.translatesAutoresizingMaskIntoConstraints = false
        spellingValueLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        return spellingValueLabel
    }()
    
    let capitalTitleLabel: UILabel = {
        let capitalTitleLabel = UILabel()
        capitalTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalTitleLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        capitalTitleLabel.text =  "Capital:"
        return capitalTitleLabel
    }()
    
    let capitalValueLabel: UILabel = {
        let capitalValueLabel = UILabel()
        capitalValueLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalValueLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        return capitalValueLabel
    }()
    
    let areaTitleLabel: UILabel = {
        let areaTitleLabel = UILabel()
        areaTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        areaTitleLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        areaTitleLabel.text =  "Area:"
        return areaTitleLabel
    }()
    
    let areaValueLabel: UILabel = {
        let areaValueLabel = UILabel()
        areaValueLabel.translatesAutoresizingMaskIntoConstraints = false
        areaValueLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        return areaValueLabel
    }()
    
    let regionTitleLabel: UILabel = {
        let regionTitleLabel = UILabel()
        regionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        regionTitleLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        regionTitleLabel.text =  "Region:"
        return regionTitleLabel
    }()
    
    let regionValueLabel: UILabel = {
        let regionValueLabel = UILabel()
        regionValueLabel.translatesAutoresizingMaskIntoConstraints = false
        regionValueLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        return regionValueLabel
    }()
    let neighborTitleLabel: UILabel = {
        let neighborTitleLabel = UILabel()
        neighborTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        neighborTitleLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        neighborTitleLabel.text =  "Neighbors:"
        return neighborTitleLabel
    }()
    
    let neighborValueLabel: UILabel = {
        let neighborValueLabel = UILabel()
        neighborValueLabel.translatesAutoresizingMaskIntoConstraints = false
        neighborValueLabel.font = UIFont(name: "FiraGO-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
        return neighborValueLabel
    }()
    
    let lineBetweenNeighborsAndLinks: UIView = {
        let lineBetweenNeighborsAndLinks = UIView()
        lineBetweenNeighborsAndLinks.translatesAutoresizingMaskIntoConstraints = false
        lineBetweenNeighborsAndLinks.backgroundColor = .lightGray
        return lineBetweenNeighborsAndLinks
    }()
    
    let usefulLinksLabel: UILabel = {
        let usefulLinksLabel = UILabel()
        usefulLinksLabel.translatesAutoresizingMaskIntoConstraints = false
        usefulLinksLabel.font = UIFont(name: "FiraGO-Bold", size: 15) ?? UIFont.systemFont(ofSize: 15)
        usefulLinksLabel.text =  "Useful links:"
        return usefulLinksLabel
    }()
    
    let mapsStackView: UIStackView = {
        let mapsStackView = UIStackView()
        mapsStackView.translatesAutoresizingMaskIntoConstraints = false
        mapsStackView.axis = .horizontal
        mapsStackView.alignment = .center
        mapsStackView.distribution = .equalSpacing
        return mapsStackView
    }()
    
    let streetMapButton: UIButton = {
        let streetMapButton = UIButton()
        streetMapButton.translatesAutoresizingMaskIntoConstraints = false
        streetMapButton.setImage(UIImage(named: "OpenStreetMap"), for: .normal)
        return streetMapButton
    }()
    
    let googleMapButton: UIButton = {
        let googleMapButton = UIButton()
        googleMapButton.translatesAutoresizingMaskIntoConstraints = false
        googleMapButton.setImage(UIImage(named: "GoogleMap"), for: .normal)
        return googleMapButton
    }()
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        fetchData()
    }
    
    //MARK: - SetupUI
    func setupUI() {
        addScrollView()
        addCountryImage()
        addFlagDetailLabels()
        addLineBetweenFlagAndInfo()
        addBasicInfoLabel()
        addPopulationLabels()
        addSpellingLabels()
        addCapitalLabels()
        addAreaLabels()
        addRegionLabels()
        addNeighborsLabels()
        addLineBetweenNeighborsAndLinks()
        addUsefulLinksLabel()
        addMapsStackView()
        addMapsToSV()
    }
    
    //MARK: - Functions
    func addScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor, multiplier: 1.1)
        ])
    }
    
    func addCountryImage() {
        contentView.addSubview(imageContainerView)
        imageContainerView.addSubview(countryImage)
        
        NSLayoutConstraint.activate([
            imageContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            imageContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25),
            
            countryImage.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            countryImage.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            countryImage.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            countryImage.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor)
        ])
    }
    
    func addFlagDetailLabels() {
        contentView.addSubview(aboutFlagHeaderLabel)
        contentView.addSubview(aboutFlagBodyLabel)
        
        NSLayoutConstraint.activate([
            aboutFlagHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aboutFlagHeaderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aboutFlagHeaderLabel.topAnchor.constraint(equalTo: countryImage.bottomAnchor, constant: 25),
            
            aboutFlagBodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            aboutFlagBodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            aboutFlagBodyLabel.topAnchor.constraint(equalTo: aboutFlagHeaderLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func addLineBetweenFlagAndInfo() {
        contentView.addSubview(lineBetweenFlagAndInfo)
        
        NSLayoutConstraint.activate([
            lineBetweenFlagAndInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            lineBetweenFlagAndInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            lineBetweenFlagAndInfo.topAnchor.constraint(equalTo: aboutFlagBodyLabel.bottomAnchor, constant: 20),
            lineBetweenFlagAndInfo.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    func addBasicInfoLabel() {
        contentView.addSubview(basicInfoLabel)
        
        NSLayoutConstraint.activate([
            basicInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            basicInfoLabel.topAnchor.constraint(equalTo: lineBetweenFlagAndInfo.bottomAnchor, constant: 24)
        ])
        
    }
    
    func addPopulationLabels() {
        contentView.addSubview(populationTitleLabel)
        contentView.addSubview(populationValueLabel)
        NSLayoutConstraint.activate([
            populationTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            populationTitleLabel.topAnchor.constraint(equalTo: basicInfoLabel.bottomAnchor, constant: 15),
            populationValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            populationValueLabel.topAnchor.constraint(equalTo: basicInfoLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func addSpellingLabels() {
        contentView.addSubview(spellingTitleLabel)
        contentView.addSubview(spellingValueLabel)
        NSLayoutConstraint.activate([
            spellingTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            spellingTitleLabel.topAnchor.constraint(equalTo: populationValueLabel.bottomAnchor, constant: 15),
            spellingValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            spellingValueLabel.topAnchor.constraint(equalTo: populationValueLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func addCapitalLabels() {
        contentView.addSubview(capitalTitleLabel)
        contentView.addSubview(capitalValueLabel)
        NSLayoutConstraint.activate([
            capitalTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            capitalTitleLabel.topAnchor.constraint(equalTo: spellingValueLabel.bottomAnchor, constant: 15),
            capitalValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            capitalValueLabel.topAnchor.constraint(equalTo: spellingValueLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func addAreaLabels() {
        contentView.addSubview(areaTitleLabel)
        contentView.addSubview(areaValueLabel)
        NSLayoutConstraint.activate([
            areaTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            areaTitleLabel.topAnchor.constraint(equalTo: capitalValueLabel.bottomAnchor, constant: 15),
            areaValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            areaValueLabel.topAnchor.constraint(equalTo: capitalValueLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func addRegionLabels() {
        contentView.addSubview(regionTitleLabel)
        contentView.addSubview(regionValueLabel)
        NSLayoutConstraint.activate([
            regionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            regionTitleLabel.topAnchor.constraint(equalTo: areaValueLabel.bottomAnchor, constant: 15),
            regionValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            regionValueLabel.topAnchor.constraint(equalTo: areaValueLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func addNeighborsLabels() {
        contentView.addSubview(neighborTitleLabel)
        contentView.addSubview(neighborValueLabel)
        NSLayoutConstraint.activate([
            neighborTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            neighborTitleLabel.topAnchor.constraint(equalTo: regionValueLabel.bottomAnchor, constant: 15),
            neighborValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            neighborValueLabel.topAnchor.constraint(equalTo: regionValueLabel.bottomAnchor, constant: 15)
        ])
    }
    
    func addLineBetweenNeighborsAndLinks() {
        contentView.addSubview(lineBetweenNeighborsAndLinks)
        
        NSLayoutConstraint.activate([
            lineBetweenNeighborsAndLinks.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            lineBetweenNeighborsAndLinks.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            lineBetweenNeighborsAndLinks.topAnchor.constraint(equalTo: neighborValueLabel.bottomAnchor, constant: 20),
            lineBetweenNeighborsAndLinks.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    func addUsefulLinksLabel(){
        contentView.addSubview(usefulLinksLabel)
        NSLayoutConstraint.activate([
            usefulLinksLabel.topAnchor.constraint(equalTo: lineBetweenNeighborsAndLinks.bottomAnchor, constant: 24),
            usefulLinksLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            usefulLinksLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func addMapsStackView(){
        contentView.addSubview(mapsStackView)
        NSLayoutConstraint.activate([
            mapsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 69),
            mapsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -69),
            mapsStackView.topAnchor.constraint(equalTo: usefulLinksLabel.bottomAnchor, constant: 15)
            
        ])
    }
    
    func addMapsToSV(){
        mapsStackView.addArrangedSubview(streetMapButton)
        mapsStackView.addArrangedSubview(googleMapButton)
        
        NSLayoutConstraint.activate([
            streetMapButton.heightAnchor.constraint(equalToConstant: 50),
            streetMapButton.widthAnchor.constraint(equalToConstant: 50),
            googleMapButton.heightAnchor.constraint(equalToConstant: 50),
            googleMapButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    //MARK: - Fetch Data from urls
    func fetchData(){
        guard let country = country else { return }
        
        var neighborsList = ""
        
        if let flagUrlString = country.flags.png,
           let flagUrl = URL(string: flagUrlString) {
            countryImage.loadImageWith(url: flagUrl)
        }
        
        aboutFlagBodyLabel.text = country.flags.alt ?? "We don't have any information about this flag to show"
        
        if let population = country.population {
            populationValueLabel.text = "\(Int(population))"
        } else {
            populationValueLabel.text = "Unknown"
            return
        }
        
        if let spelling = country.altSpellings?.last {
            spellingValueLabel.text = spelling
        } else {
            spellingValueLabel.text = "Unknown"
        }
        
        if let capital = country.capital?.last {
            capitalValueLabel.text = capital
        } else {
            capitalValueLabel.text = "Unknown"
        }
        
        if let area = country.area {
            areaValueLabel.text = String(Int(area))
        } else {
            areaValueLabel.text = "Unknown"
        }
        
        if let region = country.region {
            if country.name.common?.lowercased() == "Georgia".lowercased() {
                regionValueLabel.text = "Europe" //ვერვპატიობ ამ APIს აზიაში რო გაგვიყვანა და მაგისგამოძახილია ეს :დ
            } else {
                regionValueLabel.text = region
            }
        } else {
            regionValueLabel.text = "Unknown"
            
        }
        
        if let neighbors = country.borders {
            let lastIndexOfNeighborsArray = neighbors.count - 1
            if lastIndexOfNeighborsArray > 4 {
                for i in 0..<5 {
                    if let neighbor = neighbors[i] {
                        neighborsList += neighbor + " "
                    }
                }
            } else {
                for i in 0...lastIndexOfNeighborsArray {
                    if let neighbor = neighbors[i] {
                        neighborsList += neighbor + " "
                    }
                }
            }
            neighborValueLabel.text = neighborsList
        } else {
            neighborValueLabel.text = "Unknown"
        }
        
        if let streetMapUrlString = country.maps.openStreetMaps,
           let googleMapUrlString = country.maps.googleMaps{
            streetMapButton.addAction(UIAction(handler: { _ in
                openSafariForstreetMap()
            }), for: .touchUpInside)
            
            googleMapButton.addAction(UIAction(handler: { _ in
                openSafariForGoogleMap()
            }), for: .touchUpInside)
            
            func openSafariForstreetMap(){
                if let url = URL(string: streetMapUrlString) {
                    let safariViewController = SFSafariViewController(url: url)
                    self.present(safariViewController, animated: true)
                }
            }
            
            func openSafariForGoogleMap(){
                if let url = URL(string: googleMapUrlString) {
                    let safariViewController = SFSafariViewController(url: url)
                    self.present(safariViewController, animated: true)
                }
            }
        }
    }
}
