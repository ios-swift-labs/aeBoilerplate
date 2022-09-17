//
//  MainViewController.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 6/9/2022.
//

import UIKit


@available(iOS 13.0, *)
class MainViewController: UIViewController {
    
    @IBOutlet weak var countArticlesLabel: UILabel!
    @IBOutlet weak var tableviewPosts: UITableView!
    
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .large)
    

    private var dataPosts = [Post]()
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "postCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initActivityIndicator()
        self.getPosts()
    }
    
    private func initActivityIndicator() {
        activityIndicator.color = UIColor.purple
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func toggleActivityIndicator(_ isActive : Bool) {
        isActive ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }

    private func getPosts(){
        if (Connectivity.isConnectedToInternet) {
            self.toggleActivityIndicator(true)
            NetworkStack.shared.getPosts(){ DataManagerResult in
                switch DataManagerResult {
                    case .success(let posts):
                        self.dataPosts = posts
                        self.countArticlesLabel.text = "Articles (\(posts.count))"
                        self.tableviewPosts.reloadData()
                        self.dataPosts = posts
                        self.toggleActivityIndicator(false)
                    case .error(let code):
                        print("code error \(code)")
                        self.toggleActivityIndicator(false)
                }
            }
        }else {
            Utils.showSimpleAlert(message: StringsName.error_internet.value())
        }
    }
    
    private func navigationDetail(_ post : Post?){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.dataPost = post
        self.present(detailViewController, animated: true, completion: nil)
    }

}

@available(iOS 13.0, *)
extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        guard indexPath.row > 0, indexPath.row < dataPosts.count else {
            return UITableViewCell()
        }
        
        let post: Post  = dataPosts[indexPath.item]
        
        let titlePost = cell.viewWithTag(100) as! UILabel
        titlePost.text = post.title
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationDetail(dataPosts[indexPath.item])
    }
    
}
