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
    var getSearchModal:[SearchModal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        let nib = UINib(nibName: "SearchBarCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "SearchBarCell")
        tableview.dataSource = self
        tableview.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        appNavigationWithBackButton(navigationTitle: "Search Result")
    }
    func callSearchData(searchText:String){
        
        let url = WebServiceNames.baseUrl.rawValue + WebServiceNames.searchApi.rawValue + searchText
        WebServices.requestApiWithDictParam(url: url, params:[:], modalType:SearchModal.self) {(result, message, status )in
        if status {
            self.filtered.removeAll()
            guard let getresult  = result  else {return}
            self.getSearchModal = getresult
            if self.getSearchModal.count > 0{
                self.getSearchModal.forEach({ data in
                    self.filtered.append(data.workAddress ?? "")
                })
            }else{
                self.filtered = []
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Router.goToSearchDetailsVC(target: self, getserachData: getSearchModal[indexPath.row])
        
    }
}
