import 'package:flutter/material.dart';
import '../auth/session.dart';
import '../models/model_riwayat.dart';

class TiketSuccessPage extends StatelessWidget {
  final RiwayatPembelian data;

  const TiketSuccessPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bukti Pembelian"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 80),
                const SizedBox(height: 12),
                const Text(
                  "Pembelian Berhasil",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Event: ${data.event}"),
                      const SizedBox(height: 6),
                      Text("Tipe Tiket: ${data.tipeTiket}"),
                      const SizedBox(height: 6),
                      Text("Jumlah: ${data.jumlah}"),
                      const SizedBox(height: 6),
                      Text("Jumlah: ${data.kursi.join(', ')}"),
                      const SizedBox(height: 6),
                      Text("Metode Pembayaran: ${data.metode}"),
                      const SizedBox(height: 12),
                      Text(
                        "Total Bayar: Rp ${data.total}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: const Text(
                      "Kembali ke Beranda",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}