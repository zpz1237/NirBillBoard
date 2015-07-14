//
//  HomeViewController.swift
//  NirBillboard
//
//  Created by Nirvana on 7/11/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("homeDetailSegue", sender: self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 205
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homeCell")! as! HomeTableViewCell
        tableView.separatorStyle = .None
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "旅行"
            break
        case 1:
            cell.titleLabel.text = "二次元"
            cell.detailTitleLabel.text = "初音未来演唱会"
            cell.timeDescribe.text = "6月28日"
            cell.chosenImage.image = UIImage(named: "placeHolderB")
        case 2:
            cell.titleLabel.text = "网游"
            cell.detailTitleLabel.text = "剑侠情缘叁"
            cell.timeDescribe.text = "8月7日"
            cell.chosenImage.image = UIImage(named: "placeHolderC")
        case 3:
            cell.titleLabel.text = "互联网"
            cell.detailTitleLabel.text = "WWDC2015"
            cell.timeDescribe.text = "6月8日 - 6月12日"
            cell.chosenImage.image = UIImage(named: "placeHolderD")
        default:
            print("indexpath.row超出范围")
        }
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        print("back")
    }

}
