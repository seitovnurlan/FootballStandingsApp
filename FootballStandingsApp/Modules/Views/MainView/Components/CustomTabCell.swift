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
        title.font = .systemFont(ofSize: 14)
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
        title.font = .systemFont(ofSize: 14)
        title.textColor = .systemGray
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
//        button.layer.cornerRadius = 4
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor.gray.cgColor
        button.addTarget(self, action: #selector(tappedFavouriteButton), for: .touchUpInside)
        button.tintColor = UIColor(named: "buttonColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        return button
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
//        favouriteButton.setImage(favouriteButton.image(for: .normal), for: .normal) = nil
    }
    
//    func setupConstraints() {
//        addSubview(idLabel)
//        addSubview(nameLabel)
//        addSubview(slugLabel)
//        addSubview(abbrLabel)
//        addSubview(logoImageView)
//        addSubview(favouriteButton)
//
//            NSLayoutConstraint.activate([
//                idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//                idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//
//                logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//                logoImageView.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 10),
//                logoImageView.heightAnchor.constraint(equalToConstant: 80),
//                logoImageView.widthAnchor.constraint(equalToConstant: 80),
//
//                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//                nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
//
//                slugLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 25),
//                slugLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
//
//                abbrLabel.topAnchor.constraint(equalTo: slugLabel.topAnchor, constant: 45),
//                abbrLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
//
//                favouriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//
//                favouriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//                favouriteButton.heightAnchor.constraint(equalToConstant: 30),
//                favouriteButton.widthAnchor.constraint(equalToConstant: 30)
//            ])
//
//            contentView.trailingAnchor.constraint(equalTo: favouriteButton.trailingAnchor, constant: 5).isActive = true
//        }
    
//    func setupConstraints() {
//        addSubview(idLabel)
//        addSubview(nameLabel)
//        addSubview(slugLabel)
//        addSubview(abbrLabel)
//        addSubview(logoImageView)
//        addSubview(favouriteButton)
//
//        let firstRowStack = UIStackView(arrangedSubviews: [idLabel, logoImageView, nameLabel])
//        firstRowStack.spacing = 10
//        firstRowStack.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(firstRowStack)
//
//        let secondRowStack = UIStackView(arrangedSubviews: [slugLabel, abbrLabel])
//        secondRowStack.axis = .vertical
//        secondRowStack.spacing = 5
//        secondRowStack.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(secondRowStack)
//
//        let mainStack = UIStackView(arrangedSubviews: [firstRowStack, secondRowStack, favouriteButton])
//        mainStack.axis = .vertical
//        mainStack.spacing = 10
//        mainStack.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(mainStack)
//
//        NSLayoutConstraint.activate([
//            firstRowStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            firstRowStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//
//            logoImageView.heightAnchor.constraint(equalToConstant: 80),
//            logoImageView.widthAnchor.constraint(equalToConstant: 80),
//
//            secondRowStack.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
//
//            favouriteButton.heightAnchor.constraint(equalToConstant: 30),
//            favouriteButton.widthAnchor.constraint(equalToConstant: 30),
//
//            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
//            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
//        ])
//    }

    func setupConstraints() {
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(slugLabel)
        addSubview(abbrLabel)
        addSubview(logoImageView)
        addSubview(favouriteButton)

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),

            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            logoImageView.leadingAnchor.constraint(equalTo: idLabel.trailingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
//            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),

            slugLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            slugLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
//            slugLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),

            abbrLabel.topAnchor.constraint(equalTo: slugLabel.bottomAnchor, constant: 10),
            abbrLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
//            abbrLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5),

            favouriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            favouriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 370),
            favouriteButton.heightAnchor.constraint(equalToConstant: 30),
            favouriteButton.widthAnchor.constraint(equalToConstant: 30),
        ])
            contentView.bottomAnchor.constraint(equalTo: abbrLabel.bottomAnchor, constant: 10).isActive = true
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

    @objc func tappedFavouriteButton(tapGestureRecognizer: UITapGestureRecognizer) {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        favouriteButton.setImage(favouriteButton.image(for: .normal) == UIImage(named: "star") ? UIImage(named: "star.fill") : UIImage(named: "star"), for: .normal)
        
//        let model = dataItems[indexPath.row]
//        let id = item.id
//        UserdefaultsService.shared.save(
//
//            model.id,
//            forKey: .titleName
//        )
    }


}

