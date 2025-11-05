//
//  NativeSurveysViewController.swift
//  InBrainSurveys_Demo
//
//  Created by Sergey Blazhko on 02.10.2020.
//  Copyright © 2020 InBrain. All rights reserved.
//

import UIKit

import InBrainSurveys

class NativeSurveysViewController: UIViewController, LoadableView {
    
    @IBOutlet weak var headerView: UIView?
    @IBOutlet weak var collectionView: UICollectionView?

    private let inBrain: InBrain = InBrain.shared
    private var surveys: [InBrainNativeSurvey] = [] {
        didSet { collectionView?.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Native Surveys"
        
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
        let id = "NativeSurveyCollectionViewCell"
        let nib = UINib(nibName: id, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: id)
        collectionView?.alpha = 0
        
        inBrain.nativeSurveysDelegate = self
    
        inBrain.getNativeSurveys(filter: nil)
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
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension NativeSurveysViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return surveys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NativeSurveyCollectionViewCell",
                                                            for: indexPath) as! NativeSurveyCollectionViewCell
        
        let survey = surveys[indexPath.row]
        cell.set(survey: survey, delegate: self)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension NativeSurveysViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let safeAreaInsets = view.safeAreaInsets.left + view.safeAreaInsets.right
        let cellWidth = (UIScreen.main.bounds.width - safeAreaInsets - 36) / 2
        return .init(width: cellWidth, height: 149)
    }
}

//MARK: - NativeSurveyDelegate
extension NativeSurveysViewController: NativeSurveyDelegate {
    func nativeSurveysLoadingStarted(filter: InBrainSurveyFilter?) {
        startActivity()
        surveys.removeAll()
        
        UIView.animate(withDuration: 0.3) {
            self.collectionView?.alpha = 0
        }
    }
        
    func nativeSurveysReceived(_ surveys: [InBrainNativeSurvey], filter: InBrainSurveyFilter?) {
        self.surveys = surveys

        defer { stopActivity() }
        
        let newAlpha: CGFloat
        
        if surveys.isEmpty {
            newAlpha = 0
            MessagePresenter.shared.show(message: "Ooops.. No surveys available right now!", type: .error)
        } else {
            newAlpha = 1
        }
        
        if collectionView?.alpha == newAlpha { return }
        
        UIView.animate(withDuration: 0.3) {
            self.collectionView?.alpha = newAlpha
        }
    }
    
    func failedToReceiveNativeSurveys(error: Error, filter: InBrainSurveyFilter?) {
        MessagePresenter.shared.show(message: error.localizedDescription, type: .error)
        print("Failded to receive native surveys: \(error.localizedDescription)")
        
        stopActivity()
    }
}

extension NativeSurveysViewController: NativeSurveyCellDelegate {
    func onStartPressed(at cell: NativeSurveyCollectionViewCell) {
        guard let ip = collectionView?.indexPath(for: cell) else { return }
        
        // Value to track each user session. This value is provided via S2S Callbacks as SessionId.
        inBrain.setSessionID("TestSessionID")
        
        let survey = surveys[ip.row]
        inBrain.openSurvey(survey, offersEnabled: false, from: self)
        
        /*
            Another option to show selected survey - is to use method
            inBrain.openSurvey(id:searchId:offersEnabled:from:)
         
            Both options are valid and works the same `underhood`. Pls, use option you prefer
        */
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
