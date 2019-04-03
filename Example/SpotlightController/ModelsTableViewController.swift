//
//  ModelsTableViewController.swift
//  SpotlightController_Example
//
//  Copyright (c) 2019 dashdevs.com. All rights reserved.
//

import UIKit

class ModelsTableViewController: UITableViewController {
    var models: [AppModel] = Current.models
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reuseIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        let model = models[indexPath.row]
        cell?.textLabel?.text = model.title
        cell?.detailTextLabel?.text = model.content
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController, let idx = tableView.indexPathForSelectedRow {
            let model = models[idx.row]
            vc.model = model
            
            if let app = UIApplication.shared.delegate as? AppDelegate {
                app.spotlight?.index([model])
            }
        }
    }
    
    @IBAction func clearIndexAction(_ sender: UIBarButtonItem) {
        if let app = UIApplication.shared.delegate as? AppDelegate {
            app.spotlight?.deindexAll()
        }
    }
}
