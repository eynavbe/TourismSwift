//
//  MoreAboutCityTabBarController.swift.swift
//  ProjectSwift
//
//  Created by Eynav Ben Shlomo on 03/08/2019.
//  Copyright © 2019 Eynav Ben Shlomo. All rights reserved.
//

import UIKit

class MoreAboutCityTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        UIApplication.shared.statusBarFrame.size.height
//        tabBar.frame = CGRect(x: 0, y:  tabBar.frame.size.height, width: tabBar.frame.size.width, height: tabBar.frame.size.height)
//        
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    
        tabBar.frame = CGRect(x: 0, y: 400, width: tabBar.frame.size.width, height: tabBar.frame.size.height)
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
