import 'package:flutter/material.dart';
import '../tiket/tiket_success.dart';
import '../models/model_riwayat.dart';
import '../auth/session.dart';

class TiketPembelianPage extends StatefulWidget {
  const TiketPembelianPage({super.key});

  @override
  State<TiketPembelianPage> createState() => _TiketPembelianPageState();
}

class _TiketPembelianPageState extends State<TiketPembelianPage> {
  String ticketType = 'VIP';
  int jumlah = 1;
  String metodePembayaran = 'DANA';

  final TextEditingController nomorController = TextEditingController();

  List<int> selectedSeats = [];

  /// ================= HARGA =================
  int getHarga() {
    switch (ticketType) {
      case 'VIP':
        return 200000;
      case 'OFC':
        return 150000;
      case 'GENERAL':
        return 100000;
      default:
        return 0;
    }
  }

  /// ================= RANGE KURSI =================
  List<int> getSeatRange() {
    switch (ticketType) {
      case 'VIP':
        return List.generate(10, (i) => i + 1); // 1–10
      case 'OFC':
        return List.generate(20, (i) => i + 11); // 11–30
      case 'GENERAL':
        return List.generate(20, (i) => i + 31); // 31–50
      default:
        return [];
    }
  }

  @override
  void dispose() {
    nomorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int total = getHarga() * jumlah;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembelian Tiket'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ================= TIPE TIKET =================
            const Text(
              "Tipe Tiket",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: ticketType,
              items: const [
                DropdownMenuItem(value: 'VIP', child: Text('VIP')),
                DropdownMenuItem(value: 'OFC', child: Text('OFC')),
                DropdownMenuItem(value: 'GENERAL', child: Text('GENERAL')),
              ],
              onChanged: (value) {
                setState(() {
                  ticketType = value!;
                  selectedSeats.clear();
                });
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),

            const SizedBox(height: 20),

            /// ================= JUMLAH =================
            const Text(
              "Jumlah Tiket",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (jumlah > 1) {
                      setState(() {
                        jumlah--;
                        selectedSeats.clear();
                      });
                    }
                  },
                ),
                Text(jumlah.toString(), style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      jumlah++;
                      selectedSeats.clear(); // reset biar konsisten
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// ================= PILIH KURSI =================
            const Text(
              "Pilih Kursi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: getSeatRange().map((seat) {
                final isSelected = selectedSeats.contains(seat);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        // batal pilih
                        selectedSeats.remove(seat);
                      } else {
                        // tambah kursi kalau belum melebihi jumlah tiket
                        if (selectedSeats.length < jumlah) {
                          selectedSeats.add(seat);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Maksimal pilih $jumlah kursi'),
                            ),
                          );
                        }
                      }
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.red : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      seat.toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            /// ================= METODE PEMBAYARAN =================
            const Text(
              "Metode Pembayaran",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: metodePembayaran,
              items: const [
                DropdownMenuItem(value: 'DANA', child: Text('DANA')),
                DropdownMenuItem(value: 'OVO', child: Text('OVO')),
                DropdownMenuItem(value: 'GoPay', child: Text('GoPay')),
                DropdownMenuItem(
                  value: 'Transfer Bank',
                  child: Text('Transfer Bank'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  metodePembayaran = value!;
                  nomorController.clear();
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFE0E0E0),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            /// ================= INPUT PEMBAYARAN =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    metodePembayaran == 'Transfer Bank'
                        ? 'No. Rekening'
                        : 'No. $metodePembayaran',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: nomorController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: metodePembayaran == 'Transfer Bank'
                          ? 'Masukkan nomor rekening'
                          : 'Masukkan nomor $metodePembayaran',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ================= TOTAL =================
            Text(
              "Total: Rp $total",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// ================= BAYAR =================
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: () {
                  if (selectedSeats.length != jumlah) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Pilih ${jumlah} kursi terlebih dahulu'),
                      ),
                    );
                    return;
                  }

                  if (nomorController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Nomor pembayaran wajib diisi'),
                      ),
                    );
                    return;
                  }

                  final data = RiwayatPembelian(
                    event: "JKT48 Theater",
                    tipeTiket: ticketType,
                    jumlah: jumlah,
                    kursi: selectedSeats,
                    metode: metodePembayaran,
                    total: total,
                    tanggal: DateTime.now(),
                  );

                  Session.riwayatPembelian.add(data);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TiketSuccessPage(data: data),
                    ),
                  );
                },
                child: const Text(
                  "Bayar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}