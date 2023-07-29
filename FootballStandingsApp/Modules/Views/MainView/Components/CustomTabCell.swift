//
//  CustomTabCell.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 27/7/23.
//
import UIKit

class CustomTabCell: UITableViewCell {
    
    static let reuseId = String(describing: CustomTabCell.self)
    static let nibName = String(describing: CustomTabCell.self)
    
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
        title.font = .boldSystemFont(ofSize: 14)
        title.textColor = .black
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    } ()
    
    public lazy var abbrLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 14)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
       
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        idLabel.text = nil
        nameLabel.text = nil
        slugLabel.text = nil
        abbrLabel.text = nil
        logoImageView.image = nil
    }
    
    //            idLabel.heightAnchor.constraint(equalToConstant: 50),
    //            idLabel.widthAnchor.constraint(equalToConstant: 200)
    
    func setupConstraints() {
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(slugLabel)
        addSubview(abbrLabel)
        addSubview(logoImageView)
        
//        NSLayoutConstraint.activate([
//
//            idLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
//            idLabel.leftAnchor.constraint(equalTo:safeAreaLayoutGuide.leftAnchor, constant: 5),
//            idLabel.rightAnchor.constraint(equalTo:safeAreaLayoutGuide.rightAnchor),
//            idLabel.bottomAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor, constant: 5),
//
//            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
//            nameLabel.leftAnchor.constraint(equalTo: idLabel.rightAnchor, constant: 10),
//            nameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 5)
//        ])

//        NSLayoutConstraint.activate([
//            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//
//            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            nameLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 10),
//            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//
//        ])
   
//        NSLayoutConstraint.activate([
//            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//
//            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            nameLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 10),
//            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//
//
//            slugLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            slugLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
//            slugLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//        ])
        
            NSLayoutConstraint.activate([
                idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),

                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                nameLabel.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 10),
                
                slugLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                slugLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
                
                abbrLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                abbrLabel.leadingAnchor.constraint(equalTo: slugLabel.trailingAnchor, constant: 10),

                logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                logoImageView.leadingAnchor.constraint(equalTo: abbrLabel.trailingAnchor, constant: 10),
                logoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            ])

            // Добавьте ограничение для завершения внутреннего контента contentView после slugLabel
            contentView.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 5).isActive = true
        }


    func display(item: ListLeagues) {
//        DispatchQueue.global(qos: .userInitiated).async {
//            guard
//                let logos = item.data.logos,
//                let url = URL(string: logos),
//                let data = try? Data(contentsOf: url)
//            else {
//                return
//            }
//            DispatchQueue.main.async {
//                self.logoImageView.image = UIImage(data: data)
//            }
        }
        
//        let logos = Logos(light: "ссылка_на_светлый_логотип", dark: "ссылка_на_темный_логотип")
//
//        let datum = Datum(
//            id: "идентификатор",
//            name: "название",
//            slug: "слаг",
//            abbr: "аббревиатура",
//            logos: logos
//        )
//
//
//        idLabel.text = item.datum.id
//        nameLabel.text = item.datum.name
//        slugLabel.text = item.data.slug
//        abbrLabel.text = item.abbrLabel
//
//    }
}

