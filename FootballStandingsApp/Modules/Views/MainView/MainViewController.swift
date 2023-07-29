//
//  ViewController.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 27/7/23.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainViewModel = MainViewModel()
    
    private var lists: [ListLeagues] = []
    
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
        
//        view.backgroundColor = .systemBlue
        view.addSubview(tableView)
        setuptableView()
        
    }
    private func setuptableView() {
        setupFakeData()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTabCell.self, forCellReuseIdentifier: CustomTabCell.reuseId)
//        tableView.register(UINib(
//            nibName: CustomTabCell.nibName,
//            bundle: nil),forCellReuseIdentifier: CustomTabCell.reuseId)
        tableView.backgroundColor = UIColor(named: "darkColor")
    }
    private func setupFakeData() {
        // Создаем объекты Logos let logos1 = Logos(light: "ссылка_на_светлый_логотип1", dark: "ссылка_на_темный_логотип1")
        let logos1 = Logos(light: "basketball", dark: "basketball.fill")
        let logos2 = Logos(light: "basketball", dark: "basketball.fill")
        let logos3 = Logos(light: "basketball", dark: "basketball.fill")
        let logos4 = Logos(light: "basketball", dark: "basketball.fill")
        let logos5 = Logos(light: "basketball", dark: "basketball.fill")
        let logos6 = Logos(light: "basketball", dark: "basketball.fill")

        // Создаем объекты Datum с использованием объектов Logos
        let datum1 = Datum(id: "1", name: "League 1", slug: "slug1", abbr: "abbr1", logos: logos1)
        let datum2 = Datum(id: "2", name: "League 2", slug: "slug2", abbr: "abbr2", logos: logos2)
        let datum3 = Datum(id: "3", name: "League 3", slug: "slug3", abbr: "abbr3", logos: logos3)
        let datum4 = Datum(id: "4", name: "League 4", slug: "slug4", abbr: "abbr4", logos: logos4)
        let datum5 = Datum(id: "5", name: "League 5", slug: "slug5", abbr: "abbr5", logos: logos5)
        let datum6 = Datum(id: "6", name: "League 6", slug: "slug6", abbr: "abbr6", logos: logos6)

        // Создаем объекты ListLeagues с массивами из одного элемента Datum
        let listLeagues1 = ListLeagues(status: true, data: [datum1])
        let listLeagues2 = ListLeagues(status: true, data: [datum2])
        let listLeagues3 = ListLeagues(status: true, data: [datum3])
        let listLeagues4 = ListLeagues(status: true, data: [datum4])
        let listLeagues5 = ListLeagues(status: true, data: [datum5])
        let listLeagues6 = ListLeagues(status: true, data: [datum6])

        // Добавляем объекты ListLeagues в массив lists
        lists = [listLeagues1, listLeagues2, listLeagues3,listLeagues4, listLeagues5, listLeagues6]
    }
}
    

//        private func fetchList() {
//
//            Task {
//                do {
//                    let response = try await mainViewModel.fetchList()
//                    DispatchQueue.main.async {
//                        self.list = response.data.id
//                        self.tableView.reloadData()
//                    }
//                } catch {
////                    showAlert(with: error.localizedDescription)
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }


extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(lists.count)
       return lists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTabCell.reuseId,
            for: indexPath) as? CustomTabCell else {
            return UITableViewCell()
        }
        
        let listLeagues = lists[indexPath.row]
        if let datum = listLeagues.data.first {
            cell.idLabel.text = datum.id
            cell.nameLabel.text = datum.name
            cell.slugLabel.text = datum.slug
            cell.abbrLabel.text = datum.abbr
            cell.logoImageView.image = UIImage(named: datum.logos.light)
        }
        
       
           
       
        
//        cell.display(item: listLeagues)
//        cell.textLabel?.text = "rrrrrrrrrr"
        
//        cell.backgroundColor = .red
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let model = lists[indexPath.row]
//        print(lists[indexPath.row])
//        UserdefaultStorage.shared.save(
//            model.title,
//            forKey: .titleName
//        )
    }
}
