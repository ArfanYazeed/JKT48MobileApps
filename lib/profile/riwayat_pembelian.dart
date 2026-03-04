import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../auth/session.dart';
import '../tiket/tiket_success.dart';

class RiwayatPembelianPage extends StatelessWidget {
  const RiwayatPembelianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pembelian"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Session.riwayatPembelian.isEmpty
            ? const Center(child: Text("Belum ada pembelian"))
            : ListView.builder(
                itemCount: Session.riwayatPembelian.length,
                itemBuilder: (context, index) {
                  final data = Session.riwayatPembelian[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TiketSuccessPage(data: data),
                          ),
                        );
                      },
                      leading: const Icon(
                        Icons.confirmation_number,
                        color: Colors.red,
                      ),
                      title: Text("${data.tipeTiket} x${data.jumlah}"),
                      subtitle: Text(
                        "Metode: ${data.metode}\n"
                        "Tanggal: ${DateFormat(
                          'dd MMM yyyy, HH:mm',
                        ).format(data.tanggal)}",
                      ),
                      trailing: Text(
                        "Rp ${data.total}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}