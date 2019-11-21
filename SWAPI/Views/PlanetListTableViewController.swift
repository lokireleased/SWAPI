//
//  PlanetListTableViewController.swift
//  SWAPI
//
//  Created by tyson ericksen on 11/21/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class PlanetListTableViewController: UITableViewController {
    
    var planets: [Planets] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlanetController.fetchPlanet { (result) in
            switch result {
            case .success(let planet):
                self.planets = planet
            case .failure(let error):
                print(error, error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.frame.height / 9
        return height
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath) as? PlanetTableViewCell else { return UITableViewCell() }

        let planet = planets[indexPath.row]
        cell.planets = planet

        return cell
    }
}
