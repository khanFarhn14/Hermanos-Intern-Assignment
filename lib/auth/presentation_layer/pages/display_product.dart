import 'package:flutter/material.dart';
import 'package:hermanos_assignment/auth/data_layer/data_source/fetch_result.dart';
import 'package:hermanos_assignment/auth/domain_layer/entities/colors.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/textstyle.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/widgets_functions.dart';

// ignore: must_be_immutable
class DisplayProductPage extends StatefulWidget {
  int productId;
  String title, description, category, image;
  final dynamic price;
  DisplayProductPage(
      {super.key,
      required this.productId,
      required this.title,
      required this.description,
      required this.category,
      required this.image,
      required this.price});

  @override
  State<DisplayProductPage> createState() => _DisplayProductPageState();
}

class _DisplayProductPageState extends State<DisplayProductPage> {
  FetchResult fetchResult = FetchResult();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondary,
          title: Text(
            widget.category.toUpperCase(),
            style: headingSmall().copyWith(color: dominant),
          ),
        ),
        backgroundColor: dominant,
        body: SingleChildScrollView(
          child: centeredView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.image,
                width: double.infinity,
              ),
              space(height: 12),
              Text(widget.title, style: headingSmall()),
              space(height: 12),
              Text(widget.description, style: text(secondary70)),
              space(height: 12),
              Text('\$ ${widget.price.toString()}', style: textBold(secondary)),
              space(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: dominant,
                ),
                style: primaryButtonStyle,
                label: _isLoading ? const SizedBox(height: 24, child: CircularProgressIndicator(color: dominant,)) : const Text("Add to Card"))
            ],
          )),
        ));
  }
}
