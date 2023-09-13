import 'package:flutter/material.dart';
import 'package:hermanos_assignment/auth/domain_layer/entities/colors.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/textstyle.dart';
import 'package:hermanos_assignment/auth/presentation_layer/widgets/widgets_functions.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondary,
        title: Text("Category", style: headingSmall().copyWith(color: dominant)),
      ),

      backgroundColor: dominant,

      body: centeredView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                color: dominant,
                elevation: 2,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: secondary15,
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Center(child: Text("Mens Clothing", style: headingSmall()))
                  )
                ),
            
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                color: dominant,
                elevation: 2,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: secondary15,
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Center(child: Text("Womens Clothing", style: headingSmall()))
                  )
                ),
            
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                color: dominant,
                elevation: 2,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: secondary15,
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Center(child: Text("Electronics", style: headingSmall()))
                  )
                ),
            
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                color: dominant,
                elevation: 2,
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: secondary15,
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Center(child: Text("Jewelry", style: headingSmall()))
                  )
                ),
            
              ),
            ),
          ],
        )
      ),
    );
  }
}