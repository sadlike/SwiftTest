//
//  ViewController.swift
//  SwiftTest
//
//  Created by metersbonweios on 16/9/27.
//  Copyright © 2016年 WWP. All rights reserved.
//

import UIKit
//无参无返回值
func test1()  {
    
    print("hello,Swift!")
    print("hello,Swift!", separator: "", terminator: "")
    
}
func text2()
{
    //定义常量 敞亮必须要初始化 格式 let 常量名：类型 ＝值
    //整形
    let age:Int = 24;
    //浮点数
    let f:Double = 3.14
    //定义字符类型
    let c:Character = "x";
    //打印输出
    print(age,f,c)
    print("age---=--\(age)")
    print("f=\(f)")
    print("c=\(c)")
    //swift 具有推断功能  可以根据值来推出常量或者变量的类型
    let a = 100  //a  -> int 类型
    let 女汉子 = "女汉子吗？"
    print(a,女汉子)
    
}
func test3()  {
    var myVariable = 42 //var 声明的是变量
    myVariable=50
    myVariable = 44
    let myCount = 42     //let  声明的是常量
    
    print(myVariable,myCount)
    var a : Int
    let b : Int16 = 12
    print(b)
//    swift变量名实际上是按照unicode  变量名 常量名可以是汉子
    let 汉 = 112
    print("汉:\(汉)")
}
func test4()  {
    //给啊 一个uint32的最大值
    var a:UInt32 = UInt32.max
    //swift 变量发生一出这里会报错
//    var 不 =  UInt32.max+1
    print(a )
    
}
func test5()  {
    let a:Double = 1.24;
    let b:Int = 2;
//    var d:Double = a+b;//swift不支持隐式转换,不同类型数据 不能直接运算，要运算必须要强转。
//    var c:Double = b
//    类型() 强制类型转换
    // 变量b的值的类型 强制转换为double
    let d:Double = a+Double(b)
    print("d= \(d)")
    
}
func test6()  {
    //布尔值 只有true喝false2个值
    let b:Bool = true
    print(b)
    //可以用于if结构
    if true {
        print("if结构")
    }
    if b {
        print("if jiegous")
    }
    let c:Int = 3
    if c==3 {
        print("ifjies")
    }
    if c==5 {
        print("sdabsxxx")
    }
    if (b) {
        print("带括号")
    }
}
//元组 （40,"xiaos"）多个相同数据类型或者不同的数据类型组合在一起  这就是一个元组
func test7() {
    //元组类型 （类型1，类型2，。。。。。）
    //不需要定义直接使用
    
    //第一种形式（类型推断） 元组常来给你 stu1 －>(sting,int,double)
    let stu1 = ("xiaohong",23,98.1)
    print(stu1)
    //获取元组中的元素
    let name = stu1.0
    let age = stu1.1
    let score = stu1.2
    //索引从0开始
    print("name:\(name) age:\(age) score:\(score)")
 // 定义元素类型   按照  string  double  int  顺序进行赋值
    let stu2:(String,Double,Int) = ("xiaohong",23.2,10)
    print(stu2)
    
    //定义递单中 赋值的时候加标签
    
    let stu3 = (name:"xiaohuang",score:3.31,age:23)
    print(stu3)
    
    
    
    
    
    
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.red;
        
        test1()
        text2()
        test3()
        test4()
        test5()
        test6()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

