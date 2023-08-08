//
//  TipsCollectionView.swift
//  Second app - total bill
//
//  Created by Home on 08.08.2023.
//

import UIKit

class TipsCollectionView: UICollectionView {
    
    var flowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Методы
    
    func setupView() {
        delegate = self
        dataSource = self
    }
}

    // MARK: - Расширения

extension TipsCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

extension TipsCollectionView: UICollectionViewDelegate {
    
}
