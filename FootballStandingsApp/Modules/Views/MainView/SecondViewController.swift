//
//  SecondViewController.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 31/7/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var dataItemsSecond: [Datum] = []
    
    public lazy var idLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 14)
        title.textColor = .black
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Hello,"
        return title
    } ()
    
    public lazy var nameLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 14)
        title.textColor = .black
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = " world!"
        return title
    } ()
    
    public lazy var slugLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 12)
        title.textColor = .gray
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    } ()
    
    public lazy var abbrLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 15)
        title.textColor = .black
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    } ()
    
    public lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
//        image.layer.cornerRadius = 5
//        image.layer.borderWidth = 1
//        image.layer.borderColor = UIColor.gray.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    private lazy var favouriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "star"), for: .normal)
//        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        button.tintColor = UIColor(named: "buttonColor")
        return button
    } ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
//        navigationController?.navigationBar.backgroundColor = .systemBlue
        navigationItem.title = "Football Standings"
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
//        view.backgroundColor = UIImage(named: "ball")
  
//        loadApi()
        setupConstraints()
        
    }

    private func loadApi() {
        
        let networkLayer = NetworkLayer()
        
        networkLayer.fetchList { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let `self` else {return}
                    self.dataItemsSecond = data.data
//                    self.tableView.reloadData()
//                    let vc = GetRequestPage()
//                    vc.data = data.products ?? []
//                     self.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setupConstraints() {
        view.addSubview(idLabel)
        view.addSubview(nameLabel)
        view.addSubview(slugLabel)
        view.addSubview(abbrLabel)
        view.addSubview(logoImageView)
        view.addSubview(favouriteButton)

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),

            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            logoImageView.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),

            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
//            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),

            slugLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            slugLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
//            slugLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),

            abbrLabel.topAnchor.constraint(equalTo: slugLabel.bottomAnchor, constant: 10),
            abbrLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
//            abbrLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),

            favouriteButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            favouriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 370),
//            trailingConstraint,
            favouriteButton.heightAnchor.constraint(equalToConstant: 30),
            favouriteButton.widthAnchor.constraint(equalToConstant: 30),
        ])
        view.bottomAnchor.constraint(equalTo: abbrLabel.bottomAnchor, constant: 10).isActive = true
    }
  
    
    @objc func tappedButton(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        tappedImage.image = tappedImage.image == UIImage(named: "star") ? UIImage(named: "star.fill") : UIImage(named: "star")
    }
}
    
