//
//  ViewController.swift
//  ProductsNestingUsingDecoder
//
//  Created by Mac on 15/10/22.
//

import UIKit
import SDWebImage
class ViewController: UIViewController, UITableViewDataSource {
    
    

    @IBOutlet weak var productTableView: UITableView!
    
    var products = [Product]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         productTableView.delegate = self
         productTableView.dataSource = self
        
        downloadJson {
            self.productTableView.reloadData()
        }
        
    }
    func downloadJson(completed:@escaping()->())
    {
        let urlString = "https://fakestoreapi.com/products"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!)
        { data,response,error in
            if(error == nil)
            {
                do
                {
                 let jsonDecoder = JSONDecoder()
                    self.products = try jsonDecoder.decode([Product].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch
                {
                    print("error")
                }
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.productTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductsTableViewCell
        
        cell.productIdLabel.text = String(products[indexPath.row].id)
        cell.productTitleLabel.text = products[indexPath.row].title
        cell.productPriceLabel.text = String(products[indexPath.row].price)
        cell.productDescriptionLabel.text = products[indexPath.row].description
        cell.productCategoryLabel.text = products[indexPath.row].category
        cell.productImageView.sd_setImage(with: products[indexPath.row].image)
        
        cell.productRateLabel.text = String(products[indexPath.row].rate)
        cell.productCountLabel.text = String(products[indexPath.row].count)
        
        return cell
    }
}
extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        800
    }
}

