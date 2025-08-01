//
//  TitleCollectionViewCell.swift
//  iOS Momentum Solutions Task
//
//  Created by mohamed ahmed on 25/07/2025.
//

import UIKit
import SDWebImage
class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"

    private let posterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds

    }

    func configure(with model: String){
        guard let url = URL(string:"https://image.tmdb.org/t/p/w500/\(model)") else{return}
        posterImageView.sd_setImage(with: url)
    }
}
