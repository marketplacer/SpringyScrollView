import UIKit

class ViewController: UIViewController,
  UICollectionViewDataSource {
  
  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = self
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  // MARK: -
  // ------------
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1000
  }
  
  func collectionView(collectionView: UICollectionView,
    cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
      AppConstants.collectionViewCellId, forIndexPath: indexPath) as? CollectionViewCell
      
    cell?.prepare()
      
    return cell ?? CollectionViewCell()
  }
}

