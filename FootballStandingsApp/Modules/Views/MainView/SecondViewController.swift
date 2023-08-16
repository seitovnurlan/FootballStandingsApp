//
//  SecondViewController.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 31/7/23.
//
import UIKit

protocol SecondViewControllerDelegate: AnyObject {
//    func updateFavouriteState(_ isFavourite: Bool, forCellWithId cellId: String)
    func updateFavouriteState(for itemId: String, isFavourite: Bool)
}

class SecondViewController: UIViewController {
    
    func updateFavouriteState(for itemId: String, isFavourite: Bool) {
           self.isFavourite = isFavourite
           updateFavouriteButtonImage()
           print("сработал метод обновления состояния \(isFavourite)")
       }
    
    weak var delegate: SecondViewControllerDelegate?
    var cellData: Datum?
    var selectedData: Datum?
    var selectedImage: UIImage?
    var index: Int = 0
    var isFavourite: Bool = false
        {
            didSet {
              updateFavouriteButtonImage()
            }
        }
    
    public lazy var idLabelSecond: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = .black
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    } ()
    
    public lazy var nameLabelSecond: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = .black
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    } ()
    
    public lazy var slugLabelSecond: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 12)
        title.textColor = .gray
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    } ()
    
    public lazy var abbrLabelSecond: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 17)
        title.textColor = .systemGray
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    } ()
    
    public lazy var logoImageViewSecond: UIImageView = {
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
    
    private lazy var favouriteButtonSecond: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "star"), for: .normal)
//        button.backgroundColor = .white
//        button.layer.cornerRadius = 4
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(tappedButtonSecond), for: .touchUpInside)
        button.tintColor = UIColor(named: "buttonColor")
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.isHidden = false
        return button
    } ()
    
    public lazy var ballImageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
//        image.layer.cornerRadius = 5
//        image.layer.borderWidth = 1
//        image.layer.borderColor = UIColor.gray.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "photoball")
        image.alpha = 0.5
        return image
    } ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
//        navigationController?.navigationBar.backgroundColor = .systemBlue
        navigationItem.title = "Football Standings"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
        let key = "Favorite_\(cellData?.id)"
//        let cell = CustomTabCell(style: .default, reuseIdentifier: CustomTabCell.reuseId)
//        cell.isFavourite = UserdefaultsService.shared.get(forKey: key) == selectedData?.id

        if let data = selectedData {
                idLabelSecond.text = "\(index)"
                nameLabelSecond.text = data.name
                slugLabelSecond.text = data.slug
                abbrLabelSecond.text = data.abbr
                }
        if let image = selectedImage {
            logoImageViewSecond.image = image
                }
        
        if UserdefaultsService.shared.get(forKey: key) == selectedData?.id {
            updateFavouriteButtonImage()
        }
    }
    
    func setupConstraints() {
        view.addSubview(logoImageViewSecond)
        view.addSubview(idLabelSecond)
        view.addSubview(nameLabelSecond)
        view.addSubview(slugLabelSecond)
        view.addSubview(abbrLabelSecond)
        view.addSubview(favouriteButtonSecond)
        view.addSubview(ballImageView)
        

        NSLayoutConstraint.activate([
            logoImageViewSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            logoImageViewSecond.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageViewSecond.heightAnchor.constraint(equalToConstant: 180),
            logoImageViewSecond.widthAnchor.constraint(equalToConstant: 180),
            
            idLabelSecond.topAnchor.constraint(equalTo: logoImageViewSecond.bottomAnchor, constant: 40),
            idLabelSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),

            nameLabelSecond.topAnchor.constraint(equalTo: logoImageViewSecond.bottomAnchor, constant: 40),
            nameLabelSecond.leadingAnchor.constraint(equalTo: idLabelSecond.trailingAnchor, constant: 10),

            slugLabelSecond.topAnchor.constraint(equalTo: nameLabelSecond.bottomAnchor, constant: 20),
            slugLabelSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

            abbrLabelSecond.topAnchor.constraint(equalTo: slugLabelSecond.bottomAnchor, constant: 20),
            abbrLabelSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

            favouriteButtonSecond.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            favouriteButtonSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            favouriteButtonSecond.heightAnchor.constraint(equalToConstant: 30),
            favouriteButtonSecond.widthAnchor.constraint(equalToConstant: 30),
            
            ballImageView.topAnchor.constraint(equalTo: favouriteButtonSecond.bottomAnchor, constant: 120),
            ballImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballImageView.heightAnchor.constraint(equalToConstant: 100),
            ballImageView.widthAnchor.constraint(equalToConstant: 100),
        ])
//        view.bottomAnchor.constraint(equalTo: abbrLabelSecond.bottomAnchor, constant: 400).isActive = true
    }
  
//    @objc func tappedButtonSecond(tapGestureRecognizer: UITapGestureRecognizer) {
    @objc func tappedButtonSecond() {
        
        isFavourite.toggle() // Переключение состояния кнопки
        updateFavouriteButtonImage() // Вызываем метод обновления изображения кнопки
        if let selectedData = selectedData {
            delegate?.updateFavouriteState(for: selectedData.id, isFavourite: isFavourite)
            }
        print("data.id: \(String(describing: selectedData?.id)), isFavourite: \(isFavourite)")
    }
    
    public func updateFavouriteButtonImage() {
            let imageName = isFavourite ? "star.fill" : "star"
            favouriteButtonSecond.setImage(UIImage(named: imageName), for: .normal)
        }
}
    
