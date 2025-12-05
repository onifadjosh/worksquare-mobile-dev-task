import 'package:flutter/material.dart';
import 'package:worksquare_mobile_dev_task/colors/dream_estate_color.dart';

class Property {
  final String title;
  final int price;
  final String currency;
  final int bedrooms;
  final int bathrooms;
  final String location;
  final String imageUrl;
  final List<String> tags;

  Property({
    required this.title,
    required this.price,
    required this.currency,
    required this.bedrooms,
    required this.bathrooms,
    required this.location,
    required this.imageUrl,
    required this.tags,
  });
}

class PropertyCard extends StatelessWidget {
  final Property property;
  final bool isMobile;
  const PropertyCard({
    required this.property,
    required this.isMobile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300),
        height: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            // Image
            SizedBox(
              width: 140,
              height: double.infinity,
              child: Stack(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      property.imageUrl,
                      width: 140,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.photo,
                          size: 48,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  // TAGS ON TOP OF IMAGE
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: property.tags.map((t) {
                        return Container(
                          margin: const EdgeInsets.only(left: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            t,
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),
 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${property.currency} ${_formatInt(property.price)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Per Annum',
                            style: TextStyle(fontSize: 8, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),


                  Row(
                    children: [
                      Icon(
                        Icons.bed_outlined,
                        size: 8,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${property.bedrooms} Bedroom',
                        style: const TextStyle(fontSize: 8),
                      ),
                      const SizedBox(width: 2),
                      Icon(
                        Icons.bathtub_outlined,
                        size: 8,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${property.bathrooms} Bathroom',
                        style: const TextStyle(fontSize: 8),
                      ),
                      const SizedBox(width: 2 ),
             
                      Icon(
                        Icons.location_on_outlined,
                        size: 8,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 2),
                      SizedBox(
                        width: 50,
                        child: Text(
                          property.location,
                          style: const TextStyle(fontSize: 8),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),


                  Text(
                    property.title,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),

    
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                     
                      label: const Text('View', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: DreamEstateColor.primary500,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.fromLTRB(
                         8,2,8,2
                        ),
                        textStyle: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatInt(int n) {
    final s = n.toString();
    final buffer = StringBuffer();
    var count = 0;
    for (var i = s.length - 1; i >= 0; i--) {
      buffer.write(s[i]);
      count++;
      if (count == 3 && i != 0) {
        buffer.write(',');
        count = 0;
      }
    }
    return buffer.toString().split('').reversed.join();
  }
}
