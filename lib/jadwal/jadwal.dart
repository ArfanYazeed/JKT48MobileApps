import 'package:flutter/material.dart';
import '../event/event_detail.dart';

class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  // Data event
  final Map<int, List<Map<String, String>>> events = const {
    1: [
      {"type": "JKT48", "time": "16:00", "title": "Cara Meminum Ramune"},
      {"type": "EVENT", "time": "", "title": "Swara Semesta Tulungagung"},
    ],
    5: [
      {"type": "JKT48", "time": "19:00", "title": "Pertaruhan Cinta"},
    ],
    6: [
      {"type": "JKT48", "time": "19:00", "title": "Cara Meminum Ramune"},
    ],
    7: [
      {"type": "EVENT", "time": "", "title": "AIEROFEST 2026"},
      {
        "type": "JKT48",
        "time": "16:00",
        "title": "Sambil Menggandeng Erat Tanganku",
      },
    ],
    8: [
      {"type": "JKT48", "time": "19:00", "title": "Cara Meminum Ramune"},
    ],
    12: [
      {
        "type": "JKT48",
        "time": "19:00",
        "title": "Sambil Menggandeng Erat Tanganku",
      },
    ],
    13: [
      {"type": "JKT48", "time": "19:00", "title": "Pertaruhan Cinta"},
    ],
    14: [
      {
        "type": "JKT48",
        "time": "19:00",
        "title": "Sambil Menggandeng Erat Tanganku",
      },
    ],
    15: [
      {"type": "JKT48", "time": "19:00", "title": "Pertaruhan Cinta"},
    ],
    16: [
      {"type": "JKT48", "time": "19:00", "title": "Cara Meminum Ramune"},
    ],
    21: [
      {"type": "EVENT", "time": "", "title": "Z VS ALPHA"},
    ],
    22: [
      {"type": "EVENT", "time": "", "title": "AIEROFEST 2026"},
    ],
    26: [
      {"type": "EVENT", "time": "", "title": "AIEROFEST 2026"},
    ],
    27: [
      {"type": "EVENT", "time": "", "title": "AIEROFEST 2026"},
    ],
    28: [
      {"type": "EVENT", "time": "", "title": "AIEROFEST 2026"},
    ],
  };

  // Nama hari
  String getDayName(int date) {
    const days = [
      "Minggu",
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jumat",
      "Sabtu",
    ];
    return days[(date - 1) % 7];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Schedule"),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Header bulan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ],
              ),
            ),
            child: const Center(
              child: Text(
                "Februari 2026",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // List tanggal
          Expanded(
            child: ListView.builder(
              itemCount: 28,
              itemBuilder: (context, index) {
                int date = index + 1;
                List<Map<String, String>> dayEvents = events[date] ?? [];

                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kolom kiri (Tanggal)
                      Container(
                        width: 70,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              getDayName(date),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "$date",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Kolom kanan (Event)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: dayEvents.isEmpty
                              ? const SizedBox(height: 40)
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: dayEvents.map((event) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Badge
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: event["type"] == "JKT48"
                                                  ? Colors.red
                                                  : Colors.blueGrey,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              event["type"]!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 10),

                                          // Judul event (BISA DIKLIK)
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        EventDetailPage(
                                                          title:
                                                              event["title"]!,
                                                          type: event["type"]!,
                                                          time:
                                                              event["time"] ??
                                                              "",
                                                          date: date.toString(),
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                event["time"]!.isEmpty
                                                    ? event["title"]!
                                                    : "${event["time"]} ${event["title"]}",
                                                style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
