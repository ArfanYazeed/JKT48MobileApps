import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'image_viewer.dart';

import 'dart:html' as html;
import 'dart:ui_web' as ui;

class TheaterPage extends StatelessWidget {
  const TheaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // ================= HERO SECTION =================
            Stack(
              children: [
                Image.asset(
                  "asset/image/2.jpg",
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Gradient merah elegan
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xCCB30000), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 30,
                  left: 24,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "JKT48 Theater",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Experience the Exclusive Live Performance",
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      const SizedBox(height: 14),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ================= GALLERY =================
                  const Text(
                    "Gallery",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 14),

                  Column(
                    children: [
                      // ===== BARIS ATAS (3 GAMBAR) =====
                      Row(
                        children: [
                          Expanded(
                            child: _galleryImage(context, "asset/image/10.jpg"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _galleryImage(context, "asset/image/3.jpg"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _galleryImage(context, "asset/image/4.jpg"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // ===== BARIS BAWAH (2 GAMBAR DI TENGAH) =====
                      Row(
                        children: [ // dorong ke tengah
                          Expanded(
                            child: _galleryImage(context, "asset/image/11.jpg"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _galleryImage(context, "asset/image/12.jpg"),
                          ), // dorong ke tengah
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // ================= ABOUT =================
                  _sectionCard(
                    title: "Apa itu Theater JKT48?",
                    icon: Icons.theaters,
                    content:
                        "JKT48 Theater adalah tempat pertunjukan resmi JKT48 di Jakarta. "
                        "Di sini para member membawakan setlist rutin dan event spesial "
                        "dalam suasana yang intim dan eksklusif bersama fans.",
                  ),

                  const SizedBox(height: 20),

                  _sectionCard(
                    title: "Location",
                    icon: Icons.location_on,
                    content:
                        "fX Sudirman Lantai 4 (F4)\n"
                        "Jl. Jend. Sudirman Pintu Satu Senayan\n"
                        "Jakarta Selatan, Indonesia\n"
                        "Petunjuk\n"
                        "Mobil\n"
                        "Dekat dengan Stadion Gelora Bung Karno\n"
                        "Transjakarta\n"
                        "Berhenti di Halte Gelora Bung Karno",
                  ),

                  const SizedBox(height: 30),

                  // ================= MAP =================
                  const Text(
                    "Interactive Map",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 14),

                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 25,
                          offset: const Offset(0, 15),
                        ),
                      ],
                    ),
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: GoogleMapEmbed(),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= SECTION CARD =================
  Widget _sectionCard({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Accent line merah
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFE60012),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Icon(icon, color: const Color(0xFFE60012)),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            content,
            style: const TextStyle(
              height: 1.7,
              fontSize: 14.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // ================= GALLERY IMAGE =================
  Widget _galleryImage(BuildContext context, String path) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ImageViewerPage(imagePath: path)),
        );
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(path, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

// ================= GOOGLE MAP =================
class GoogleMapEmbed extends StatelessWidget {
  const GoogleMapEmbed({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      const viewType = 'google-map-iframe';

      ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
        final iframe = html.IFrameElement()
          ..src =
              "https://www.google.com/maps?q=JKT48+Theater+fX+Sudirman&output=embed"
          ..style.border = '0'
          ..style.width = '100%'
          ..style.height = '100%';

        return iframe;
      });

      return const HtmlElementView(viewType: viewType);
    } else {
      return const Center(child: Text("Map tersedia di Web"));
    }
  }
}
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'image_viewer.dart';

// class TheaterPage extends StatefulWidget {
//   const TheaterPage({super.key});

//   @override
//   State<TheaterPage> createState() => _TheaterPageState();
// }

// class _TheaterPageState extends State<TheaterPage> {
//   late final WebViewController _mapController;

//   @override
//   void initState() {
//     super.initState();
//     _mapController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..loadRequest(
//         Uri.parse(
//           "https://www.google.com/maps?q=JKT48+Theater+fX+Sudirman&output=embed",
//         ),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: SafeArea(
//         child: ListView(
//           physics: const BouncingScrollPhysics(),
//           padding: const EdgeInsets.all(12),
//           children: [
//             // ===== HEADER MERAH (JKT48 Theater) =====
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//               decoration: const BoxDecoration(color: Color(0xFFE60012)),
//               child: const Text(
//                 "JKT48 Theater",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 28,
//                   fontWeight: FontWeight.w300,
//                   letterSpacing: 1,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 12),

//             // ===== GAMBAR BESAR =====
//             ClipRRect(
//               borderRadius: BorderRadius.circular(6),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) =>
//                           const ImageViewerPage(imagePath: "asset/image/2.jpg"),
//                     ),
//                   );
//                 },
//                 child: Image.asset(
//                   "asset/image/2.jpg",
//                   width: double.infinity,
//                   height: 220,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 12),

//             // ===== GALLERY 3 GAMBAR =====
//             Row(
//               children: [
//                 Expanded(child: _galleryImage(context, "asset/image/1.jpg")),
//                 const SizedBox(width: 8),
//                 Expanded(child: _galleryImage(context, "asset/image/3.jpg")),
//                 const SizedBox(width: 8),
//                 Expanded(child: _galleryImage(context, "asset/image/4.jpg")),
//               ],
//             ),

//             const SizedBox(height: 18),

//             // ===== PENJELASAN THEATER =====
//             _infoCard(
//               icon: Icons.theaters_rounded,
//               title: "Tentang JKT48 Theater",
//               content:
//                   "JKT48 Theater adalah teater resmi tempat pertunjukan rutin JKT48 di Jakarta. "
//                   "Di theater ini para member tampil secara langsung melalui stage setlist, "
//                   "pertunjukan spesial, dan event eksklusif yang memberikan pengalaman lebih dekat "
//                   "antara fans dan idol dalam suasana live performance yang eksklusif.",
//             ),

//             const SizedBox(height: 14),

//             // ===== ALAMAT =====
//             _infoCard(
//               icon: Icons.location_on_rounded,
//               title: "Alamat",
//               content:
//                   "JKT48 Theater\n"
//                   "fX Sudirman Lantai 4 (F4)\n"
//                   "Jl. Jend. Sudirman Pintu Satu Senayan\n"
//                   "Jakarta Selatan, Indonesia",
//             ),

//             const SizedBox(height: 14),

//             // ===== PETUNJUK =====
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: _cardDecoration(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Row(
//                     children: [
//                       Icon(Icons.directions_rounded, color: Color(0xFFE60012)),
//                       SizedBox(width: 8),
//                       Text(
//                         "Petunjuk Akses",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),

//                   // Mobil
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.directions_car, size: 20),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           "Mobil: Berlokasi di fX Sudirman, dekat dengan Stadion Gelora Bung Karno (GBK).",
//                           style: TextStyle(height: 1.6),
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 10),

//                   // Transjakarta
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.directions_bus, size: 20),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           "Transjakarta: Berhenti di Halte Gelora Bung Karno, lalu berjalan kaki menuju fX Sudirman.",
//                           style: TextStyle(height: 1.6),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 18),

//             // ===== GOOGLE MAPS ASLI =====
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.08),
//                     blurRadius: 12,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: WebViewWidget(controller: _mapController),
//               ),
//             ),

//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // ===== CARD INFO REUSABLE =====
//   Widget _infoCard({
//     required IconData icon,
//     required String title,
//     required String content,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: _cardDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(icon, color: const Color(0xFFE60012)),
//               const SizedBox(width: 8),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           Text(
//             content,
//             style: const TextStyle(
//               fontSize: 14,
//               height: 1.6,
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ===== STYLE CARD =====
//   BoxDecoration _cardDecoration() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 12,
//           offset: const Offset(0, 4),
//         ),
//       ],
//     );
//   }

//   // ===== WIDGET GALLERY CLICKABLE =====
//   Widget _galleryImage(BuildContext context, String path) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => ImageViewerPage(imagePath: path)),
//         );
//       },
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(6),
//         child: Image.asset(path, fit: BoxFit.cover),
//       ),
//     );
//   }
// }
