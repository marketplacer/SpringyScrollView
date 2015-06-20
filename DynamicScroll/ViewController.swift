import UIKit

class ViewController: UIViewController,
  UICollectionViewDataSource {
  
  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = self
    collectionViewLayout?.setupLayout()
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  override func viewWillTransitionToSize(size: CGSize,
    withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
      
    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
      
    collectionViewLayout?.changeItemSize(size.width)
  }
  
  private var collectionViewLayout: SpringyFlowLayout? {
    return collectionView.collectionViewLayout as? SpringyFlowLayout
  }
  
  // MARK: - UICollectionViewDataSource
  // ------------
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(collectionView: UICollectionView,
    cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
      AppConstants.collectionViewCellId, forIndexPath: indexPath) as? CollectionViewCell
      
    cell?.prepare()
      
    return cell ?? CollectionViewCell()
  }
}

