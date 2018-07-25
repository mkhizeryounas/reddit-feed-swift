//
//  TableViewController.swift
//  iosdev
//
//  Created by Khizer Younas on 25/07/2018.
//  Copyright © 2018 Khizer Younas. All rights reserved.
//

import UIKit

var posts = [Children]()
extension Int {
    var stringValue:String {
        return "\(self)"
    }
}
class TableViewController: UITableViewController {
    
    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let baseUrl = URL(string: "https://www.reddit.com/r/iosdev.json") else {return}
        URLSession.shared.dataTask(with: baseUrl) {(data,response, err) in
            guard let data = data else {return}
            do {
//                let json = try JSON(data: data)
//                posts = json["data"]["children"]
                let json = try JSONDecoder().decode(JsonModel.self, from: data)
//                print(json.data?.children?)
                posts = (json.data?.children)!
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
            } catch {
                print("JSON parse error", error)
            }
        }.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.title?.text = posts[indexPath.row].data?.title
        cell.author?.text = posts[indexPath.row].data?.author
        let optnum = posts[indexPath.row].data?.numComments?.stringValue
        cell.num_comment.text = optnum
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let alert = UIAlertController(title: posts[indexPath.row].data?.title, message: posts[indexPath.row].data?.selftext, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }


}

