import UIKit

class HomeViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    var seleccion = -1
    
    
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
    
    @IBOutlet var HomeTableView: UITableView!
    

    var imgArr = [  UIImage(named:"1"),
                    UIImage(named:"2") ,
                    UIImage(named:"3") ,
                    UIImage(named:"4") ]
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeTableView.dataSource = self
        HomeTableView.delegate = self
        loadGames()
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
//        shootersCollectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VG" {
            let videojuegoVista = segue.destination as! VideogameViewController
            videojuegoVista.recibirJuegoFinal = games[seleccion]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        seleccion = indexPath.row
        performSegue(withIdentifier: "VG", sender: nil)
        
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
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
            let imageData = Data(base64Encoded: imageBase64String)
            let image = UIImage(data: imageData!)
            return image!
    }
    
    var games:[Game] = []
    
    let url = URL(string: "")
    func loadGames(){
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
                    guard let data = data,
                          let response = response as? HTTPURLResponse,
                          response.statusCode == 200, error == nil else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                self.games.removeAll()
                for element in json as! [[String : Any]] {
                    self.games.append(Game(json: element))
                }
                DispatchQueue.main.async{
                    self.HomeTableView.reloadData()
                }
            } catch let errorJson {
                print(errorJson)
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeRow: HomeRow = tableView.dequeueReusableCell(withIdentifier: "homeRowID", for: indexPath) as! HomeRow
        let gamess = games[indexPath.row]
  
        homeRow.portada.image = convertBase64StringToImage(imageBase64String: gamess.portada)
        homeRow.nombre.text = gamess.nombre
        
        return homeRow
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            if let vc = cell.viewWithTag(111) as? UIImageView {
                vc.image = imgArr[indexPath.row]
            }
            return cell
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
