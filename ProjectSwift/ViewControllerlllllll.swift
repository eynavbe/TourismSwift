////
////  ViewControllerlllllll.swift
////  ProjectSwift
////
////  Created by Eynav Ben Shlomo on 17/07/2019.
////  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
////
//
//import UIKit
//
//class ViewControllerlllllll: UIViewController {
//
//    @IBOutlet weak var jjj: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//extension ViewController: UITableViewDelegate, UITableViewDataSource{
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        //        print(listCommunityAndCities.count)
//        //        return listCommunityAndCities.count
//        let cont = ["red","um","fm"]
//        return cont.count
//    }
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCities")
//        //        cell?.textLabel?.text = listCommunityAndCities[indexPath.row].getName()
//        let cont = ["red","um","fm"]
//        cell?.textLabel?.text = cont[indexPath.row]
//        return cell!
//    }
//}
