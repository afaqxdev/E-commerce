import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_app/const/color.dart';
import 'package:task_app/model/product_model.dart';
import 'package:task_app/routing/routing_name.dart';
import 'package:task_app/uitls/custom_text.dart';
import 'package:task_app/uitls/sizebox_extension.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutesName.productDetails,
            arguments: product,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero animation applied here
            Expanded(
              flex: 2,
              child: Hero(
                tag: 'product_${product.id}', // unique tag per product
                child: SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: product.thumbnail,
                    fit: BoxFit.contain,
                    placeholder:
                        (context, url) => Container(
                          color: Colors.grey[200],
                          child: Icon(Icons.image, size: 50.sp),
                        ),
                    errorWidget:
                        (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: Icon(Icons.broken_image, size: 50.sp),
                        ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: product.title,
                      maxLines: 2,
                      fontSize: 14.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.ph,
                    CustomText(
                      text: '\$${product.price.toStringAsFixed(2)}',
                      maxLines: 2,
                      fontSize: 14.sp,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        CustomText.small('${product.rating}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
