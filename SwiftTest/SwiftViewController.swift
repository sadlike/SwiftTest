//
//  SwiftViewController.swift
//  SwiftTest
//
//  Created by metersbonweios on 16/9/28.
//  Copyright © 2016年 WWP. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        let  webView = UIWebView()
        let urls = NSURL(string:"https://www.baidu.com")
        let urlRequest = NSURLRequest(url:urls! as URL)
        webView.frame=CGRect(x:0,y:0,width:400,height:500)
        webView.loadRequest(urlRequest as URLRequest)
        self.view.addSubview(webView)
        
//        self .createbtn()
//        self.createLabel()
//        self.checkFile()
//        self.judgeFileExist()
//        self.createFile()
        
        //在文档目录下新建folder目录
        let managers = FileManager.default
        let urlForDocument = managers.urls(for:FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        let url = urlForDocument[0]
        createFolder(name: "folderother", baseUrl: url as NSURL)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createbtn()  {
        self.view.backgroundColor=UIColor.white
        let btn:UIButton = UIButton(type:.custom)
        btn.frame=CGRect(x:10,y:150,width:100,height:40)
        btn.setTitle("按钮", for: .normal)
        self.view .addSubview(btn)
        // let button = UIButton(frame:CGRect(x:10, y:150, width:100, height:30))
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitleColor(UIColor.green, for: .highlighted)
        btn.setTitleColor(UIColor.gray, for: .disabled)
        btn.setTitle("普通状态", for: .normal)
        btn.setTitle("触摸状态", for: .highlighted)
        btn.setTitle("禁用状态", for: .disabled)
        
        btn.setTitleShadowColor(UIColor.green, for: .normal)
        btn.setTitleShadowColor(UIColor.yellow, for: .highlighted)
        btn.setTitleShadowColor(UIColor.gray, for: .disabled)
        btn.backgroundColor = UIColor.black
        
       // btn.addTarget(self, action:#selector(taped), for: .touchUpInside)
        btn.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
       btn.setImage(UIImage(named:"brandvip"), for: .normal)
        let iconimg = UIImage(named:"brandvip")?.withRenderingMode(.alwaysOriginal)
      //btn.setImage(iconimg, for: .normal)
        btn.adjustsImageWhenHighlighted=false
        btn.adjustsImageWhenDisabled=false
        
       btn.setBackgroundImage(UIImage(named:"peoplevip"), for: .normal)
        
        
    }
    func taped(){
        print("taped")
    }
    func tapped(_ btn:UIButton){
        print(btn.title(for: .normal)!)
    }
    func createLabel() {
        let lab = UILabel(frame:CGRect(x:10,y:20,width:300,height:100))
 
        lab.text="wwpwwp.com"
        self.view.addSubview(lab)
        lab.textColor=UIColor.white
        lab.backgroundColor=UIColor.black
        lab.textAlignment = .right
        lab.shadowColor = UIColor.gray
        lab.shadowOffset = CGSize(width:1.5,height:1.5)//阴影偏移量
        lab.font=UIFont(name:"Zapfino",size:20)
        lab.lineBreakMode = .byTruncatingTail//隐藏尾部并且显示省略号
        //.bybyTruncatingMiddle 隐藏中间部分并且显示省略号
        lab.adjustsFontSizeToFitWidth = true
        lab.numberOfLines = 2
        lab.isHighlighted = true
        lab.highlightedTextColor = UIColor.green
    
        
        //富文本设置
        let attributeString = NSMutableAttributedString(string:"welcome to hangge.com")
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSFontAttributeName,
                                     value: UIFont(name: "HelveticaNeue-Bold", size: 16)!,
                                     range: NSMakeRange(0,6))
        
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name:"HelveticaNeue",size:17)!, range: NSMakeRange(0, 6))
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue,
                                     range: NSMakeRange(0, 3))
        //设置文字背景颜色
        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.red,
                                     range: NSMakeRange(3,3))
 
        lab.attributedText = attributeString
    }
    //遍历一个目录下的所有文件
    func checkFile() {
        let manager = FileManager.default;
        let urlForDocument = manager.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        let  url = urlForDocument[0] as NSURL
        //对制定路径执行浅搜索  返回指定目录路径下的文件，子目录以及符号链接的列表
        
        let contentsOfPath = try? manager.contentsOfDirectory(atPath: url.path!)
        //contentsofpath:Optional([".DS_Store", "abc", "zt.txt"])
        print("contentsofpath:\(contentsOfPath)")
        
        //类似上面
        
        let contentOfUrl = try?manager.contentsOfDirectory(at:url as URL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        //contentOfUrl:Optional([file:///Users/metersbonwe1/Library/Developer/CoreSimulator/Devices/BEF4E533-F1F5-4E45-8E2F-744DE376D2CA/data/Containers/Data/Application/450A40C9-A41B-4EFF-959A-7B9F9535075F/Documents/abc/, file:///Users/metersbonwe1/Library/Developer/CoreSimulator/Devices/BEF4E533-F1F5-4E45-8E2F-744DE376D2CA/data/Containers/Data/Application/450A40C9-A41B-4EFF-959A-7B9F9535075F/Documents/zt.txt])
        print("contentOfUrl:\(contentOfUrl)")
        //深度遍历，会递归遍历子文件夹（但不会递归符号链接）
        let enumeratorAtPath = manager.enumerator(atPath: url.path!)
//        enumeratoratpath:Optional([.DS_Store, abc, zt.txt])
        print("enumeratoratpath:\(enumeratorAtPath?.allObjects)")
        let enumeratorAtURL = manager.enumerator(at: url as URL, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles, errorHandler: nil)
        //enumeratorAtURL:Optional([file:///Users/metersbonwe1/Library/Developer/CoreSimulator/Devices/BEF4E533-F1F5-4E45-8E2F-744DE376D2CA/data/Containers/Data/Application/F0D6CA1B-C274-40CD-86DC-A368D8E5B1E7/Documents/abc/, file:///Users/metersbonwe1/Library/Developer/CoreSimulator/Devices/BEF4E533-F1F5-4E45-8E2F-744DE376D2CA/data/Containers/Data/Application/F0D6CA1B-C274-40CD-86DC-A368D8E5B1E7/Documents/zt.txt])
        print("enumeratorAtURL:\(enumeratorAtURL?.allObjects)")
        
        //深度遍历，会递归遍历子文件夹，（包括符号链接，所以要求性能的话用enumeratoratpath）
        let subPath = manager.subpaths(atPath: url.path!)
//        subPath:Optional([".DS_Store", "abc", "zt.txt"])
        print("subPath:\(subPath)")
    }
    //判断文件或者文件夹是否存在
    func judgeFileExist() {
        let fileManage = FileManager.default
        let filePath:String = NSHomeDirectory() + "/Documents/zt.txt"
        let exist = fileManage.fileExists(atPath: filePath)
        
        print("exist:\(exist)")
    }
    //创建文件夹
    
    func createFile () {
        let fileManage = FileManager.default
        let myDirectory = NSHomeDirectory() + "/Documents/myFolder/Files"
//        withIntermediateDirectories   为true表示路径汇总功能键如果有不存在的文件夹都会被创建
        try!fileManage.createDirectory(atPath: myDirectory, withIntermediateDirectories: true, attributes: nil)
    }
    
    //创建文件夹2 
    func createFolder(name:String,baseUrl:NSURL) {
        let man = FileManager.default
        let fold = baseUrl.appendingPathComponent(name,isDirectory:true)
        print("文件夹:\(fold)")
        
        let exist = man.fileExists(atPath:fold!.path)
        
        if !exist {
            try!man.createDirectory(at:fold!, withIntermediateDirectories: true, attributes: nil)
        }
    }

    // 将对象写入到文件中 包括 string，nssstirng，uiimage  nsarray  nsdictionary
    func writeFile()  {
        //string保存到文件
        let filePath:String = NSHomeDirectory() + "/Documents/wwp.txt"
        let info = "welcom to wwp.com  欢迎来到wwp.com"
        try! info.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
        let  array = NSArray(objects:"aaa","bbb","ccc")
        let filePaths = NSHomeDirectory() + "/Documents/array.plist"
        array.write(toFile: filePaths, atomically: true)
//        let dic = NSDictionary(objects:["111","222"],forkey:["aaa","bbb"])
//        let dic = Dictionary(Key : ["aaa","bbb"], Value : ["111","222"] )
//        var dic:[String:Int] = [:]
       var dics = Dictionary<String,String>()
        dics = ["111":"aaa","222":"bbb"]
        let fileP = NSHomeDirectory() + "/Documents/dictionary.plist"   
        
        
        
    }

   
    
    
 

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
