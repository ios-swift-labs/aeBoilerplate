//
//  DetailViewController.swift
//  aeBoilerplate
//
//  Created by ABDELAZiZ EL ARASSi on 7/9/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!

    var dataPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleData()
    }
    
    private func handleData(){
        if(dataPost == nil){
            toggleShowContent(true)
            errorLabel.isHidden = false
            errorLabel.text = StringsName.error_post.value()
            
            return
        }
        
        guard let id = dataPost?.id else { return  }
        guard let title = dataPost?.title else { return  }
        guard let body = dataPost?.body else { return  }
        
        toggleShowContent(false)
        idLabel.text = "ID : \(id)"
        titleLabel.text = title
        bodyLabel.text = body
    }
    
    private func toggleShowContent(_ status : Bool) {
        idLabel.isHidden = status
        titleLabel.isHidden = status
        bodyLabel.isHidden = status
    }

}

