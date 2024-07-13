import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    products = List.generate(
      7,
      (index) => Product(
        name: 'Logitech G Pro X Superlight Wireless Gaming Mouse',
        profit: 3324.25,
        stock: 3324,
        image: 'assets/images/mouse.png',
      ),
    );
  }

  void showAddProductDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController profitController = TextEditingController();
    final TextEditingController stockController = TextEditingController();
    File? imageFile;

    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          imageFile = File(pickedFile.path);
        }
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Product Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: profitController,
                  decoration: InputDecoration(
                    hintText: 'Profit',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: stockController,
                  decoration: InputDecoration(
                    hintText: 'Stock',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: pickImage,
                  child: SvgPicture.asset('assets/icons/addfoto.svg'),
                ),
                const SizedBox(height: 20),
                imageFile != null ? Image.file(imageFile!) : const Text(''),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: const BorderSide(
                              color: Color(0xFF262A46), width: 1),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF535778),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final name = nameController.text;
                        final profitText = profitController.text;
                        final stockText = stockController.text;

                        if (name.isEmpty ||
                            profitText.isEmpty ||
                            stockText.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('All fields are required'),
                            ),
                          );
                          return;
                        }

                        final profit = double.tryParse(profitText);
                        final stock = int.tryParse(stockText);

                        if (profit == null || stock == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Invalid profit or stock'),
                            ),
                          );
                          return;
                        }

                        final newProduct = Product(
                          name: name,
                          profit: profit,
                          stock: stock,
                          image: imageFile?.path ?? 'assets/images/default.png',
                        );
                        setState(() {
                          products.add(newProduct);
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: Colors.amber,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _editProduct(int index) {
    // Implement edit functionality
    print('Edit product at index: $index');
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SvgPicture.asset('assets/icons/bag.svg'),
        ),
        title: const Text(
          'PRODUCTS',
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
          return ProductItem(
            product: products[index],
            onEdit: () => _editProduct(index),
            onDelete: () => _deleteProduct(index),
          );
        },
      ),
      floatingActionButton: SizedBox(
        width: 345,
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showAddProductDialog(context);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductItem({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF6F6F6),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            product.image.startsWith('assets')
                ? Image.asset(
                    product.image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/default.png',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                : Image.file(
                    File(product.image),
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
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Total profit: ',
                          style: TextStyle(
                            color: Color(0xFFA3A3A3),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '\$ ${product.profit}',
                          style: const TextStyle(
                            color: Color(0xFF73D372),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'In stock: ',
                          style: TextStyle(
                            color: Color(0xFFA3A3A3),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '${product.stock}',
                          style: const TextStyle(
                            color: Color(0xFF262A46),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                GestureDetector(
                  onTap: onEdit,
                  child: SvgPicture.asset('assets/icons/writ.svg'),
                ),
                const SizedBox(height: 9),
                GestureDetector(
                  onTap: onDelete,
                  child: SvgPicture.asset('assets/icons/deleit.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
