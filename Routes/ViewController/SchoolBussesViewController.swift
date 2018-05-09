//
//  SchoolBussesViewController.swift
//  Routes
//
//  Created by Angel Betancourt on 5/9/18.
//  Copyright © 2018 Angel. All rights reserved.
//

import UIKit

class SchoolBussesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    
    var schoolBuses: [SchoolBus] = []{
        didSet{
            guard isViewLoaded else { return }
            tableView?.reloadSections(IndexSet(integer: 0), with: .fade)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.endEditing(false)
        fetchAndFillData()
    }
    
    
    func setupTableView(){
        
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 80
        tableView?.register(UINib(nibName: "SchoolBusTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: SchoolBusTableViewCell.reuseIdentifier)
        
        tableView?.delegate = self
        tableView?.dataSource =  self
    }
    
    func fetchAndFillData(){
        
        Updater.fetchSchoolBuses {[weak self] (buses, error) in
            
            self?.hideActivityIndicator()
            
            if let error = error{
                self?.showSimpleAlert(error.localizedDescription)
                return
            }
            
            self?.schoolBuses = buses ?? []
        }
    }
    
    func didSelectSchoolBus(_ schoolBus: SchoolBus){
        showSchoolBus(schoolBus)
    }
    
    func showSchoolBus(_ schoolBus: SchoolBus){
        
        let schoolBusDetailViewController = storyboard!.instantiateViewController(withIdentifier: "SchoolBusDetailViewController") as! SchoolBusDetailViewController
        schoolBusDetailViewController.schoolBus = schoolBus
        show(schoolBusDetailViewController, sender: self)
    }
    
    
}







extension SchoolBussesViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    //Mark: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolBuses.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolBusTableViewCell.reuseIdentifier) as! SchoolBusTableViewCell
        cell.fillWithBus(schoolBuses[indexPath.row])
        return cell
    }
    
    
    //Mark: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectSchoolBus(schoolBuses[indexPath.row])
    }
    
    
    
}
