//
//  SearchBarController.swift
//  Deacon
//
//  Created by Apple on 05/07/21.
//

import UIKit

class SearchBarController: UIViewController ,NibLoaded, UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview:UITableView!
    var searchActive : Bool = false
    var data:[String] = []
    var filtered:[String] = []
    var resultdata:[NSDictionary]  = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        let nib = UINib(nibName: "SearchBarCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "SearchBarCell")
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    func callSearchData(searchText:String){
        
        let url = WebServiceNames.baseUrl.rawValue + WebServiceNames.searchApi.rawValue + searchText
        WebServices.requestApiWithDictParam(url: url, params:[:]) {(result, message, status )in
        if status {
            let loginDetails = result as? WebServices
            self.resultdata = loginDetails?.responceDataArray ?? []
         if self.resultdata.count > 0{
        for getdata in self.resultdata{
            if let Work_Address = getdata["Work_Address"] as? String
            {
                self.filtered.append(Work_Address)
            }
            
        }
        
        if(self.filtered.count == 0){
            self.searchActive = false;
        } else {
            self.searchActive = true;
        }
            
        }else{
            self.searchActive = false;
            
        }
        
        self.tableview.reloadData()
        
    }
        }
    }
   
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchActive = false;
        }
    

   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchText == "" {
           searchActive = false
           tableview.reloadData()
       }
       else{
        print("search",searchText)
           callSearchData(searchText: searchText)
       }
           
        }

}
extension SearchBarController:UITableViewDataSource, UITableViewDelegate{
  
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBarCell") as? SearchBarCell  else { return UITableViewCell()}
        if(searchActive){
            cell.lblTitle?.text = filtered[indexPath.row]
        }
        
        return cell;
    }
}
