//
//  NativeOfferCollectionViewCell.swift
//  InBrainSurveys_Demo
//
//  Created by Serhii Blazhko on 03/11/2025.
//  Copyright © 2025 InBrain. All rights reserved.
//

import UIKit

import InBrainSurveys

private let cornerRadius: CGFloat = 13

protocol NativeOfferCellDelegate: AnyObject {
    func onStartPressed(at cell: NativeOfferCollectionViewCell)
}

class NativeOfferCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var rewardLabel: UILabel?
    
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var categoryLabel: EFAutoScrollLabel?
    
    @IBOutlet weak var startButtonContainerView: UIView?
    @IBOutlet weak var startButton: UIButton?
    
    weak var delegate: NativeOfferCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = false
        
        backgroundColor = .clear
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = false
        contentView.backgroundColor = .white
        contentView.setShadow(color: .black, opacity: 0.15, radius: 8)

        descriptionLabel?.textAlignment = .center
        descriptionLabel?.font = .systemFont(ofSize: 12)
        descriptionLabel?.textColor = .lightGray
        descriptionLabel?.numberOfLines = 3

        categoryLabel?.textAlignment = .center
        categoryLabel?.font = .systemFont(ofSize: 14)
        categoryLabel?.textColor = .mainColor

        startButton?.layer.cornerRadius = cornerRadius
        startButton?.layer.masksToBounds = true
        
        startButtonContainerView?.layer.cornerRadius = cornerRadius
        startButtonContainerView?.setShadow(color: .mainColor, opacity: 0.6,
                                           radius: 6, offset: .init(width: 0, height: 2))
    }
    
    @IBAction func onStartPressed(_ sender: UIButton) {
        delegate?.onStartPressed(at: self)
    }
    
    func set(offer: InBrainNativeOffer, delegate: NativeOfferCellDelegate) {
        self.delegate = delegate
        
        setupCategoryLabel(offer.categories)
        rewardLabel?.attributedText = attributedString(with: offer.rewardString)
        descriptionLabel?.text = offer.offerDescription?.joined(separator: ", ")
    }

}

private extension NativeOfferCollectionViewCell {
    func setupCategoryLabel(_ categories: [String]?) {
        guard let categories else {
            categoryLabel?.text = nil
            return
        }
        
        let text = categories.joined(separator: ", ")
        categoryLabel?.text = text
    }
    
    func attributedRewardWith(_ reward: Double, divider: Double) -> NSAttributedString {
        let rewardText = String(format: "%.0f points", reward)
        
        guard divider != 1 else { return attributedString(with: rewardText) }

        let oldRewardText = String(format: "%.0f", reward / divider)
        let fullRewardText = String(format: "\(oldRewardText) %.0f points", reward)

        let range = (fullRewardText as NSString).range(of: oldRewardText)
        if range.location != NSNotFound {
            let attrText = attributedString(with: fullRewardText)
            let mutableAttrText = NSMutableAttributedString(attributedString: attrText)
            let color: UIColor = .lightGray

            mutableAttrText.addAttributes([.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                           .strikethroughColor: color, .foregroundColor: color],
                                          range: range)
            return mutableAttrText
        }

        return attributedString(with: rewardText)
    }
    
    func attributedString(with string: String, color: UIColor = .mainColor) -> NSAttributedString {
        let font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return NSAttributedString(string: string, attributes: [.font: font, .foregroundColor: color])
    }
}
