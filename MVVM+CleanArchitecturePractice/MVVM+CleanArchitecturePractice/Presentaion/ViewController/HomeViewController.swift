//
//  HomeViewController.swift
//  MVVM+CleanArchitecturePractice
//
//  Created by 川島真之 on 2026/07/21.
//

import UIKit

class HomeViewController: UIViewController {

  override func loadView() {
    view = HomeView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
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
