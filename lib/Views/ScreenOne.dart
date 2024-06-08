import 'package:api_rojects_realworld/ApiServices/ApiServices.dart';
import 'package:api_rojects_realworld/Models/GetEcommerceModel.dart';
import 'package:api_rojects_realworld/Views/ScreenTwo/ProductDetails.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  ApiServices apiServices = ApiServices();
  List<Product> productModel = [];
  bool isLoading = false;
  bool hasError = false;

  void show() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      List<Product> value = await apiServices.getData();
      setState(() {
        productModel = value;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('E-Commerce App Get Api'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text('Error loading data'))
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: productModel.length,
                  itemBuilder: (context, index) {
                    final apiProduct = productModel[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ScreenTwo(
                              product: apiProduct,
                            );
                          }),
                          );
                        },
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage(apiProduct.thumbnail),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    apiProduct.title.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        apiProduct.price.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 17,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(apiProduct.rating.toString())
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
