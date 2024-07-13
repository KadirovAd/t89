import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> products = List.generate(
    7,
    (index) => Product(
      name: 'Logitech G Pro X Superlight Wireless Gaming Mouse',
      profit: 3324.25,
      stock: 3324,
      image: 'assets/images/mouse.png',
    ),
  );

  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SvgPicture.asset(
            'assets/icons/bag.svg',
          ),
        ),
        title: const Text(
          'ACHIEVEMENTS',
          style: TextStyle(
            color: Color(0xFFE0966D),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        titleSpacing: 0,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
      floatingActionButton: SizedBox(
        width: 345,
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Ваш код для нажатия на кнопку
                },
                child: Container(
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF262A46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/box.svg'),
                      const SizedBox(width: 10),
                      const Text(
                        '+ Add a Product',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Размещаем в центре
    );
  }
}

class Product {
  final String name;
  final double profit;
  final int stock;
  final String image;

  Product({
    required this.name,
    required this.profit,
    required this.stock,
    required this.image,
  });
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF6F6F6),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            Image.asset(
              product.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      color: Color(0xFF262A46),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Total profit: ',
                          style: TextStyle(
                            color: Color(0xFFA3A3A3),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '\$ 3324.25',
                          style: TextStyle(
                            color: Color(0xFF73D372),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text('In stock: ${product.stock}'),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'In stock: ',
                          style: TextStyle(
                            color: Color(0xFFA3A3A3),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '3324',
                          style: TextStyle(
                            color: Color(0xFF262A46),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/writ.svg',
                ),
                const SizedBox(
                  height: 9,
                ),
                SvgPicture.asset(
                  'assets/icons/deleit.svg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
