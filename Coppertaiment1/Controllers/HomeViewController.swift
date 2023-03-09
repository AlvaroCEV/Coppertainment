import UIKit

class HomeViewController: UIViewController {
    
    var recibirJuego: String?

    @IBAction func Basket(_ sender: Any) {
        performSegue(withIdentifier: "basket", sender: sender)
    }
    
    @IBAction func Profile(_ sender: Any) {
        performSegue(withIdentifier: "profile", sender: sender)
    }
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var sliderCollectionViewTendences: UICollectionView!
    
    @IBOutlet weak var tendencesCollectionView: UICollectionView!
    
    @IBOutlet weak var shootersCollectionView: UICollectionView!
    
    @IBOutlet weak var reservesCollectionView: UICollectionView!
    
    @IBAction func tendencesVM(_ sender: UIButton) {
        performSegue(withIdentifier: "VM", sender: sender)
    }
    
    
    
    var tendences: [Game] = [
        .init(id_videojuegos: "id1", nombre: "God of War: Ragnarok", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "The Legend of Zelda: Tears of the Kingdom", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Doom", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Fallout 76", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Hollow Knight", portada: "https://picsum.photos/100/200")
    ]
    var shooters: [Game] = [
        .init(id_videojuegos: "id1", nombre: "Doom Eternal", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "SuperHOT", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Halo Infinie", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Borderlands 3", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Apex Legends", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Overwartch 2", portada: "https://picsum.photos/100/200")
    ]
    var reserves: [Game] = [
        .init(id_videojuegos: "id1", nombre: "Viva Piñata", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Dark Souls Remastered", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Elden Ring", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Persona 5", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Nier Automata", portada: "https://picsum.photos/100/200"),
        .init(id_videojuegos: "id1", nombre: "Undertale", portada: "https://picsum.photos/100/200")
    ]
    
    var imgArr = [  UIImage(named:"1"),
                    UIImage(named:"2") ,
                    UIImage(named:"3") ,
                    UIImage(named:"4") ]
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
//        shootersCollectionView.dataSource = self
        registerCells()
    }
    
    private func registerCells() {
        tendencesCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        shootersCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        reservesCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @objc func changeImage() {
    
    if counter < imgArr.count {
        let index = IndexPath.init(item: counter, section: 0)
        self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        pageView.currentPage = counter
        counter += 1
    } else {
        counter = 0
        let index = IndexPath.init(item: counter, section: 0)
        self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        pageView.currentPage = counter
        counter = 1
    }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            let objDestino = segue.destination as! VideogameViewController
            objDestino.recibirJuegoFinal = recibirJuego
        }
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case tendencesCollectionView:
            return tendences.count
        case shootersCollectionView:
            return shooters.count
        case reservesCollectionView:
            return reserves.count
        case sliderCollectionView:
            return imgArr.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case tendencesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
                as! CategoryCollectionViewCell
            cell.setup(category: tendences[indexPath.row])
            return cell
        case shootersCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
                as! CategoryCollectionViewCell
            cell.setup(category: shooters[indexPath.row])
            return cell
        case reservesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
                as! CategoryCollectionViewCell
            cell.setup(category: reserves[indexPath.row])
            return cell
        case sliderCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if let vc = cell.viewWithTag(111) as? UIImageView {
                vc.image = imgArr[indexPath.row]
            }
            return cell
        default: return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
