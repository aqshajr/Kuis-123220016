import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import package url_launcher
import '../model/phone_model.dart';
import '../data/phone_data.dart';
// mas mba maaf tombol storagenya udh setengah jalan dibuat tp masih eror
// jd sementara saya komen dulu sebagian

class DetailProductPage extends StatelessWidget {
  final PhoneModel product;

  const DetailProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Produk',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Informasi Produk
          Padding(
          padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.model,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // Text(
                    //   '\$${product.price.toStringAsFixed(2)}',
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //     color: Colors.green,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${product.brand}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Text('Memori: ${product.memory}'),
                Text('Processor: ${product.brand}'),
                Text('Baterai: ${product.batteryCapacity}'),
                Text('Warna: ${product.colors.join(", ")}'),
                Text('Size: ${product.size.join(", ")} mm'),
                Text('Storage:'),
                // Expanded(
                //   child: GridView.builder(
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //       crossAxisSpacing: 8.0,
                //       mainAxisSpacing: 8.0,
                //       childAspectRatio: 0.75,
                //     ),
                //     itemCount: product.storage.length,
                //     itemBuilder: (context, index) {
                //       PhoneModel storage = phones[index];
                //       return StorageButton(storage: storage);
                //     },
                //   ),
                // ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(product.websiteUrl);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Could not launch URL')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Go to Website',
                      style: TextStyle(color: Colors.black),
                    ),
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

// class StorageButton extends StatefulWidget {
//   final PhoneModel storage;
//
//   const StorageButton({super.key, required this.storage});
//
//   @override
//   _StorageButtonState createState() => _StorageButtonState();
// }
//
// class _StorageButtonState extends State<StorageButton> {
//   bool isClicked = false;
//
//   @override
//   Widget build(BuildContext context) {
//       return OutlinedButton(
//           onPressed: ((){
//
//           }), // Respon ketika button ditekan
//           child: Text("GB "),
//         );
//   }
// }
//
