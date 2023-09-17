//
//  ViewController.swift
//  TVMovie
//
//  Created by 장준모 on 2023/09/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let buttonView = ButtonView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    private func setUI() {
        self.view.addSubview(buttonView)
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .blue
        
        buttonView.snp.makeConstraints{
            $0.top.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(80)
        }
        
        collectionView.snp.makeConstraints{
            $0.horizontalEdges.bottom.equalToSuperview()
            $0.top.equalTo(buttonView.snp.bottom)
        }
    }
    
}

