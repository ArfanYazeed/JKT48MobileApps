import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  final News? initialNews;
  const NewsPage({super.key, this.initialNews});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class News {
  final String category;
  final String title;
  final String date;
  final String detail;
  final String imageUrl;

  News({
    required this.category,
    required this.title,
    required this.date,
    required this.detail,
    required this.imageUrl,
  });
}

class _NewsPageState extends State<NewsPage> {
  News? selectedNews;

  @override
  void initState() {
    super.initState();
    selectedNews = widget.initialNews;
  }

  int? hoveredIndex;

  final Color jktRed = const Color(0xFFE60012);

  final List<News> newsList = [
    News(
      category: "EVENT",
      title: "Pengumuman Mengenai JKT48 OFC Event “JKT48 Psychology Project”",
      date: "23 Februari 2026",
      detail:
          "Terima kasih atas dukungannya untuk JKT48.\n\n"
          "Era yang baru telah tiba, JKT48 Fight! Bersama semangat baru ini, setiap team di JKT48 akan bersinar dengan cahayanya sendiri. Kali ini, JKT48 OFC Event hadir dengan tajuk “JKT48 Psychology Project: Discovering Our Love, Dream and Passion”, yang akan mengajak kalian untuk mengenali potensi diri sekaligus mengenal lebih dekat seluruh member yang tergabung dalam Team Love, Dream dan Passion JKT48\n\n"
          "Kegiatan spesial ini berlangsung selama periode bulan puasa, sehingga melalui acara ini kalian akan menghabiskan waktu menjelang buka puasa dengan kegiatan yang bermakna, yaitu mengetahui potensi diri melalui berbagai tes psikologi eksklusif bersama member JKT48 pada sesi pertama. Tidak perlu khawatir jam berbuka, tentunya kegiatan ini juga dilanjutkan dengan acara buka puasa bersama!\n\n"
          "Kalian juga dapat mengikuti bincang-bincang eksklusif bersama para member JKT48 untuk mengenal lebih dalam mengenai visi, karakter, mimpi dan warna dari setiap team pada sesi kedua.",
      imageUrl: "",
    ),
    News(
      category: "THEATER",
      title: "Pengumuman Mengenai Ramadhan Charity Donation 2026",
      date: "20 Februari 2026",
      detail:
          "Terima kasih atas dukungannya untuk JKT48.\n\n"
          "Sampai hari ini, bencana alam yang melanda Aceh masih terasa dampaknya dan masih banyak saudara-saudara kita di sana yang membutuhkan bantuan agar bisa segera pulih.\n\n"
          "JKT48 kembali mengundang kalian semua untuk turut berpartisipasi memberikan bantuan berupa donasi.\n\n"
          "Donasi dapat dilakukan dengan mengakses saweria.co/officialJKT48 atau dengan memindai QR Code di bawah ini.\n\n"
          "QR Code juga akan ditampilkan di layar live-streaming pertunjukan teater JKT48 selama bulan Ramadan.\n\n"
          "Jalur donasi akan dibuka sampai dengan Senin, 16 Maret 2026 pukul 12.00 WIB. Jumlah donasi terkumpul akan diumumkan pada pertunjukan teater spesial Ramadan di hari yang sama dan akan disalurkan melalui Asar Humanity.\n\n"
          "Mohon dukungannya untuk kita semua.\n\n"
          "JKT48 Operation Team.",
      imageUrl: "asset/image/qr.png",
    ),
    News(
      category: "OTHER",
      title: "Pengumuman Mengenai Aktivitas Gendis Mayrannisa di JKT48",
      date: "17 Februari 2026",
      detail:
          "Terima kasih atas dukungannya untuk JKT48.\n\n"
          "Terkait foto yang beredar di sosial media beberapa hari lalu, Gendis telah menjelaskan kejadian tersebut dengan sejujur-jujurnya kepada manajemen.\n\n"
          "Kurangnya kesadaran diri yang bersangkutan sebagai member JKT48 telah mengakibatkan kegaduhan dan banyak pihak kecewa.\n\n"
          "Oleh karena itu kami memutuskan untuk menangguhkan aktivitas Gendis Mayrannisa sebagai member JKT48 terhitung hari ini sampai 17 Mei 2026.\n\n"
          "Selama ditangguhkan, Gendis tidak akan tampil di panggung publik seperti pertunjukan teater, event, media, dan sejenisnya. Selama masa tersebut, kami harap Gendis dapat melakukan hal-hal yang bisa membuatnya melakukan introspeksi diri dan beraktivitas dengan kesadaran dan rasa tanggung jawab yang sepantasnya.\n\n"
          "Seiring dengan ditangguhkannya Gendis Mayrannisa dari kegiatan JKT48, kami akan mengadakan refund JKT48 point untuk pemilik tiket video call dari bonus Digital Photobook “JKT48 27th Single: Andai 'Ku Bukan Idola – Idol Nanka Janakattara” yang dijadwalkan pada tanggal 27 Februari 2026. Detail mengenai prosedurnya akan kami umumkan secepatnya.\n\n"
          "Terima kasih.\n\n"
          "Mohon dukungannya selalu untuk JKT48.\n\n"
          "JKT48 Operation Team.\n\n",
      imageUrl: "",
    ),
    News(
      category: "THEATER",
      title: "Pengumuman Mengenai Aktivitas JKT48 Theater Selama Ramadhan 2026",
      date: "16 Februari 2026",
      detail:
          "Terima kasih selalu atas dukungannya untuk JKT48.\n\n"
          "Bulan Ramadan telah tiba! Di tahun 2026 ini, JKT48 akan kembali mengadakan berbagai macam pertunjukan teater spesial untuk menemani kalian di bulan suci ini. Berikut adalah daftar pertunjukan yang akan dihadirkan:\n\n"
          "JKT48 SCHOOL\n\n"
          "Di JKT48 School, para Trainee akan berperan sebagai siswa yang siap menimba pengalaman baru, bertumbuh, dan menggali kemampuan terbaik dalam diri mereka. Setiap kelas bukan sekadar ruang belajar, melainkan juga menjadi kesempatan untuk menampilkan warna dan karakter berbeda yang belum pernah kamu lihat sebelumnya. Ayo, ikuti JKT48 School dan kenal lebih dekat dengan para trainee! Saksikan antusiasme mereka di setiap kelas saat mereka berproses, berjuang, dan semakin berkembang. Dijamin, kamu akan menemukan pesona baru yang membuatmu semakin terpikat!\n\n"
          "Z VS ALPHA\n\n"
          "Sebuah live variety show di mana dua generasi bertemu untuk saling unjuk kelebihan mereka. Dari kreativitas, kecepatan, hingga insting digital, setiap tim menampilkan cara unik mereka menghadapi dunia modern. Siapakah yang akan membuktikan diri paling adaptif dan mendominasi masa depan?\n\n"
          "ANDAI ‘KU BUKAN IDOLA\n\n"
          "Bagi mereka yang percaya, hidup ini sudah punya skenarionya sendiri. Tapi, bagaimana kalau di dalam skenario ada banyak skenario?\n\n"
          "Apa jadinya kalau kamu tiba-tiba menjadi seorang CEO terkaya di negaramu? Bagaimana jika seorang Idola terjebak dalam cerita novel yang menjadi kenyataan?  Akankah mereka masih mengingat jati dirinya sebagai seorang Idola?\n\n"
          "Andai 'Ku Bukan Idola, sebuah skenario kehidupan yang diatur oleh para elit global. Ketika pilihan telah ditentukan, para elit global memulai permainan. Skenario yang dibuat khusus di bulan puasa, bagi mereka yang jadi bulan-bulanan warga.\n\n"
          "JKT48 FIGHT: LOVE DREAM PASSION\n\n"
          "Bersiaplah untuk menyaksikan awal dari sesuatu yang luar biasa! WE ARE: Love, Dream, Passion bukan sekadar pre-launch biasa, tapi awal dari era baru yang bakal EPIC banget! Kenalan yuk sama trio team baru dari JKT48 Fight!: Team Love, Team Dream, dan Team Passion! Ini bukan acara kenalan kaku yang ngebosenin, tapi SHOWDOWN sesungguhnya buat ngenalin vibe dan skill ikonik mereka! Kita bakal push mereka ke batas maksimal lewat serangkaian tantangan yang bikin keringet dingin, tegang, sekaligus tertawa bareng! Jangan sampe kelewatan momen iconic ini ya!!\n\n"
          "THE CHALLENGERS\n\n"
          "Kami ingin menginformasikan bahwa Nina Tutachia akan mengajukan tantangan kepada senior setelah 2 tahun lebih mengasah kemampuan dia di JKT48. Adapun tantangan yang dimaksud adalah bernyanyi, menari, dan kemampuan MC, atau bisa jadi akting. Namun tentu tidak sendirian, dia akan ditemani oleh kawan-kawannya untuk memperkuat bakatnya menghadapi para senior. Akankah Nina Tutachia mampu membuktikan hasil kerja kerasnya selama di JKT48 pada Event Ramadan tahun ini?\n\n"
          "SELEKSI PMDK 2026\n\n"
          "Seleksi PMDK kembali diadakan tahun ini! Karena antusiasme para peserta yang sangat tinggi, seleksi ini akan diadakan dengan lebih kompetitif dengan membagi para peserta khusus mata pelajaran IPA dan khusus IPS. Siapkah kalian untuk kembali menyaksikan adu kecerdasan para peserta demi meraih gelar “Einstein Masa Depan”.\n\n"
          "Bersama pengumuman ini pun, kami menginformasikan bahwa selama bulan Ramadan 2026, pertunjukan setlist JKT48 Theater akan ditiadakan. Untuk jadwal lengkap pertunjukan spesial Ramadan akan kami perbaharui secara berkala dan bisa dicek melalui tautan berikut ini: JKT48 Event Schedule\n\n"
          "Semoga rangkaian event Ramadan bersama JKT48 ini bisa menghibur kalian semua! Jangan sampai melewatkannya! Kami tunggu juga kedatangannya ya!\n\n"
          "Mohon dukungannya untuk JKT48.\n\n"
          "JKT48 Operation Team.\n\n",
      imageUrl: "",
    ),
    News(
      category: "GOODS",
      title: "Pengumuman Mengenai Pre-Order 'Andai Ku Bukan Idola Box Set'",
      date: "15 Februari 2026",
      detail:
          "Terima kasih atas dukungannya untuk JKT48.\n\n"
          "Merchandise istimewa dari single terbaru ke-27 JKT48, “Andai ’Ku Bukan Idola”, sudah bisa kamu miliki melalui sistem pre-order di Tokopedia. Berikut informasi dari “Andai ‘Ku Bukan Idola Box Set” :\n\n"
          "Tanggal mulai pre-order: 17 Februari 2026\n\n"
          "Harga: Rp295.000\n\n"
          "Isi :\n\n"
          "      1 buah NFC Keychain\n\n"
          "      1 buah Photobook\n\n"
          "      1 lembar Poster A4 dua sisi*\n\n"
          "      1 lembar Photo Print*\n\n"
          "      1 lembar Photo Print Lenticular*\n\n"
          "      2 lembar Photo Card*\n\n"
          "      1 lembar Postcard*\n\n"
          "Catatan:\n\n"
          "* Bersifat acak & tidak dapat memilih, menukar atau meminta member tertentu.\n\n",
      imageUrl: "",
    ),
  ];

