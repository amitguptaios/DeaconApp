//
//  HomePageVC.swift
//  Deacon
//
//  Created by Apple on 03/07/21.
//

import UIKit

class HomePageVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func didPressedSettingButton(){
        Router.goTosearchVC(target: self)
        
    }
    @IBAction func didPressedSearchButton(){
        Router.goToPoilceBackup(target: self)
        
    }

}
