import 'package:flutter/material.dart';

// 产品VO类
class Product {
  final String title;
  final String description;
  Product(this.title, this.description);
}

void main()  => runApp(MaterialApp(
  home: ProductList(
    products: List.generate(20, (index) => Product('商品$index', '这是一个商品详情 $index'))
  )
));

class ProductList extends StatelessWidget {
  final List<Product> products;
  ProductList({Key key, @required this.products}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商品列表'),),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index){
            // 返回列表项
            return ListTile(
              title: Text(products[index].title),
              // 点击跳转至商品详情页，传入Product对象
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ProductDetail(
                    product: products[index]
                  )
                ));
              },
            );
          }
      )
    );
  }
}

// 商品详情页
class ProductDetail extends StatelessWidget {
  final Product product;
  // 构造方法，将传入的商品数据赋值给product
  ProductDetail({Key key, @required this.product}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${product.title}'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text('${product.description}'),
      ),
    );
  }
}