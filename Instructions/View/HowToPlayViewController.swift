//
//  HowToPlayViewController.swift
//  Trivia
//
//  Created by Hamzah Azam on 18/05/2023.
//

import UIKit

class HowToPlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        let backgroundImage = UIImage(named: "BG2")
        let backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFit
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)



        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var howToPlayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var funnyLabel: UILabel!
    @IBOutlet weak var goodLuck: UILabel!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HowToPlayViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell") as! SecondTableViewCell
        let cell3 = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell") as! ThirdTableViewCell
        
        if indexPath.row == 0 {
            return cell
        } else if indexPath.row == 1 {
            return cell2
        } else if indexPath.row == 2 {
            return cell3
            
        }
        
        return cell
    }
    
}



