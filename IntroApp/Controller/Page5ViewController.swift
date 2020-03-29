//
//  Page1ViewController.swift
//  IntroApp
//
//  Created by 金澤武士 on 2020/03/28.
//  Copyright © 2020 tk. All rights reserved.
//

import UIKit
import SegementSlide

class Page5ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate {
    
    //XMLParserのインスタンスを作成する
    var parser = XMLParser()
    
    //RSSのパース中の現在の要素名
    var currentElementName:String!
    
    var newsItems = [NewsItems]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .clear
        //画像をtableviewの下に置く
        let image = UIImage(named: "4")
        let imagaView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height))
        
        imagaView.image = image
        self.tableView.backgroundView = imagaView
        
        //XMLパース
        let urlString = "https://news.yahoo.co.jp/pickup/rss.xml"
        let url:URL = URL(string: urlString)!
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
    }
    
    @objc var scrollView: UIScrollView{
        return tableView
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newsItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.backgroundColor = .clear
        
        let newsItems = self.newsItems[indexPath.row]
        
        cell.textLabel?.text = newsItems.title
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        cell.textLabel?.textColor = .white
        cell.textLabel?.numberOfLines = 3
        
        cell.detailTextLabel?.text = newsItems.url
        cell.detailTextLabel?.textColor = .white
        
        return cell
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElementName = nil
        if elementName  == "item"{
            self.newsItems.append(NewsItems())
            
            //[,,,]
        }else{
            currentElementName = elementName
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if self.newsItems.count > 0 {
            let lastItem = self.newsItems[self.newsItems.count - 1]
            
            switch self.currentElementName {
            case "title":
                lastItem.title = string
            case "link":
                lastItem.url = string
            case "pubDate":
            lastItem.pubDate = string
                
            default:break
            }
        }
    }
    
    //XMLファイルの終わりの処理
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        self.currentElementName = nil
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
        self.tableView.reloadData()
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //webVewcontroleerにURLを渡して表示したい
        let webViewController = WebViewController()
        webViewController.modalTransitionStyle = .crossDissolve
        let newsItem = newsItems[indexPath.row]
        UserDefaults.standard.set(newsItem.url, forKey: "url")
        
    }

}
