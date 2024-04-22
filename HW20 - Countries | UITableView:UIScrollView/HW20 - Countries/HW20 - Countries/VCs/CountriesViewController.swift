//
//  ViewController.swift
//  HW20 - Countries
//
//  Created by telkanishvili on 21.04.24.
//

import UIKit

class CountriesViewController: UIViewController {
    //MARK: - Loading state
    var isLoading = true
    
    //MARK: - UI Component
    let countriesTableView: UITableView = {
        let countriesTableView = UITableView()
        countriesTableView.translatesAutoresizingMaskIntoConstraints = false
        countriesTableView.backgroundColor = .white
        countriesTableView.separatorStyle = .none
        
        return countriesTableView
    }()
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        fetchData()
    }
    
    func setupUI(){
        addBackgroundColor()
        addCountriesTableView()
    }
    
    func addBackgroundColor(){
        view.backgroundColor = .white
    }
    
    func addCountriesTableView(){
        view.addSubview(countriesTableView)
        
        NSLayoutConstraint.activate([
            countriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            countriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            countriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
        countriesTableView.register(CountriesCell.self, forCellReuseIdentifier: "CountriesCell")
        
    }
    
    func fetchData(){
        let urlString = "https://restcountries.com/v3.1/all"
        
        NetworkService().getData(urlString: urlString) { (result: [Country]?, Error) in
            countriesArray = result ?? countriesArray
            self.countriesTableView.reloadData()
            self.isLoading = false
        }
    }
    
}
//MARK: - DataSource Extension and functions
extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesCell", for: indexPath) as? CountriesCell
        
        if let photoUrl = URL(string: countriesArray[indexPath.row].flags.png ?? "") {
            cell?.flag.loadImageWith(url: photoUrl)
            cell?.setNeedsLayout()
        }
        
        if let countryName = countriesArray[indexPath.row].name.common {
            cell?.countryLabel.text = countryName
        }
        
        getBorderedLayer(cell: cell!)
        
        cell?.accessoryType = .disclosureIndicator
        return cell ?? CountriesCell()
    }
    
    func getBorderedLayer(cell: UITableViewCell) {
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

//MARK: - Delegate Extension and functions
extension CountriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isLoading == false {
            60
        } else {
            0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countriesArray[indexPath.row]
        let detailsVC = CountryDetailsViewController()
        detailsVC.modalPresentationStyle = .fullScreen
        detailsVC.country = country
        
        navigationController!.navigationBar.prefersLargeTitles = false
        detailsVC.navigationItem.title = country.name.common
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        
        self.navigationController?.pushViewController(detailsVC, animated: false)
    }
}


