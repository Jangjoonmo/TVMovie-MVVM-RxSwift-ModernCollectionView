//
//  BigImageCollectionViewCell.swift
//  TVMovie
//
//  Created by 장준모 on 2023/09/19.
//

import Foundation
import UIKit

final class BigImageCollectionViewCell: UICollectionViewCell {
    static let id = "BigImageCollectionViewCell"
    
    private let posterImage = UIImageView()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 3
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImage)
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(reviewLabel)
        stackView.addArrangedSubview(descLabel)
        
        posterImage.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalTo(posterImage.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.bottom.equalToSuperview().offset(-14)
        }
    }
    
    public func configure(title: String, overview: String, review: String, url: String) {
        titleLabel.text = title
        reviewLabel.text = review
        descLabel.text = overview
        posterImage.kf.setImage(with: URL(string: url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
