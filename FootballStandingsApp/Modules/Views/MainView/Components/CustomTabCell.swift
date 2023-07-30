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
    
    func setupConstraints() {
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(slugLabel)
        addSubview(abbrLabel)
        addSubview(logoImageView)
        
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
                logoImageView.heightAnchor.constraint(equalToConstant: 80),
                logoImageView.widthAnchor.constraint(equalToConstant: 80)
            ])

            contentView.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 5).isActive = true
        }

    func display(item: Datum, atIndex index: Int) {
        // Устанавливаем изображение логотипа по умолчанию или очищаем изображение
        self.logoImageView.image = UIImage(named: "soccerball") // Замените "placeholder" на имя вашего изображения по умолчанию

        // Проверяем, что logos.dark не пустой, иначе выводим сообщение об ошибке
        guard !item.logos.light.isEmpty else {
            print("Invalid URL for the logo or missing logos.dark property.")
            return
        }

        // Пытаемся создать URL из logos.dark
        if let url = URL(string: item.logos.light) {
            // Используем URLSession для асинхронной загрузки данных изображения
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    // Обновляем пользовательский интерфейс на основной поток
                    DispatchQueue.main.async {
                        // Устанавливаем загруженное изображение, если оно не nil
                        self?.logoImageView.image = image
                    }
                }
            }
            task.resume()
        }

//        idLabel.text = item.id
        idLabel.text = "\(index)"
        nameLabel.text = item.name
        slugLabel.text = item.slug
        abbrLabel.text = item.abbr
    }




}

