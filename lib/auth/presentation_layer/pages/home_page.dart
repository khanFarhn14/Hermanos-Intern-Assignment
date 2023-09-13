import 'package:flutter/material.dart';
import 'package:hermanos_assignment/auth/data_layer/data_source/fetch_result.dart';
import 'package:hermanos_assignment/auth/data_layer/model/products.dart';
import 'package:hermanos_assignment/auth/domain_layer/entities/colors.dart';
import 'package:hermanos_assignment/auth/presentation_layer/pages/category_page.dart';
import 'package:hermanos_assignment/auth/presentation_layer/pages/display_product.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/textstyle.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/widgets_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FetchResult fetchResult = FetchResult();

  Future<ProductList>? productsList;

  @override
  void initState() {
    productsList = getProductsList();
    super.initState();
  }

  Future<ProductList> getProductsList() async {
    return await fetchResult.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary,
        title: Text("All Category", style: headingSmall().copyWith(color: dominant)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: (){},
          ),

          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () => nextScreen(context, const CategoryPage()),
          ),
        ],
      ),
      backgroundColor: dominant,
      body: centeredView(
          child: Center(
            child: FutureBuilder<ProductList>(
                future: productsList,
                builder: (context, AsyncSnapshot<ProductList> snapshot) {
                  // List<Products> products;
                  if (snapshot.hasData) {
                    // products = snapshot.data!.products;
                    return ListView.builder(
                        itemCount: snapshot.data!.products.length,
                        itemBuilder: (context, index) => Card(
                              elevation: 1,
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                splashColor: secondary15,
                                onTap: () {
                                  nextScreen(
                                      context,
                                      DisplayProductPage(
                                          productId: snapshot.data!.products[index].id,
                                          title: snapshot
                                              .data!.products[index].title,
                                          description: snapshot
                                              .data!.products[index].description,
                                          category: snapshot
                                              .data!.products[index].category,
                                          image: snapshot
                                              .data!.products[index].image,
                                          price: snapshot
                                              .data!.products[index].price));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        snapshot.data!.products[index].image,
                                        width: 80,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              width: 200,
                                              child: Text(
                                                  snapshot.data!.products[index]
                                                      .title,
                                                  style: textBold(secondary))),
                                          space(height: 4),
                                          SizedBox(
                                              width: 200,
                                              child: Text(
                                                  '\$ ${snapshot.data!.products[index].price.toString()}',
                                                  style: text(secondary50))),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  } else if (snapshot.hasError) {
                    return Text("Error", style: textBold(Colors.red));
                  }
                  return const CircularProgressIndicator(
                    color: secondary,
                  );
                }),
          )),
    );
  }
}
