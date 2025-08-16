import 'package:flutter/material.dart';
import 'package:store_app/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DiscountCarousel extends StatelessWidget {
  const DiscountCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_AdItem> ads = [
      _AdItem(
        image: 'assets/images/ads_1.jpg',
        title: "Big Black Market Surprise",
        subtitle: "Cashback 30% on Robot Vacuum!!",
      ),
      _AdItem(
        image: 'assets/images/ads_2.jpg',
        title: "Special Offer Today!",
        subtitle: "Buy 1 Get 1 Free for Smartphones",
      ),
      _AdItem(
        image: 'assets/images/ads_3.jpg',
        title: "Exclusive Deals",
        subtitle: "Up to 50% off on skin creams!",
      ),
    ];

    return CarouselSlider.builder(
      itemCount: ads.length,
      itemBuilder: (context, index, realIndex) {
        final ad = ads[index];
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(ad.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.4),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenWidth(15),
            ),
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: "${ad.title}\n",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  children: [
                    TextSpan(
                      text: ad.subtitle,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: getProportionateScreenWidth(140),
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }
}

class _AdItem {
  final String image;
  final String title;
  final String subtitle;

  const _AdItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
