import 'package:flutter/material.dart';

class SearchFilterBar extends StatelessWidget {
  final bool isMobile;
  const SearchFilterBar({required this.isMobile});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
        
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(

              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                _FilterChipTile(
                  icon: Icons.home_outlined,
                  label: 'Property Type',
                  value: 'House',
                ),
   
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 40, 
                    child: const VerticalDivider(),
                  ),
                ),
                _FilterChipTile(
                  icon: Icons.place_outlined,
                  label: 'Location',
                  value: 'Laderin, Abeokuta',
                ),
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 40,
                    child: const VerticalDivider(),
                  ),
                ),
                _FilterChipTile(
                  icon: Icons.attach_money,
                  label: 'Price Range',
                  value: '₦ 250,000 - ₦ 350,000',
                ),
  
                const SizedBox(width: 24), 
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text('Search'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                )
              ],
            ),
          ),
          if (isMobile) const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _FilterChipTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _FilterChipTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.blue.shade700),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
 
          mainAxisSize: MainAxisSize.min, 
          children: [
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            const SizedBox(height: 2),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}
