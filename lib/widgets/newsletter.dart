import 'package:flutter/material.dart';
import 'package:worksquare_mobile_dev_task/colors/dream_estate_color.dart';
import 'package:worksquare_mobile_dev_task/widgets/dream_estate_button.dart';

class NewsletterSection extends StatelessWidget {
  const NewsletterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    
    
    return Container(
      
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(context),
    );
  }

  Widget _buildMobileLayout() {
    return Container(
       margin: const EdgeInsets.symmetric(vertical: 40),
       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      width: double.infinity,
      decoration: BoxDecoration(
        color: DreamEstateColor.primary500,
     
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
    
          Text(
            'Sign up for\nour Newsletter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
      
   
          Text(
            'Stay informed about our latest properties at DreamDwell Estates '
            'by subscribing to regular updates directly to your inbox.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
      
    
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Your Email Address',
              hintStyle: TextStyle(color: Colors.grey[500]),
              filled: true,
              fillColor: Colors.grey[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: DreamEstateColor.primary500,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          
      
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
              
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: DreamEstateColor.primary500,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Subscribe',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {

     final bool isTablet = MediaQuery.of(context).size.width >=768 && MediaQuery.of(context).size.width <1024;
    return Container(
      decoration: BoxDecoration(
        color: DreamEstateColor.primary500,
        borderRadius: BorderRadius.circular(20)
      ),
      margin: const EdgeInsets.symmetric(vertical: 40),
      width:isTablet? MediaQuery.of(context).size.width*0.9: MediaQuery.of(context).size.width*0.8,
      padding: isTablet ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20):const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                Text(
                  'Sign up for\nour Newsletter',
                  style: TextStyle(
                    fontSize: isTablet ? 30 : 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
      
    
                SizedBox(
                  width: 400, 
                  child: Text(
                    'Stay informed about our latest properties at DreamDwell Estates '
                    'by subscribing to regular updates directly to your inbox.',
                    style: TextStyle(
                      fontSize: isTablet ? 14 : 18,
                      color: Colors.white,
                      height: 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
      
          const SizedBox(width: 60), 
      
       
          Expanded(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email Address',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: DreamEstateColor.primary500,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                

                SizedBox(
                  width: isTablet?200:250,
                  child: DreamEstateButton(label: "Subscribe",
                    onPressed: () {
                  
                    },
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: DreamEstateColor.primary500,)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}