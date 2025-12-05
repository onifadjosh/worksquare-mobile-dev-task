import 'package:flutter/material.dart';
import 'package:worksquare_mobile_dev_task/colors/dream_estate_color.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      decoration: BoxDecoration(
        color: DreamEstateColor.primary500,
      ),

      height: isMobile ? 800.0 : 500.0,
      width: double.infinity,

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text(
            'Dream Dwell',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Estates',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 32),

       
          if (isMobile) _buildMobileLayout() else _buildDesktopLayout(),
          
          const SizedBox(height: 32),
          
         
          
          const SizedBox(height: 32),
          

          const Text(
            '© Copyright 2023 DreamDwell Estates - All right reserved.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [

        _buildColumn(
          items: const ['Home', 'About', 'Whitepaper'],
          centerItems: true,
        ),
        const SizedBox(height: 24),
        
  
        _buildColumn(
          items: const ['Listing', 'Blog', 'Contact'],
          centerItems: true, 
        ),
        const SizedBox(height: 24),
        

        _buildColumn(
          items: const ['Agent', 'Contact', 'FAQs'],
          centerItems: true,
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        _buildColumn(
          items: const ['Home', 'About', 'Whitepaper'],
        ),
        
      
        _buildColumn(
          items: const ['Listing', 'Blog', 'Contact'],
        ),
        

        _buildColumn(
          items: const ['Agent', 'Contact', 'FAQs'],
        ),
        

        _buildColumn(
          items: const ['Facebook', 'Instagram', 'Twitter', 'LinkedIn'],
        ),
      ],
    );
  }

  Widget _buildColumn({
    required List<String> items,
    bool centerItems = false, // New parameter
  }) {
    return Column(
      crossAxisAlignment: centerItems ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildSocialColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Follow Us',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        _buildSocialIcons(),
      ],
    );
  }

  Widget _buildSocialIcons({bool horizontal = true}) {
    final socialIcons = [
      {'icon': Icons.facebook, 'label': 'Facebook'},
      {'icon': Icons.camera_alt, 'label': 'Instagram'},
      {'icon': Icons.chat, 'label': 'Twitter'},
      {'icon': Icons.business, 'label': 'LinkedIn'},
    ];

    if (horizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: socialIcons.map((social) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              social['label'] as String,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          );
        }).toList(),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: socialIcons.map((social) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Icon(
                  social['icon'] as IconData,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  social['label'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    }
  }
}