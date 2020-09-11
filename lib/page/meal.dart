import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Product {
  int id;
  String name;
  double price;
  String img;

  //构造函数
  Product({this.id, this.name, this.price, this.img});

  //map转product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        img: json['img']);
  }
}

class ProductListItem extends StatefulWidget {
  ProductListItem({this.product});

  final Product product;

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  int _num = 0;

  void _addNum() {
    setState(() {
      _num++;
    });
  }

  void _removeNum() {
    if (_num > 0) {
      setState(() {
        _num--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Product product = widget.product;

    Widget TailButton() {
      if(_num > 0) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                _removeNum();
              },
              child: Icon(
                Icons.remove_circle_outline,
                color: Colors.blue,
              ),
            ),
            Text(' $_num '),
            GestureDetector(
              onTap: () {
                _addNum();
              },
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
              ),
            ),
          ],
        );
      }else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                _addNum();
              },
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.blue,
              ),
            ),
          ],
        );
      }
    }

    return Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ListTile(
                leading: Image.network(
                  product.img,
                  width: 100,
                ),
                // subtitle: Text(
                //   '￥ ' + product.price.toString(),
                //   style: TextStyle(color: Colors.red),
                // ),
                title: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name),
                          Text(
                            '￥ ' + product.price.toString(),
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TailButton(),
                    )
                  ],
                ),
                // trailing: Container(
                //   child: Icon(Icons.add_circle_outline, color: Colors.blue),
                // )
              ),
            ),
            Divider(height: 1.0, color: Colors.black),
          ],
        ));
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> _products = [];

  Future<void> _getProductList() async {
    List<dynamic> productList = [];
    Dio dio = new Dio();
    String url = "http://10.0.2.2:8000/product";
    Response response = await dio.get(url);
    productList = response.data;

    setState(() {
      for (Map<String, dynamic> value in productList) {
        _products.add(Product.fromJson(value));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return ProductListItem(product: _products[index]);
      },
    );
  }

}