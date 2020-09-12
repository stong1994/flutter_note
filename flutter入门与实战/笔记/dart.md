# 重要概念

- 所有的东西都是对象，无论是变量、数字、函数等都是对象。所有的对象都是类的实例。所有的对象都继承自内置的Object类。这点类似于Java语言“一切皆为对象”
- 在程序中指定数据类型使得程序能够合理地分配内存空间，并帮助编译器进行语法检查。但是，指定类型不是必需的。Dart语言是弱数据类型。
- Dart代码在运行前解析。指定数据类型和编译时的常量，可以提高运行速度。
- Dart程序有统一的程序入口：main()，这一点与Java、C/C++语言相似
- Dart没有public、protected和private的概念。私有特性通过变量或函数加上下划线来表示。
- Dart支持anync/await异步处理
- 关键字（56个）如下：abstract，do，import，super，as，dynamic，in，switch，assert，else，interface，sync*，enum，implements，is，this，async*，export，library，throw，await，external，mixin，true，break，extends，new，try，case，factory，null，typedef，catch，false，operator，var，class，final，part，void，const，finally，rethrow，while，continue，for，return，with，covariant，get，set，yield*，default，if，static，deferred。



# 基本类型

- var 可以定义变量，如 `var tag = "666"` ，这和 JS 、 Kotlin 等语言类似，同时 Dart 也算半个动态类型语言，同时支持闭包。

- `Dart` 属于是**强类型语言** ，但可以用 `var` 来声明变量，`Dart` 会**自推导出数据类型**，所以 `var` 实际上是编译期的“语法糖”。**`dynamic` 表示动态类型**， 被编译后，实际是一个 `object` 类型，在编译期间不进行任何的类型检查，而是在运行期进行类型检查。

- 一切皆为对象，如果一个int类型的变量没有被赋值，那么这个变量与null相等。

- Dart的常量定义有两种方式：const与final。final只能被设置一次，而const在编译后就会固定为一个值。

- 可以通过const来创建常量：const[]本身是构造函数

  ```
  final start = const [];
  const end = const [];
  ```

  

- Dart 中 number 类型分为 `int` 和 `double` ，其中 java 中的 long 对应的也是 Dart 中的 int 类型，Dart 中没有 float 类型。

- Dart 下只有 bool 型可以用于 if 等判断，不同于 JS 这种使用方式是不合法的 `var g = "null"; if(g){}` 。

- Dart 中，switch 支持 String 类型。

# 5个基本数据类型：

- Number：
  - int：-2^53 ~ 2^53
  - double: 双精度浮点型，64位长度
- String：
  - 单双引号都可以
  - 三个单引号或者三个双引号可以定义多行的文本块
- Bool：
  - 必须是True才能判断为True
- List：
  - 一组具有相同数据类型的集合
- Map：
  - key-value的集合

# 变量

- Dart 不需要给变量设置 `setter getter` 方法， 这和 kotlin 等语言类似。Dart 中所有的基础类型、类等都继承 Object ，默认值是 NULL， 自带 getter 和 setter ，而如果是 final 或者 const 的话，那么它只有一个 getter 方法。
- Dart 中 final 和 const 表示常量，比如 `final name = 'GSY'; const value= 1000000;` 同时 `static const` 组合代表了静态常量，其中 const 的值在编译期确定，final 的值要到运行时才确定。
- Dart 下的数值，在作为字符串使用时，是需要显式指定的。比如：`int i = 0; print("aaaa" + i);` 这样并不支持，需要 `print("aaaa" + i.toString());` 这样使用，这和 Java 与 JS 存在差异，**所以在使用动态类型时，需要注意不要把 number 类型当做 String 使用。**
- Dart 中数组等于列表，所以 `var list = [];` 和 `List list = new List()` 可以简单看做一样。

# 方法

- Dart 下 `??` 、`??=` 属于操作符，如: `AA ?? "999"` 表示如果 AA 为空，返回999；`AA ??= "999"` 表示如果 AA 为空，给 AA 设置成 999。
- Dart 方法可以设置 *参数默认值* 和 *指定名称* 。比如： `getDetail(Sting userName, reposName, {branch = "master"}){}` 方法，这里 branch 不设置的话，默认是 “master” 。*参数类型* 可以指定或者不指定。调用效果： `getRepositoryDetailDao(“aaa", "bbbb", branch: "dev");`
- Dart 不像 Java ，没有关键词 public 、private 等修饰符，`_`下横向直接代表 private ，但是有 `@protected` 注解。
- Dart 中多构造函数，可以通过如下代码实现的。默认构造方法只能有一个，而通过`Model.empty()` 方法可以创建一个空参数的类，其实方法名称随你喜欢，而变量初始化值时，只需要通过 `this.name` 在构造方法中指定即可：

```dart
class ModelA {
  String name;
  String tag;

  //默认构造方法，赋值给name和tag
  ModelA(this.name, this.tag);

  //返回一个空的ModelA
  ModelA.empty();

  //返回一个设置了name的ModelA
  ModelA.forName(this.name);
}
```

# 函数

```dart
bool equsl(String a, String b) {
	return a == b
}
```

返回值类型 + 函数名 + 参数

## 可选参数

参数用中括号括起来。如 `(String a, [String b])`中的b即为可选

## 参数默认值

有参数默认值，那么这个参数一定是可选的。`[Stringb = 'hello']`

## main

程序入口，`void main() => runApp(MyApp());`

## 返回值

所有函数都有返回值，如果没定义，则隐式添加return

# 运算符

![image-20200821083151121](dart.assets\image-20200821083151121.png)

