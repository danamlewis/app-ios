//
//  HealthQuizViewController.swift
//  CoEpi
//
//  Created by Dusko Ojdanic on 3/26/20.
//  Copyright © 2020 org.coepi. All rights reserved.
//

import UIKit

class HealthQuizViewController: UIViewController {
    
    @IBOutlet weak var symptomList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        symptomList.register(SymptomCell.self, forCellReuseIdentifier: "SymptomCell")
        symptomList.delegate = self
        symptomList.dataSource = self
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension HealthQuizViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SymptomCell")!
//        cell.textLabel?.text = "Test"
        return cell
    }

}
