import 'package:flutter/material.dart';
import '../member/member_data.dart';
import '../member/member_detail.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anggota JKT48'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: members.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) {
          final member = members[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MemberDetailPage(member: member),
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      member.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    member.nama,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}