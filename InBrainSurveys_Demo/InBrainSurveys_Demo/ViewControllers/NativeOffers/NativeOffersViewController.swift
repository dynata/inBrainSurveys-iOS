//
//  NativeOffersViewController.swift
//  InBrainSurveys_Demo
//
//  Created by Serhii Blazhko on 03/11/2025.
//  Copyright © 2025 InBrain. All rights reserved.
//

import UIKit

import InBrainSurveys

class NativeOffersViewController: UIViewController, LoadableView {
    
    @IBOutlet weak var headerView: UIView?
    @IBOutlet weak var collectionView: UICollectionView?

    private let inBrain: InBrain = InBrain.shared
    private var offers: [InBrainNativeOffer] = [] {
        didSet { collectionView?.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Native Offers"
        
        let color = UIColor.white
        navigationController?.navigationBar.tintColor = color
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: color]
        let image = UIColor(hex: "92D050").image()
        navigationController?.navigationBar.setBackgroundImage(image,for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

        headerView?.setShadow(color: .black, opacity: 0.1, radius: 8,
                              offset: .init(width: -2, height: 6))

        //No reason to make some extension to simplify cell usage.
        //Just 1 place with cells...
        let id = "NativeOfferCollectionViewCell"
        let nib = UINib(nibName: id, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: id)
        collectionView?.alpha = 0
        
        getOffers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(
            alongsideTransition: { [weak self] _ in
                self?.collectionView?.collectionViewLayout.invalidateLayout()
            }, completion: { _ in })
    }
    
            
    func getOffers() {
        startActivity()
        
        UIView.animate(withDuration: 0.3) {
            self.collectionView?.alpha = 0
        }

        inBrain.getNativeOffers(filter: InBrainOfferFilter(type: .default),
                                success: handle(offers:), failed: handle(error:))
    }
    
    func handle(error: Error) {
        MessagePresenter.shared.show(message: error.localizedDescription, type: .error)
        stopActivity()
    }
    
    func handle(offers: [InBrainNativeOffer]) {
        self.offers = offers

        defer { stopActivity() }
        
        let newAlpha: CGFloat
        
        if offers.isEmpty {
            newAlpha = 0
            MessagePresenter.shared.show(message: "Ooops.. No offers available right now!", type: .error)
        } else {
            newAlpha = 1
        }
        
        if collectionView?.alpha == newAlpha { return }
        
        UIView.animate(withDuration: 0.3) {
            self.collectionView?.alpha = newAlpha
        }
    }

}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension NativeOffersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NativeOfferCollectionViewCell",
                                                            for: indexPath) as! NativeOfferCollectionViewCell
        
        let offer = offers[indexPath.row]
        cell.set(offer: offer, delegate: self)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension NativeOffersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let safeAreaInsets = view.safeAreaInsets.left + view.safeAreaInsets.right
        let cellWidth = (UIScreen.main.bounds.width - safeAreaInsets - 16)
        return .init(width: cellWidth, height: 181)
    }
}

extension NativeOffersViewController: NativeOfferCellDelegate {
    func onStartPressed(at cell: NativeOfferCollectionViewCell) {
        guard let ip = collectionView?.indexPath(for: cell) else { return }
        
        startActivity()
        
        // Value to track each user session. This value is provided via S2S Callbacks as SessionId.
        inBrain.setSessionID(nil)

        let offer = offers[ip.row]
        inBrain.openOfferWith(id: offer.id, success: { [weak self] in
            self?.stopActivity()
        }, failed: handle(error:))
    }
}

private extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { context in
            setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
}
