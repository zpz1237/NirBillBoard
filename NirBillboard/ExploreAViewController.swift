//
//  ExploreAViewController.swift
//  NirBillboard
//
//  Created by Nirvana on 7/13/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

var exploreContentsArray = [CellContents]()
var exploreContentsModel = CellContents()

class ExploreAViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exploreContentsModel.titleLabelText = "旅行"
        exploreContentsModel.detailTitleLabelText = "Yosemite国家公园"
        exploreContentsModel.timeDescribleText = "7月21日 - 8月2日"
        exploreContentsModel.chosenImageImage = UIImage(named: "exploreA")!
        exploreContentsArray.append(exploreContentsModel)
        
        exploreContentsModel.titleLabelText = "旅行"
        exploreContentsModel.detailTitleLabelText = "Yosemite国家公园"
        exploreContentsModel.timeDescribleText = "7月21日 - 8月2日"
        exploreContentsModel.chosenImageImage = UIImage(named: "exploreB")!
        exploreContentsArray.append(exploreContentsModel)
        
        exploreContentsModel.titleLabelText = "旅行"
        exploreContentsModel.detailTitleLabelText = "Yosemite国家公园"
        exploreContentsModel.timeDescribleText = "7月21日 - 8月2日"
        exploreContentsModel.chosenImageImage = UIImage(named: "exploreC")!
        exploreContentsArray.append(exploreContentsModel)
        
        exploreContentsModel.titleLabelText = "旅行"
        exploreContentsModel.detailTitleLabelText = "Yosemite国家公园"
        exploreContentsModel.timeDescribleText = "7月21日 - 8月2日"
        exploreContentsModel.chosenImageImage = UIImage(named: "exploreD")!
        exploreContentsArray.append(exploreContentsModel)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("exploreCell")! as! ExploreATableViewCell
        
        cell.exploreTitleLabel.text = exploreContentsArray[indexPath.row].detailTitleLabelText
        cell.exploreTypeLabel.text = exploreContentsArray[indexPath.row].titleLabelText
        cell.exploreTimeLabel.text = exploreContentsArray[indexPath.row].timeDescribleText
        cell.exploreImageView.image = exploreContentsArray[indexPath.row].chosenImageImage
        
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
