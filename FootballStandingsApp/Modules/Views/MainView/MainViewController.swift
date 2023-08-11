//
//  ViewController.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 27/7/23.
//
import UIKit

class MainViewController: UIViewController {
    
    private let mainViewModel = MainViewModel()
    
    private var dataItems: [Datum] = []
    private var favouriteItems: [Datum] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
//        table.backgroundColor = .systemGray4
        return table
    } ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
//        navigationController?.navigationBar.backgroundColor = .systemBlue
        navigationItem.title = "Football Standings"
        
        //        fetchList()
        tableView.reloadData()
    }
    
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        view.backgroundColor = UIImage(named: "ball")
        view.addSubview(tableView)
        setuptableView()
        loadApi()
        
    }
    private func setuptableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTabCell.self, forCellReuseIdentifier: CustomTabCell.reuseId)
//        tableView.register(UINib(
//            nibName: CustomTabCell.nibName,
//            bundle: nil),forCellReuseIdentifier: CustomTabCell.reuseId)
//        tableView.backgroundColor = UIColor(named: "darkColor")
    }

    private func loadApi() {
       
//        DispatchQueue.global(qos: .userInitiated).async {[weak self] in
//            
//        }
        let networkLayer = NetworkLayer()
        
        networkLayer.fetchList { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    guard let `self` else {return}
                    self.dataItems = data.data
        
                    self.tableView.reloadData()
//                    let vc = GetRequestPage()
//                    vc.data = data.products ?? []
//                     self.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                       DispatchQueue.main.async {
                           self?.showAlertWithTitle("Error", message: error.localizedDescription)
                       }
//            case .failure(let error):
//                print(error.localizedDescription)
            }
        }
    }
    
    private func showAlertWithTitle(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
    
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTabCell.reuseId,
            for: indexPath) as? CustomTabCell else {
            return UITableViewCell()
        }
        
        let datum = dataItems[indexPath.row]
        cell.cellData = datum
//        cell.isFavourite = UserdefaultsService.shared.get(forKey: "Favourite_\(datum.id)") != nil
        cell.display(item: datum, atIndex: indexPath.row + 1)
        
        return cell
    }
    
//    cell.idLabel.text = datum.id
//    cell.nameLabel.text = datum.name
//    cell.slugLabel.text = datum.slug
//    cell.abbrLabel.text = datum.abbr
//    cell.logoImageView.image = UIImage(named: datum.logos.light)
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedDatum = dataItems[indexPath.row]
        
        let secondViewController = SecondViewController()
        secondViewController.selectedData = selectedDatum
        secondViewController.index = indexPath.row + 1

        if let cell = tableView.cellForRow(at: indexPath) as? CustomTabCell {
            secondViewController.selectedImage = cell.logoImageView.image
        }
        // Устанавливаем состояние кнопки "Favourite" во втором контроллере на основе наличия выбранного элемента в массиве favouriteItems
        secondViewController.isFavourite = favouriteItems.contains { $0.id == selectedDatum.id }
        
        secondViewController.favouriteButtonTapHandler = { [weak self] isFavourite in
            print("Index: \(indexPath.row), isFavourite: \(isFavourite)")
                if isFavourite {
                    // Добавляем элемент в массив favouriteItems, если он еще не в нем
                    if !(self?.favouriteItems.contains { $0.id == selectedDatum.id } ?? false) {
                        self?.favouriteItems.append(selectedDatum)
                    }
                } else {
                    // Удаляем элемент из массива favouriteItems
                    if let index = self?.favouriteItems.firstIndex(where: { $0.id == selectedDatum.id }) {
                        self?.favouriteItems.remove(at: index)
                    }
                }
            }
        navigationController?.pushViewController(secondViewController, animated: false)
    }
}
