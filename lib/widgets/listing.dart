import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worksquare_mobile_dev_task/widgets/propert_card.dart';
import 'package:worksquare_mobile_dev_task/widgets/search_filter.dart';

class Listings extends StatelessWidget {
  const Listings({super.key});


 Future<List<Property>> loadProperties() async {
  final jsonString = await rootBundle.loadString('assets/listing.json');
  final List<dynamic> data = json.decode(jsonString);

  return data.map((item) => Property(
    title: item["title"],
    price: int.parse(item["price"].replaceAll(RegExp(r'[^\d]'), '')),
    currency: "₦",
    bedrooms: item["bedrooms"],
    bathrooms: item["bathrooms"],
    location: item["location"],
    imageUrl: item["image"],
    tags: List<String>.from(item["status"]),
  )).toList();
}


@override
Widget build(BuildContext context) {
  return FutureBuilder<List<Property>>(
    future: loadProperties(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        return Center(child: Text("Error loading data: ${snapshot.error}"));
      }

      final properties = snapshot.data!;

      return LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final isMobile = width < 700;
          final isTablet = width >= 700 && width < 1024;
          final isDesktop = width >= 1024;

          double _calculateChildAspectRatio(bool isTablet, bool isDesktop) {
            if (isDesktop) return 3.0;
            if (isTablet) return 2.0;
            return 2.0;
          }

          return Column(
            children: [
              const SizedBox(height: 16),

              /// Search bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : 24,
                  vertical: 6,
                ),
                child: SearchFilterBar(isMobile: isMobile),
              ),

              const SizedBox(height: 18),

          
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: isMobile ? 12 : 28),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? 1024 : double.infinity,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: properties.length,
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 1 : 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: _calculateChildAspectRatio(
                            isTablet, isDesktop),
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 250,
                          child: PropertyCard(
                            property: properties[index],
                            isMobile: isMobile,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

             
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: isMobile ? 16 : 28,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(maxWidth: isDesktop ? 600 : 800),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _PaginationWidget(),
                      ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
}

class _PaginationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left)),
        _PageNumberButton(number: 1, active: true),
        _PageNumberButton(number: 2),
        _PageNumberButton(number: 3),
        _PageNumberButton(number: 4),
        IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
      ],
    );
  }
}

class _PageNumberButton extends StatelessWidget {
  final int number;
  final bool active;
  const _PageNumberButton({required this.number, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(

          elevation: 0,
          backgroundColor: active ? Colors.blue : Colors.grey.shade100,
          foregroundColor: active ? Colors.white : Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        ),
        child: Text(number.toString()),
      ),
    );
  }
}
