
import Foundation
import UIKit

class prueva: UIViewController {
   
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var imgArr2 = [UIImage(named: "Nier"),
                   UIImage(named: "ad-1"),
                   UIImage(named: "link"),
                   UIImage(named: "valk")]
    
    var timer = Timer()
    var counter = 0
    
    override func viewWillAppear(_ animated: Bool) {
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.numberOfPages = imgArr2.count
        pageView.currentPage = 0
        sliderCollectionView.dataSource = self

    }
    
    @objc func changeImage(){
        counter += 1
        if counter >= imgArr2.count{
            counter = 0
        }
        print(counter)
        let index = IndexPath.init(item: counter, section: 0)
        self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        pageView.currentPage = counter
    }
}

extension prueva: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView{
            vc.image = imgArr2[indexPath.row]
        }
        return cell
    }
}
