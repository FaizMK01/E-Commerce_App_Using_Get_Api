import 'package:api_rojects_realworld/Models/GetEcommerceModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenTwo extends StatelessWidget {

  final Product product;

  const ScreenTwo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: false,
      ),
      body:ListView(
        shrinkWrap: true,
        children: [
          Image.network(product.images[0]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Discount ${product.discountPercentage}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.blueGrey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(product.rating.toString()),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Stock ${product.stock}",
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),

                      Text(
                        "Brand",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      product.price.toString(),
                      style: const TextStyle(

                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),

                    Text(
                      product.brand.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ],
            ),

          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(product.description),
          ),
          const SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(children: [
              ElevatedButton(

                onPressed: (){
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.teal
                ), child: const Icon(Icons.arrow_back,color: Colors.white,),
              ),
              const SizedBox(width: 15,),
              Expanded(child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal
                ), child:  const Text('Book Now',style: TextStyle(
                    color: Colors.white
                ),),
              ),
              ),


            ],),
          )
        ],
      ),
    );
  }
}
