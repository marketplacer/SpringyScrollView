import UIKit

class SpringyFlowLayout: UICollectionViewFlowLayout {
  var dynamicAnimator: UIDynamicAnimator?
  
  override func prepareLayout() {
    super.prepareLayout()
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
    return super.layoutAttributesForElementsInRect(rect)
    
//    return dinamicAnimator.itemsInrect(rect)
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
    
    return super.layoutAttributesForItemAtIndexPath(indexPath)
    //return dinamicAnimator.ayoutAttributesForCellAtIndexPath(indexPath)
  }
  
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    if let collectionView = collectionView {
      let delta =  newBounds.origin.y - collectionView.bounds.origin.y
    }
    // shift layout attribute position by delta
    // notify UIDynamic animator
    return super.shouldInvalidateLayoutForBoundsChange(newBounds)
  }
}
