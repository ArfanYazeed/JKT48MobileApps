import 'package:flutter/material.dart';

class FansPage extends StatelessWidget {
  const FansPage({super.key});

  void showBenefitDetail(
    BuildContext context,
    String title,
    String image,
    String description,
  ) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(image, width: 90),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      description,
                      style: TextStyle(color: Colors.grey[700], height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget benefitCard(
    BuildContext context, {
    required String image,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        showBenefitDetail(context, title, image, description);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffFFE3E3), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black12,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(image, height: 50),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget signButton(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Official Fan Club"),
        backgroundColor: Colors.red,
      ),

      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "OFFICIAL FAN CLUB MEMBERSHIP",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Bergabung menjadi anggota JKT48 Official Fan Club dan dapatkan berbagai keuntungan menarik.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),

                const SizedBox(height: 25),

                const Text(
                  "BENEFITS",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    children: [
                      benefitCard(
                        context,
                        image: "asset/image/official-badge.png",
                        title: "OFC Badge",
                        description:
                            "Kartu OFC ini memiliki banyak kegunaan! Seperti penukaran tiket teater (offline), identitas untuk mendapatkan tiket event OFC, dan lainnya!Badge spesial yang hanya dimiliki oleh anggota OFC!",
                      ),

                      benefitCard(
                        context,
                        image: "asset/image/priority-tiket.png",
                        title: "Priority Ticket",
                        description:
                            "Kamu dapat menghadiri pertunjukan teater offline dan juga mengikuti event OFC! Pada event khusus, kamu juga bisa mendapatkan tiket lebih awal, atau bahkan hadir khusus sebagai anggota OFC",
                      ),

                      benefitCard(
                        context,
                        image: "asset/image/ofc-event.png",
                        title: "OFC Event",
                        description: "Akan ada beberapa event spesial yang hanya dapat diikuti oleh kalian! Sebelumnya pernah dilakukan event membatik, main futsal, membuat pizza, dan banyak keseruan lainnya. Tunggu info lebih lanjut ya!",
                      ),

                      benefitCard(
                        context,
                        image: "asset/image/birthday-vidio.png",
                        title: "Birthday Video",
                        description: "Kamu akan menerima pesan ulang tahun spesial dari oshimenmu di hari spesialmu! Jangan lupa cek halaman mypage di hari spesialmu ya!",
                      ),

                      benefitCard(
                        context,
                        image: "asset/image/lumina-content.png",
                        title: "Lumina Content",
                        description: "Akan ada konten berupa video cinematic vlog atau POV vlog dari member-member dengan tema yang spesial. Kamu bisa cek di my page apabila menerima pemberitahuan dari e-mail. Sudah siap terkesima?",
                      ),

                      benefitCard(
                        context,
                        image: "asset/image/behindthescene.png",
                        title: "Behind The Scene",
                        description:
                            "Intip keseruan proses photoshoot digital photobook eksklusif hanya di server Discord OFC JKT48!",
                      ),

                      benefitCard(
                        context,
                        image: "asset/image/discord.png",
                        title: "Discord Access",
                        description:
                            "Member akan mengambil alih Discord Official JKT48! Dengarkan cerita seru dari member yang mengambil alih server Discord OFC JKT48.",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
