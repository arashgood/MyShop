//
//  ViewController.swift
//  MyShop
//
//  Created by Arash on 3/12/1396 AP.
//  Copyright © 1396 arashgood. All rights reserved.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var middleCollectionView: UICollectionView!
    @IBOutlet weak var bottomCollectionView: UICollectionView!
    
    @IBOutlet weak var basket_counter_number: UILabel!
    @IBOutlet weak var basket_counter_background: BasketCounterView!
    
    
    var topProducts = [Product]()
    var otherProducts = [Product]()
    var banners = [Product]()
    
    var refreshCntrl = UIRefreshControl()
    
    var pageNumber = 0
    var is_products_appended = false
    
    //view funcs *******************************************************************
    override func viewWillAppear(_ animated: Bool) {
        //fake reterive from fake webservice
        
        retreiveProducts()
        relaodCollections()
        refreshCounters(number: self.basket_counter_number, background: self.basket_counter_background)
        //Basket.instance.refreshBC(number: self.basket_counter_number, background: self.basket_counter_background)
        NotificationCenter.default.addObserver(self, selector: #selector(showSuccesAlert), name: .showSuccessAlert, object: nil)
    }
    
    //**
    override func viewDidLoad() {
        super.viewDidLoad()
        
        set_delegates_and_dataSources()
        refreshCounters(number: self.basket_counter_number, background: self.basket_counter_background)
        
        for i in testbanners {
            banners.append(i)
        }
        for i in testProducts {
            topProducts.append(i)
        }
        
        // ********* animate Slider **********
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }
    
    //**
    override func viewDidLayoutSubviews() {
        
        //set slider ScrollView
        setSlider()
        
        //page Controller
        configurePageControl()
        pageController.addTarget(self, action: #selector(self.changePage(sender:)), for: .valueChanged)
        
    }
    
    // Actions ******************************************************************************
    @IBAction func go_to_basket_page(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    @IBAction func go_to_search_page(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    
    //collectionView funcs ***************************************************************************
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            
            return topProducts.count
        } else {
            return topProducts.count
        }
    }
    
    //**
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return makeCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    //**
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showProduct(index: indexPath.row)
    }

    //**
    func showProduct(index: Int) {
        let sp = self.storyboard?.instantiateViewController(withIdentifier: "ShowProductVC") as! ShowProductVC
        sp.product = topProducts[index]
        self.present(sp, animated: true, completion: nil)
    }
    //**
    func makeCell(collectionView: UICollectionView,indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            
            //middle Collection View
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "middleCell", for: indexPath) as? MiddleCell {
                
                let c = makeMiddleCell(cell: cell, product: topProducts[indexPath.row])
                return c
            } else {
                return UICollectionViewCell()
            }
            
            // bottom Collection view
        } else  {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as? BottomCell {
                
                let c = makeBottomCell(cell: cell, product: topProducts[indexPath.row])
                return c
            } else {
                return UICollectionViewCell()
            }
            
        }
        
    }
    
    // funcs *************************************************************************************
    
    func configurePageControl() {
       
        // The total number of pages that are available is based on how many available colors we have.
        self.pageController.numberOfPages = self.banners.count
        self.pageController.currentPage = 0
        self.pageController.tintColor = UIColor.red
        self.pageController.pageIndicatorTintColor = UIColor.white
        self.pageController.currentPageIndicatorTintColor = UIColor.green
        
        self.view.addSubview(pageController)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(self.pageController.currentPage) * (scrollView.frame.size.width)
        self.scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    // ********* scrollView funcs ************
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView == self.scrollView {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            self.pageNumber = Int(pageNumber)
            self.pageController.currentPage = Int(pageNumber)
        }
        
    }
    
    
    
    //**
    func scrollAutomatically() {
        
        if pageNumber < self.banners.count {
    
            pageController.currentPage = pageNumber
            let n = CGFloat(pageNumber) * (scrollView.frame.size.width)
            
            scrollView.setContentOffset(CGPoint(x: n, y: 0), animated: true)
        
            pageNumber += 1
            
        } else {
            pageNumber = 0
        }
        
    }
    
    //**
    func makeMiddleCell(cell: MiddleCell,product: Product) -> UICollectionViewCell {
    
        let strUrl = String(product.imgStrUrl)!
        let title = String(product.title)!
        let price = (product.price)
        cell.configureCell(imageStrUrl: strUrl, title: title, price: price,availalbleNumbers: product.availableNumber)
        return cell
    }
    
    //**
    func makeBottomCell(cell: BottomCell,product: Product) -> UICollectionViewCell {
        
        if let strUrl = String(product.imgStrUrl) {
            if let title = String(product.title) {
                
                    cell.configureCell(imageStrUrl: strUrl, title: title)
                    return cell
            } else {
                return UICollectionViewCell()
            }
        } else {
            return UICollectionViewCell()
        }
        //end of makeMiddle cell
    }
    
    //**
    func set_delegates_and_dataSources() {
        
        self.scrollView.delegate = self
        self.middleCollectionView.delegate = self
        self.middleCollectionView.dataSource = self
        self.bottomCollectionView.delegate = self
        self.bottomCollectionView.dataSource = self
        
    }
    
    //**
    func setSlider() {
        
        let numberOfImages = CGFloat(self.banners.count)
        let scrollViewWidth = self.scrollView.frame.width
        let scrollViewHeight = self.scrollView.frame.height
        let width = scrollViewWidth * numberOfImages
        
        
        self.scrollView.contentSize = CGSize(width: width, height: scrollViewHeight)
        
        for i in 0  ..< self.banners.count {
            let imgView = UIImageView(frame: CGRect(x: CGFloat(i) * scrollViewWidth, y: 0, width: scrollViewWidth, height: scrollViewHeight))
            
            let url = URL(string: banners[i].imgStrUrl)
            imgView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "prelo.gif"))
            
            scrollView.addSubview(imgView)
        }
    }
    
    //**
    func retreiveProducts() {
        if !is_products_appended {
            for i in testBasket {
                Basket.instance.addProduct(product: i)
            }
            for i in testLikedProducts {
                LikedProducts.instance.likeProduct(product: i)
            }
            
            is_products_appended = true
        }
    }
    
    //**
    func relaodCollections() {
        middleCollectionView.reloadData()
        bottomCollectionView.reloadData()
    }

    //***
    func showSuccesAlert() {
        let alert = UIAlertController(title: nil, message: "خرید با موفقیت انجام شد", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "تایید", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

  //end of class
}

