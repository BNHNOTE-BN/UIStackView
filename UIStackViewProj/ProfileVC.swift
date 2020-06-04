//
//  ProfileVC.swift
//  UIStackViewProj
//
//  Created by Banyar on 28/5/20.
//  Copyright © 2020 BNH. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var footerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setup()
       
    }
    
    func setup(){
        self.footerView.layer.cornerRadius = 20
        self.setupProfileInfoView()
        self.setupFooterRootSV()
    }
    
    func setupProfileInfoView(){
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 75
        
        
        let nameLabel = UILabel()
        nameLabel.text = "Nia Jackson"
        
        let addressLabel = UILabel()
        addressLabel.text = "Yangon"
        
        let occupationLabel = UILabel()
        occupationLabel.text = "Occupation : Model"
        
        let rootSV = UIStackView()
        rootSV.axis = .vertical
        rootSV.distribution = .fill
        rootSV.alignment = .center
        rootSV.spacing = 10
        
        rootSV.addArrangedSubview(imageView)
        rootSV.addArrangedSubview(nameLabel)
        rootSV.addArrangedSubview(addressLabel)
        rootSV.addArrangedSubview(occupationLabel)
        
        self.view.addSubview(rootSV)
        
        rootSV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rootSV.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            rootSV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            rootSV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    
    //MARK: Setup Footer View
    func setupFooterRootSV(){
        let rootSV = UIStackView()
        rootSV.axis = .vertical
        rootSV.distribution = .fillEqually
        rootSV.alignment = .fill
        rootSV.spacing = 10
        
        let birthdaySV = self.getMenuInfoSV("January 1", "ic_birthday")
        let socialSV = self.getMenuInfoSV("@nia_jackson", "ic_social")
        let locSV = self.getMenuInfoSV("contact_jackson", "ic_location")
        let urlSV = self.getMenuInfoSV("naijackon.com", "ic_link")
        let favSV = self.getMenuInfoSV("music, movie", "ic_fav")
        rootSV.addArrangedSubview(birthdaySV)
        rootSV.addArrangedSubview(socialSV)
        rootSV.addArrangedSubview(locSV)
        rootSV.addArrangedSubview(urlSV)
        rootSV.addArrangedSubview(favSV)
        
        self.footerView.addSubview(rootSV)
        
        rootSV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rootSV.topAnchor.constraint(equalTo: self.footerView.topAnchor, constant: 50),
            rootSV.leadingAnchor.constraint(equalTo: self.footerView.leadingAnchor, constant: 30),
            rootSV.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: 30),
        ])
    }

    //MARK: Horizontal SV
    func getMenuInfoSV(_ infoTitle : String, _ imageName : String)-> UIStackView{
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        sv.alignment = .fill
        sv.spacing = 10
        
        let title = getfooterInfoLabel(infoTitle)
        let image = getfooterIconImage(imageName)
        
        sv.addArrangedSubview(image)
        sv.addArrangedSubview(title)
        return sv
    }
    
    func getfooterInfoLabel(_ labelTitle: String)-> UILabel{
        let titleLabel = UILabel()
        titleLabel.text = labelTitle
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return titleLabel
    }
    
    //Create Icon Image View
    func getfooterIconImage(_ imageName : String)-> UIView{
        let bgView = self.getImageBGCircleView()
        
        let imgView = UIImageView()
        imgView.image = UIImage(named: imageName)
        
        bgView.addSubview(imgView)
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: bgView.centerYAnchor),
            imgView.widthAnchor.constraint(equalTo: bgView.widthAnchor, multiplier: 0.6),
            imgView.heightAnchor.constraint(equalTo: bgView.heightAnchor, multiplier: 0.6),
        ])
        
        return bgView
    }
    
    func getImageBGCircleView()->UIView{
        let bgView = UIView()
        bgView.backgroundColor = UIColor.white
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        bgView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        bgView.layer.cornerRadius = 30
        return bgView
    }
    
}