  Color getCategoryColor(String category) {
    switch (category) {
      case "EVENT":
        return const Color(0xFF1565C0);
      case "THEATER":
        return const Color(0xFF8E24AA);
      case "GOODS":
        return const Color(0xFF2E7D32);
      default:
        return Colors.black87;
    }
  }

  /// ================= MAIN =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jktRed,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: selectedNews == null ? buildList() : buildDetail(selectedNews!),
      ),
    );
  }

  /// ================= LIST =================

  Widget buildList() {
    return SafeArea(
      key: const ValueKey("list"),
      child: Column(
        children: [
          /// HEADER MERAH JKT48
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: jktRed,
            child: const Text(
              "JKT48 News",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                letterSpacing: 2,
              ),
            ),
          ),

          /// CONTENT PUTIH
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: newsList.length,
                separatorBuilder: (_, __) =>
                    Divider(color: jktRed.withOpacity(0.3), thickness: 1),
                itemBuilder: (context, index) {
                  return buildCard(newsList[index], index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(News news, int index) {
    final color = getCategoryColor(news.category);
    final hover = hoveredIndex == index;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = null),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedNews = news;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// CATEGORY TAG
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                color: color,
                child: Text(
                  news.category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// TEXT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: hover ? jktRed : Colors.black87,
                      ),
                    ),
                    
                    const SizedBox(height: 6),

                    Text(
                      news.date,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
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

  /// ================= DETAIL =================

  Widget buildDetail(News news) {
    return SafeArea(
      key: const ValueKey("detail"),
      child: Column(
        children: [
          /// HEADER MERAH
          Container(
            color: jktRed,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      selectedNews = null;
                    });
                  },
                ),

                const Text(
                  "NEWS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          /// CONTENT PUTIH
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: ListView(
                children: [
                  Text(
                    news.category,
                    style: TextStyle(
                      color: getCategoryColor(news.category),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    news.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(news.date, style: const TextStyle(color: Colors.grey)),

                  const SizedBox(height: 20),

                  Text(
                    news.detail,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
