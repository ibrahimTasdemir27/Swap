//
//  ProductListViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 28.08.2024.
//

import UIKit

final class ProductListViewController: BaseViewController {
    
    var viewModel: ProductListViewModel!
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    //MARK: -> UI Components
    @IBOutlet weak var collectionView: UICollectionView!
    
    var didFinishPickProduct: ((Product) -> Void)? = nil
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.registerCell(cellClass: ProductListCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(LayoutManager().makeLayout(), animated: false)
    }
    
    // MARK: - IBActions
    
    
    
}



// MARK: - ViewModel Delegate -
extension ProductListViewController: ProductListViewModel.Delegate {
    
}


//MARK: -> UICollectionView Delegate & DataSource
extension ProductListViewController: UICollectionViewDelegate & UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModel.products[indexPath.row]
        let cell = collectionView.dequeueCell(cellClass: ProductListCollectionViewCell.self, for: indexPath)
        cell.bind(model)
        return cell
    }
}




// MARK: - Creator -
extension ProductListViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "ProductListViewController"
        }
    }
    
    class func create() -> ProductListViewController {
        let vc: ProductListViewController = ProductListViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        let viewModel: ProductListViewModel = ProductListViewModel()
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}

