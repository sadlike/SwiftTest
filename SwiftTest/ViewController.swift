//
//  ViewController.swift
//  SwiftTest
//
//  Created by metersbonweios on 16/9/27.
//  Copyright © 2016年 WWP. All rights reserved.
//

import UIKit
protocol Vehicle {
    var numberOfWheels: Int {get}
    var color: UIColor {get set }
    mutating func changeColor()
}
struct MyCar:Vehicle {
    let numberOfWheels: Int = 4
    var color: UIColor = UIColor.blue
    mutating func changeColor() {
        color = .red
    }
    
    
}
//无参无返回值
func test1()  {
    
    print("hello,Swift!")
    print("hello,Swift!", separator: "", terminator: "")
    
}
func text2()  {
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
func test7()  {
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
    print("\(stu3.name)-------\(stu3.score)-----\(stu3.age)")
    
}
func test8()  {
    //?必须要跟紧类型 和类型之间不能有空格
    
//    var 哦1:Int ? = 100 错误的写法
    //有值
    
    let op1:Int? = 100
    //没有值
    let op2:Int? = nil
    //或者   
//    var op2:Int?
    print("op1:\(op1)")
    print("op2:\(op2)")
    
    //想要得到可选值变量中的值 需要解包（强行解析）
    
    //可选值变量 ＋  ！
    let num:Int = op1!//解包获取可选值 op1 的值
    //解包时 必须要有值 否则会崩溃
    print("num=\(num)")

}
//基本类型
func test()   {
    test1()
    text2()
    test3()
    test4()
    test5()
    test6()
    test7()
    test8()
}
//字符串

func string()  {
//    1.定义字符串常量
    var str:String = "swift"
    print(str)
    //2.获取字符串个数 元素个数
    print("字符串个数－－－－－\(str.characters.count)")
    
//    3.拼接字符串 +
    let st1 = "hello"
    let st2 = "word"
    let strP = st1+st2
    print("字符串拼接＋＋＋＋＋＋－－\(strP)")
    
    //格式化字符串 实现拼接
    
    let msg = "\(st1) love \(st2)"
    print("字符串拼接－格式化字符串－－\(msg)")
    //4.判断前缀
    
    let strsu = "www.baidu.com"
    print(strsu.hasPrefix("www.")) //输出true
    print(strsu.hasSuffix("mp3"))//输出false
    
    //5.大小写转换
    let str3 = strsu.uppercased()
    print("大小写转换---\(str3)")
    //6.转化为整数
    
    let str4 = "123"
    //toInt()函数返回的是一个可选值类型 得到值要解包
    print(Int(str4)!) //123
    
    print("111")
    
    print(Int(str4))//Optional(123)
    
    
    //7.字符串比较
    let str5 = "hello"
    let str6 = "world"
    if str5==str6 {
        print("same")
    }
    if str5>str6 {
        print("5>6")
    }
    
    if str5<str6 {
        print("5<6")
    }
    
}

func operations() {
    //+ - * / % ++ --  =  +=  -=    == > < >= <= !=    || &&
    
    //%  ++ 支持浮点数
    
    //swift  禁止连续赋值
    //
    //    || && 两遍必须是布尔值
  /*
区间运算符 整数
     (a.....b) 闭区间
     （1...3） 1,2,3
     半闭区间
     a..<b    1..<3      ->1,2  (beta 1 不需要加< 后面beta 需要加)
     
   */
// % ++ 支持浮点数
    var a:Int = 3
    let b:Int = 5;
    let c = b%4
    print("c------:\(c)")
    
    let d = 5.0
    
//    let cc:Double = d % 2.4
    
//    print(cc)
    var x:Int = 2
       x += 1
    
//    let new = x++
//    print(new)
    print(x)
    var  y:Double = 3.14
    y += 2  //swift 弃用＋＋  －－  改用＋＝和－＝
    print("y2_)  y----->\(y)")
    
    //可以用于循环 和switch
    //循环10次 i 分别是1 2 3 。。。。10
    for i in (1...10)//for 循环可以不屑（）但是｛｝必须写
    {//快速枚举 i 不需要给类型  根据后面的区间  类型推断
        print("i= = \(i)")
    }
    // 循环4次 1234
    for i  in (1..<5)
    {
        print("i-\(i )")
    }
    //如果只是为了循环10次 不需要使用变量i 那么可以不写 i 用‘_’通配符
    for _ in (1...10)
    {
        print("abc")
    }
 
}
//2.switch
func testSwitch () {

    //switch 后面的表达式 可以是任意类型
    let c = "a"
    switch c {
    case "a" ://后面可以不加break swift 中执行完case后面的语句之后就会退出  switch －case结构
        print("this is a")
    case "b":
        print("this is b")
    default://最后必须要加default
        print("this is other")
    }
    
    switch c {
    case "a","A"://还可以这么写
        print("aA")
    case "b":
        print("b")
    default:
        print("other")
    }
    //浮点数
    let f = 3.14
    switch f {
    case 1.1:
        print("1.1")
    case 3.14:
        print("3.15")
    default:
        print("other")
    }
    //广义匹配
    let num = 99
    switch num {
    case (1...50)://case 后面可以写区间
        print("1...150")
    case(51...100):
        print("51...100")
    case(101...200):
        print("101-200")
    default:
        print("other")
    }
    
    //还可以是元组
    let point = (2,100)
    switch point {
    case (0,0):
        print("0.0")
    case (1,1):
        print("1.1")
    case (2...10,2...10)://元组中可以写成区间
        print("2-10")
    case (_,100)://表示只需要匹配第二个元素，第一个元素可以是任意的值
        print("1...")
    default:
        print("other")
    }
    
    //让 case 下面的语句继续向下执行
    let n = 1
    switch n {
    case 0:
        print("fallThough 0")
        fallthrough //表示继续向下执行  （遇到fallthrough 会继续执行下面的代码，而不悔退出 switch－case）
    case 1:
        print("111")
        fallthrough
    case 2:
        print("23")
        fallthrough
    case 3:
        print("343333")
        fallthrough
    default:
        print("ssvvvvv")
    }
}
//循环
func testFor(){

    //i++  i 和++中间不能有空格
    //普通的for
    var sum = 0

    for i in 0...10 {
        sum += i
        print("sum----\(sum)")
    }
    sum = 0
    
    var numberlist = 0...10
    for i in numberlist
    {
        sum += i
        print("numberlist----\(sum)")
    }
    
    
//    for var i = 1; i <= 10; i+=1{
//        sum += i
//    }
//    print("sum===\(sum)")
    
//    for i in 0..<numberlist.count {     rs +=" "\(i)"" }<="" pre=""><p>这次我们换成了 0..<numberlist.count， 这种形式会排除闭区间最后那个数组，然后我们就可以在循环中用索引进行访问啦（注意符号="" ..<="" 两边不要有空格）。<="" p=""></numberlist.count，></p><p><strong>结尾</strong></p><p>好了，今天跟大家分享的内容就这么多。C 风格的循环语句其实更多是我们的一个长期养成的习惯问题。 世界的一切都在进步发展，包括开发语言也是一样。 看了 Swift 提供的循环语法， 你对 C 风格循环还有没有存在的必要时什么看法呢。 早些拥抱趋势和变化总是好的。</p>
//    </numberlist.count {>
}

func operationsTest2(){

}
//单独的加几 固定
func addOne(num:Int) ->Int{
    return num+1
    
}
//通用加函数  不固定
func addTo(adder: Int)->(Int)->Int{
    
    return {
        num in
        return num + adder
    }
}
class ViewController: UIViewController {

        @IBOutlet var webView :UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white;
        webView.loadRequest(NSURLRequest(url:NSURL(string:"http://baidu.com") as! URL) as URLRequest)

//        test()s
//        string()
        
//        operations()
//        operationsTest2()
//        testSwitch()
        testFor()
//        let addTwo = addOne(num: 2)
//        print(addTwo)
        
        //先走了加9 在 在加9到基础上啊执行
//        let  adds  = addTo(9)
//        let result = adds(12)
//        print(result)
        //
//        let grenter11 = grenterThan(11)
//        
//        let one =   grenter11(12)
//        let two =    grenter11(1)
//        print(one,two)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

