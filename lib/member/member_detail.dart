import 'package:flutter/material.dart';
import '../models/member_model.dart';

class MemberDetailPage extends StatelessWidget {
  final Member member;

  const MemberDetailPage({super.key, required this.member});

  Widget item(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 140,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
        const Divider(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anggota JKT48'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// FOTO MEMBER (TENGAH)
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  member.image,
                  width: 220,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// DETAIL DATA
            item('Nama', member.nama),
            item('Tanggal Lahir', member.tanggalLahir),
            item('Golongan Darah', member.golonganDarah),
            item('Horoskop', member.horoskop),
            item('Tinggi Badan', member.tinggiBadan),
            item('Nama Panggilan', member.namaPanggilan),
          ],
        ),
      ),
    );
  }
}