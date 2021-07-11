//
//  SearchDetailsController.swift
//  Deacon
//
//  Created by Apple on 08/07/21.
//

import UIKit

class SearchDetailsController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var lblActiveMode:UILabel!

    var getCellKey:[SetCellData] = []
    var setCellValues:[SetCellValues] = []
    var setSearchModal:SearchModal?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        SetUpdataforCell()
    }
    override func viewWillAppear(_ animated: Bool) {
        appNavigationWithBackButton(navigationTitle: "Search Detail")
    }
    func SetUpdataforCell(){
        self.title = "Search Result"
        guard  let setSearchModalData = setSearchModal else {
            return
        }
        SearchDetailsModal().prepareData(getSeachMOdal: setSearchModalData, comple: { [ weak self] (getdata) in
            self?.getCellKey = (getdata[0] as? [SetCellData])!
            self?.setCellValues = (getdata[1] as? [SetCellValues])!

        })
        lblActiveMode.text =  self.setCellValues[0].description
        self.setCellValues.removeFirst()
        tableView.reloadData()
    }

    func configureViews(){
        let nib = UINib(nibName: "SearchDetailsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchDetailsCell")

    }

    }

      extension SearchDetailsController:UITableViewDataSource,UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return   self.getCellKey.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDetailsCell") as? SearchDetailsCell  else { return UITableViewCell()}
            cell.lblTitle.text =  self.getCellKey[indexPath.row].title
            cell.lblSetDescription.text =  ":        \(self.setCellValues[indexPath.row].description)"

           return cell
        }
        
        
    }

   

