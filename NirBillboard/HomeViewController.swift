//
//  HomeViewController.swift
//  NirBillboard
//
//  Created by Nirvana on 7/11/15.
//  Copyright © 2015 NSNirvana. All rights reserved.
//

import UIKit

struct CellContents {
    var titleLabelText: String = ""
    var detailTitleLabelText: String  = ""
    var timeDescribleText: String = ""
    var chosenImageImage: UIImage = UIImage(named: "placeHolderA")!
}

//数据源
var homeContentsArray = [CellContents]()
var homeContentsModel = CellContents()

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    var selectedCellCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.translucent  = false
        
        self.tableView.header = setupHeader(wayToRefresh.gifRefresh)!
        self.tableView.footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("loadMoreData"))
        
        homeContentsModel.titleLabelText = "旅行"
        homeContentsModel.detailTitleLabelText = "Yosemite国家公园"
        homeContentsModel.timeDescribleText = "7月21日 - 8月2日"
        homeContentsModel.chosenImageImage = UIImage(named: "placeHolderA")!
        homeContentsArray.append(homeContentsModel)
        
        homeContentsModel.titleLabelText = "二次元"
        homeContentsModel.detailTitleLabelText = "初音未来演唱会"
        homeContentsModel.timeDescribleText = "6月28日"
        homeContentsModel.chosenImageImage = UIImage(named: "placeHolderB")!
        homeContentsArray.append(homeContentsModel)
        
        homeContentsModel.titleLabelText = "网游"
        homeContentsModel.detailTitleLabelText = "剑侠情缘叁"
        homeContentsModel.timeDescribleText = "8月7日"
        homeContentsModel.chosenImageImage = UIImage(named: "placeHolderC")!
        homeContentsArray.append(homeContentsModel)
        
        homeContentsModel.titleLabelText = "互联网"
        homeContentsModel.detailTitleLabelText = "WWDC2015"
        homeContentsModel.timeDescribleText = "6月8日 - 6月12日"
        homeContentsModel.chosenImageImage = UIImage(named: "placeHolderD")!
        homeContentsArray.append(homeContentsModel)
        
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedCellCount = indexPath.row
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
        
        cell.titleLabel.text = homeContentsArray[indexPath.row].titleLabelText
        cell.detailTitleLabel.text = homeContentsArray[indexPath.row].detailTitleLabelText
        cell.timeDescribe.text = homeContentsArray[indexPath.row].timeDescribleText
        cell.chosenImage.image = homeContentsArray[indexPath.row].chosenImageImage
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "homeDetailSegue" {
            
            if let nav = segue.destinationViewController as? UINavigationController {
                if let vc = nav.topViewController as? HomeDetailViewController {
                    vc.homeDetailImageTemp = homeContentsArray[selectedCellCount].chosenImageImage
                }
            }
        }
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        print("back")
    }
    
    // MARK: - Refresh
    enum wayToRefresh {
        case normalRefresh
        case gifRefresh
    }
    
    func setupHeader(method: wayToRefresh) -> MJRefreshHeader? {
        
        switch method {
        case .normalRefresh:
            let normalHeader = MJRefreshNormalHeader { () -> Void in
                print("NormalRefresh")
                self.tableView.header.endRefreshing()
            }
            return normalHeader
            
        case .gifRefresh:
            let gifHeader = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: Selector("loadMoreData"))
            //添加图片
            gifHeader.setImages(addDropDownImages()!, forState: MJRefreshStateIdle)
            gifHeader.setImages(addLoadingImages()!, forState: MJRefreshStateRefreshing)
            return gifHeader
        }
        
    }
    
    func loadMoreData() {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(1*Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            self.tableView.header.endRefreshing()
            self.tableView.footer.endRefreshing()
        })
    }
    
    func addDropDownImages() -> [UIImage]? {
        var images = [UIImage]()
        var imageName: String
        for i in 1...60 {
            imageName = "dropdown_anim__000\(i)"
            let image = UIImage(named: imageName)
            images.append(image!)
        }
        return images
    }
    
    func addLoadingImages() -> [UIImage]? {
        var images = [UIImage]()
        var imageName: String
        for i in 1...3 {
            imageName = "dropdown_loading_0\(i)"
            let image = UIImage(named: imageName)
            images.append(image!)
        }
        return images
        
    }

}
