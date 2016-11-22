//
//  testScrollView.swift
//  SwiftTest
//
//  Created by metersbonweios on 2016/11/21.
//  Copyright © 2016年 WWP. All rights reserved.
//

import UIKit
import Kingfisher
//左右中
enum pageControlAlignment:Int {
    case center,right,left
}
//delegate
protocol testScrollViewDelegate:NSObjectProtocol {
    func didClickImgIndex(index: Int)
}
class testScrollView: UIView {
    //代理对象
    weak var delegate: testScrollViewDelegate?
    //默认背景图
    var placeHoldImg:UIImage?
    var pageAligement :pageControlAlignment = .center
    //宽 这个元素的访问权限为文件内私有
    fileprivate var kWidth : CGFloat = 0
    fileprivate var kHeight : CGFloat = 0
    //时间间隔 滚动
    var timesecond:TimeInterval = 3;
    //定时器
    fileprivate var timer: Timer?
    //pagecontroll  
    //lazy  懒加载
    fileprivate lazy var pages: UIPageControl = {
        let page = UIPageControl()
        page.hidesForSinglePage = true
        return page
    }()
    fileprivate lazy var scrollView: UIScrollView = {
        let view: UIScrollView = UIScrollView(frame: self.bounds)
//        view.delegate = self
//        view.delegate = self()
        
        view.autoresizesSubviews = true
        view.isPagingEnabled = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()

    var pageColor:UIColor=UIColor.gray{
    //监视属性的除初始化之外的属性值变化
        didSet{
        pages.pageIndicatorTintColor = pageColor
        }
    }
    var currentPageColor:UIColor = UIColor.white {
        didSet{
        pages.currentPageIndicatorTintColor = currentPageColor
        }
    }
    //图片数组
    var imageArray:[String]? {
        didSet{
          pages.numberOfPages = imageArray?.count ?? 0
        }
    }
    fileprivate var rollImageView: UIImageView? {
        didSet {
        rollImageView?.isUserInteractionEnabled = true
            let tap  = UITapGestureRecognizer(target: self, action: #selector(tapBanner))
            rollImageView?.addGestureRecognizer(tap)
        }
    }
    /// 点击轮播图执行的方法
    @objc private func tapBanner() {
        
        self.delegate?.didClickImgIndex(index: (pages.currentPage + 1))
    }
    
    //重写
    override init(frame: CGRect) {
        super.init(frame: frame)
        kWidth = self.bounds.size.width
        kHeight = self.bounds.size.height
        addSubview(scrollView)
        addSubview(pages)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
