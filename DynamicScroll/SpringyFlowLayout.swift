import UIKit

class SpringyFlowLayout: UICollectionViewFlowLayout {
  var dynamicAnimator: UIDynamicAnimator?
  
  override func prepareLayout() {
    super.prepareLayout()
    
    if dynamicAnimator != nil {
      return
    }

    dynamicAnimator = UIDynamicAnimator(collectionViewLayout: self)
    
    let contentSize = collectionViewContentSize()
    
    let items = layoutAttributesForElementsInRect(
      CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height))
      as? [UICollectionViewLayoutAttributes]
    
    if let items = items {
      for item in items {
        let spring = UIAttachmentBehavior(item: item, attachedToAnchor: item.center)
        spring.length = 0
        spring.damping = 0.5
        spring.frequency = 0.8
        dynamicAnimator?.addBehavior(spring)
      }
    }
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
    return dynamicAnimator?.itemsInRect(rect) ?? []
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
    
    return dynamicAnimator?.layoutAttributesForCellAtIndexPath(indexPath) ??
      super.layoutAttributesForItemAtIndexPath(indexPath)
  }
  
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    if let collectionView = collectionView,
      dynamicAnimator = dynamicAnimator {
      let delta =  newBounds.origin.y - collectionView.bounds.origin.y
        
      for spring in dynamicAnimator.behaviors {
        if let spring = spring as? UIAttachmentBehavior,
          item = spring.items.first as? UICollectionViewLayoutAttributes {
          
          var center = item.center
          center.y += delta
          item.center = center
            
          dynamicAnimator.updateItemUsingCurrentState(item)
        }
      }
    }

    return false
  }
}
