//
//  favouritesVc.swift
//  FootballStandingsApp
//
//  Created by Nurlan Seitov on 30/7/23.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    var dataItemsFavourite: [Datum] = []
    
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
        navigationItem.title = "Favourites"
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setuptableView()
    
        tableView.reloadData()
    }
    
    private func setuptableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTabCell.self, forCellReuseIdentifier: CustomTabCell.reuseId)
//        tableView.register(UINib(
//            nibName: CustomTabCell.nibName,
//            bundleaa: nil),forCellReuseIdentifier: CustomTabCell.reuseId)
        tableView.backgroundColor = UIColor(named: "darkColor")
    }
}

extension FavouritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataItemsFavourite.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTabCell.reuseId,
            for: indexPath) as? CustomTabCell else {
            return UITableViewCell()
        }
        
        let datum = dataItemsFavourite[indexPath.row]
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
        
    }
}