整除是~/ (键盘上1左边的键，而不是横杠)

## 类型测试

- as：类型转换
- is：类型判断
- is!: 类型判断

```
if (user is User){
	user.name = 'F';
}
(user as User).name = 'F';
```

## 赋值

`= += -= `赋值，对null值可以使用`??=`赋值，即如果为null，就赋值

 ## 表达式

三元表达式

`condition ? expr1 : expr2`

非空表达式

`expr1 ?? expr2` expr1非空，计算并返回expr1，否则就返回expr2

## 级联操作

用两个点（..）可对对象做一系列操作，类似于JS中的then

```dart
selectObj('#btn') # 获取一个ID为btn的元素
 ..text = ('ok')
 ..classes.add('Button')
 ..onClick.listen((e)=>windows.alert('ok'));
```

# 流程控制

- if 、else if、else
- for：`for(var i = 0; i< 10; i++){} `、` for (var v in arr){}`
- while、do-while
- break、continue
- switch-case: 可以比较整数、字符串或其他编译中的常量。每个非空的case都需要在最后加上break
- assert：当判断条件为False时中断，并抛出AssertionError异常：`assert(text != null);`
- try-catch、throw

```dart
try {
	// 
} on Exception catch (e) {
	print('Exception details :\n $e');
} catch (e, s) {
	print('Exception details:\n $e');
	print('Stack trace:\n $s');
} finally {
    print('Do some thing\n');
}
```

第一个catch用来捕获异常详细信息，第二个catch用来跟踪堆栈信息。

# 面向对象

支持基于mixin的继承方式，即一个类可以继承多个类。

所有的属性都会隐式的定义getter与setter方法。

## 常规构造函数

```dart
class User {
	String name;
	int age;
	
	User(String name, int age){
		this.name = name;
		this.age = age;
	}
}
```

简写：

```dart
class User {
	String name;
	int age;
	
	User(this.name, this.age);
}
```

## 命名的构造函数

```dart
class User {
	String name;
	int age;
	
	User(this.name, this.age);
	
	User.fromJson(Map json) {
		name = json['name'];
		age = json['age'];
	}
}
```

## 构造函数初始化列表

```dart
class User {
	final String name;
	final int age;
	
	User(name, age)
		: name = name,
		  age = age;
}
```

## 读取和写入对象

get 和set方法是专门用来读取和写入对象的方法。

隐式自动添加

## 重载

opeartor和运算符可视为一个函数名。

```dart
// 重载加号
class Vector {
	final int x;
	const Vector(this.x, this.y);
	
	Vector operator +(Vector v) {
		return Vector(x + v.x)
	}
}

main() {
	final v = Vector(2);
	final w = Vector(3);
	final r = v + w
}
```

## 继承

使用关键字extends来继承父类，使用super来调用父类

## 抽象类

使用abstract

```dart
abstract class Operator {
	void insert();
}

class DBOperatorImpl extends Operator {
	void insert() {
		print('xxx')
	}
}
```

## 枚举

```dart
enum Color {
	red,
	green,
	blue
}
```

获取所有枚举值，用values

```dart
List<Color> colors = Color.values;
```

## Mixins

相当于多继承，使用with来实现

```
class A {
	a() {print("a")}
}
class B {
	b() {print("b")}
}
class C = A with B;
```

# 泛型

泛型通常是为了类型安全而设计的，使用泛型会减少代码重复。

Dart中使用尖括号来标识 <T>:

```dart
var names = List<String>();
names.addAll(['张三', '李四']);
```

## 用于集合类型

```dart
List: <type>
Map: <keyType, valueType>
```

```dart
var weeks = <String, String> {
	'Monday': '星期一',
	'Tuesday': '星期二',
};
```

## 在构造函数中参数化

```dart
var users = Map<String, User>();
```

# 库

## 引用

- 在import语句后面需要接上库文件的路径
- 对Dart语言提供的库文件使用dart:xx格式
- 第三方的库文件使用package:xx格式

```dart
import 'dart:io';
import 'package:mylib/mylib.dart';
import 'package:utils/utils.dart'
```

## 指定前缀

```dart
import 'package:mylib/mylib.dart' as mylib2;
```

## 引用库的一部分

- `show`：只引用一部分
- `hide`：除此之外都引用

```
import 'package:mylib/mylib.dart' show foo;
import 'package:utils/utils.dart hide foo'
```

# 异步

使用`async`与`await`实现

Dart库提供`asynchronous`功能，该功能提供接口及进行耗费时间的操作。该功能返回`Future`或`Stream`对象。

- 返回`Future`对象的值
  - 使用`async`函数和`await`表达式
  - 使用`Future`功能提供 的api
- 返回`Stream`对象的值
  - 使用`async`和一个异步的循环（await for)
  - 使用`Stream`的相关api

必须在一个使用了`async`关键字标记后的函数中使用`await`表达式

```
fileOperate() async {
	var file = await readFile();
	// xxx
}
```

# 元数据

元数据可以给代码添加更多信息。元数据是以@开始的修饰符，在@后面为编译时的常量或调用一个常量构造函数。目前有三个：

- @deprecated：被弃用的
- @override：重写
- @proxy：代理

元数据可以修饰library（库）、class（类）、typedef（类型定义）、type parameter（类型参数）、constructor（构造函数）、factory（工厂函数）、function（函数）、field（作用域）、parameter（参数）、variable declaration（变量声明）

# 注释

- 单行注释： `//`
- 多行注释 ：`/* */`
- 文档注释：以`/** `或者`///`开始，以`*/`结束