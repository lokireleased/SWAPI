//
//  PlanetTableViewCell.swift
//  SWAPI
//
//  Created by tyson ericksen on 11/21/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {

    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    var planets: Planets? {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        guard let planet = planets else { return }
       
        planetNameLabel.text = planet.name
        climateLabel.text = planet.climate
        populationLabel.text = "Population" + " " + planet.population
        dayLabel.text = "Hours in Day" + " " + planet.rotation_period
        yearLabel.text = "Days in Year" + " " + planet.orbital_period
    }
}
