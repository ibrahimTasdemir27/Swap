//
//  AdvertPreviewViewController.swift
//  Swap
//
//  Created by İbrahim Taşdemir on 21.07.2024.
//

import UIKit


final class AdvertPreviewViewController: BaseViewController {
    
    var viewModel: AdvertPreviewViewModel!
    
    override func provideViewModel() -> BaseViewModel? {
        return viewModel
    }
    
    
    //MARK: -> UI Components
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var advertHeading: UILabel!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var sellerOpenedAccountDate: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareViews()
    }
    
    private func prepareViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        AdvertPreviewImageCollectionViewCell.registerSelf(collectionView: collectionView)
        advertHeading.text = viewModel.product.heading
        sellerName.text = viewModel.product.seller.name
        sellerOpenedAccountDate.text = viewModel.product.seller.registerDate
        categoryLabel.text = viewModel.product.categoryStrings
        adressLabel.text = viewModel.product.adress.describe()
    }
    
    // MARK: - IBActions
    
    
    //MARK: -> Private
    private func setProductView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addArrangedSubview(view)
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor)
        ])
    }
}



// MARK: - ViewModel Delegate -

extension AdvertPreviewViewController: AdvertPreviewViewModel.Delegate {
    func setCarPreviewProduct(_ product: CarProduct) {
        let view = CarPreview(preview: product)
        setProductView(view)
    }
    
    func setHousePreview(_ product: EstateProduct) {
        let view = HousePreview(preview: product)
        setProductView(view)
    }
    
    func setSiteHousePreview(_ product: SiteHouseProduct) {
        let view = SiteHousePreview(preview: product)
        setProductView(view)
    }
    
    func setLandPreview(_ product: LandProduct) {
        let view = LandPreview(preview: product)
        setProductView(view)
    }
    
    
}


//MARK: -> UICollectionView Delegate & DataSource
extension AdvertPreviewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image = viewModel.images[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertPreviewImageCollectionViewCell.className, for: indexPath) as! AdvertPreviewImageCollectionViewCell
        cell.bind(image: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}



// MARK: - Creator -
extension AdvertPreviewViewController: XibNameProvider {
    static var xibName: String {
        get {
            return "AdvertPreviewViewController"
        }
    }
    
    class func create(for product: Product, with images: [UIImage]) -> AdvertPreviewViewController {
        let vc: AdvertPreviewViewController = AdvertPreviewViewController.instantiateFromNib()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        let viewModel: AdvertPreviewViewModel = AdvertPreviewViewModel(product: product, images: images)
        vc.viewModel = viewModel
        viewModel.delegate = vc
        return vc
    }
}



/*
 Şimdi buraya araba ilanı gelebilir ?
 Emlak ilanı gelebilir ?
 Elektronik ilanı gelebilir ?
 Eşya ilanı gelebilir ?
 
 
 Hangisi gelicekse tip olarak belirtilsin
 Araba geliyorsa,
 araba preview,
 emlak preview,
 electronic preview,
 eşya preview
 
 Şimdik advert preview'e
 
 
 
 */
