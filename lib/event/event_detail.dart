import 'package:flutter/material.dart';
import '../auth/session.dart';
import '../profile/profile.dart';
import '../tiket/tiket_pembelian.dart';

class EventDetailPage extends StatelessWidget {
  final String title;
  final String type;
  final String time;
  final String date;

  const EventDetailPage({
    super.key,
    required this.title,
    required this.type,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header pink gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF8A80),
                    // Color(0xFFFF5252),
                  ],
                ),
              ),
              child: const Center(
                // child: Text(
                //   "Jadwal Event",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 22,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
            ),

            const SizedBox(height: 16),

            // Card utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header tabel
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "EVENT DATE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "TICKET TYPE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "PURCHASE PERIOD",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Isi tabel
                    _buildRow(
                      context,
                      dateInfo:
                          "Minggu,\n$date Februari 2026\nStart $time\nPenukaran tiket ${(time.isEmpty ? "-" : time)}",
                      ticketType: "$title\nVIP\nRp 200.000",
                      period: "-",
                    ),

                    _divider(),

                    _buildRow(
                      context,
                      dateInfo: "",
                      ticketType: "OFC\nRp 150.000",
                      period: "18 Feb 2026 18:30 WIB - 20 Feb 2026 18:00 WIB",
                    ),

                    _divider(),

                    _buildRow(
                      context,
                      dateInfo: "",
                      ticketType: "GENERAL\nRp 100.000",
                      period: "19 Feb 2026 18:00 WIB - 21 Feb 2026 18:00 WIB",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol beli tiket
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    if (!Session.isLogin) {
                      // jika belum login
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Silakan login / registrasi terlebih dahulu",
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );

                      // arahkan ke halaman profile/register
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    }

                    // setelah kembali, cek lagi
                    if (Session.isLogin) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TiketPembelianPage(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Beli Tiket",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required String dateInfo,
    required String ticketType,
    required String period,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(dateInfo, style: const TextStyle(fontSize: 13)),
          ),
          Expanded(
            flex: 2,
            child: Text(
              ticketType,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(period, style: const TextStyle(fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0));
  }
}