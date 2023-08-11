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
    
    var cellData: Datum?
    var favouriteButtonTapHandler: ((Bool) -> Void)?
    var isFavourite: Bool = false {
        didSet {
            updateFavouriteButtonImage()
        }
    }
    
    public lazy var idLabel: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 14)
        title.textColor = .black
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    } ()
    
    public lazy var nameLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 14)
        title.textColor = .black
        title.textAlignment = .justified
        title.isUserInteractionEnabled = true
        title.translatesAutoresizingMaskIntoConstraints = false
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
    }

    func setupConstraints() {
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(slugLabel)
        addSubview(abbrLabel)
        addSubview(logoImageView)
        addSubview(favouriteButton)

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),

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

            favouriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
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
        self.cellData = item
//        idLabel.text = item.id
        idLabel.text = "\(index)"
        nameLabel.text = item.name
        slugLabel.text = item.slug
        abbrLabel.text = item.abbr
    }

    @objc func tappedFavouriteButton(tapGestureRecognizer: UITapGestureRecognizer) {
        
        guard let cellData = cellData else {
               return // В случае отсутствия данных, просто выходим
           }
        
        isFavourite.toggle() // Переключение состояния кнопки
        updateFavouriteButtonImage() // Вызываем метод обновления изображения кнопки
        
        if isFavourite {
                FavouritesManager.shared.addToFavourites(cellData)
            } else {
                FavouritesManager.shared.removeFromFavourites(cellData)
            }

            favouriteButtonTapHandler?(isFavourite)
        
        
        
//        let key = "Favorite_\(cellData.id)"
//           // Обращение к UserDefaultsService и сохранение/удаление данных
//        isFavourite ? UserdefaultsService.shared.save(cellData.id, forKey: key) : UserdefaultsService.shared.remove(forKey: key)
//
//           favouriteButtonTapHandler?(cellData, isFavourite)
//
//        if isFavourite {
//                if !dataItemsFavourite.contains(where: { $0.id == cellData.id }) {
//                    dataItemsFavourite.append(cellData)
//                    tableView.reloadData() // Обновление таблицы в FavouritesViewController
//                }
//        } else {
//            if let index = dataItemsFavourite.firstIndex(where: { $0.id == cellData.id }) {
//                dataItemsFavourite.remove(at: index)
//                tableView.reloadData() // Обновление таблицы в FavouritesViewController
//            }
            
            //        favouriteButton.setImage(favouriteButton.image(for: .normal) == UIImage(named: "star") ? UIImage(named: "star.fill") : UIImage(named: "star"), for: .normal)
            //        var isFavourite = favouriteButton.image(for: .normal) == UIImage(named: "star.fill")
            //        isFavourite.toggle() // Переключение состояния кнопки
            //        favouriteButtonTapHandler?(isFavourite)
            
            //        let model = dataItems[indexPath.row]
            //        let id = item.id
            //        UserdefaultsService.shared.save(
            //
            //            model.id,
            //            forKey: .titleName
            //        )
//        }
    }
    func updateFavouriteButtonImage() {
            let imageName = isFavourite ? "star.fill" : "star"
            favouriteButton.setImage(UIImage(named: imageName), for: .normal)
        }

}

