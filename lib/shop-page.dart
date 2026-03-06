import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Tidak bisa membuka link";
    }
  }

  Widget shopCard({
    required String title,
    required String image,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => openLink(url),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Image.asset(image, width: 50),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// WIDGET PERINGATAN
  Widget warningBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange,
            size: 28,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Peringatan:\n"
              "Pastikan Anda hanya membeli merchandise melalui toko resmi JKT48 "
              "yang tersedia di halaman ini. Hindari membeli dari toko tidak resmi "
              "untuk menghindari produk palsu atau penipuan.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Official Shop"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// PERINGATAN
            warningBox(),

            shopCard(
              title: "JKT48 Official Shop - Shopee",
              image: "asset/image/shopee.jpg",
              url: "https://shopee.co.id/officialjkt48#product_list",
            ),

            shopCard(
              title: "JKT48 Official Shop - Tokopedia",
              image: "asset/image/tokopedia.jpg",
              url: "https://www.tokopedia.com/jkt48-official-store",
            ),

          ],
        ),
      ),
    );
  }
}