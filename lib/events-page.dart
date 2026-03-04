import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: const [
        // ===== HEADER =====
        Text(
          "Official Events",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Event yang sedang berlangsung & akan datang",
          style: TextStyle(color: Colors.grey),
        ),

        SizedBox(height: 24),

        // ===== ONGOING EVENTS =====
        SectionTitle(title: "Sedang Berlangsung"),
        SizedBox(height: 12),

        EventCard(
          title: "JKT48 Theater Show",
          date: "1 - 28 Maret 2026",
          location: "JKT48 Theater",
          image: "asset/image/2.jpg",
          status: EventStatus.ongoing,
        ),

        SizedBox(height: 24),

        // ===== UPCOMING EVENTS =====
        SectionTitle(title: "Akan Datang"),
        SizedBox(height: 12),

        EventCard(
          title: "JKT48 Summer Concert 2026",
          date: "12 Maret 2026",
          location: "Jakarta Convention Center",
          image: "asset/image/1.jpg",
          status: EventStatus.upcoming,
        ),
        SizedBox(height: 16),

        EventCard(
          title: "Special Fan Meeting",
          date: "5 April 2026",
          location: "Bandung Hall",
          image: "asset/image/3.jpg",
          status: EventStatus.upcoming,
        ),
      ],
    );
  }
}

// ================= STATUS ENUM =================
enum EventStatus { ongoing, upcoming }

// ================= SECTION TITLE =================
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            color: const Color(0xFFD50000),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ================= EVENT CARD (UPGRADED) =================
class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String image;
  final EventStatus status;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.image,
    required this.status,
  });

  Color getStatusColor() {
    switch (status) {
      case EventStatus.ongoing:
        return Colors.green;
      case EventStatus.upcoming:
        return const Color(0xFFD50000);
    }
  }

  String getStatusText() {
    switch (status) {
      case EventStatus.ongoing:
        return "LIVE";
      case EventStatus.upcoming:
        return "UPCOMING";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== IMAGE + STATUS BADGE =====
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // STATUS BADGE (LIVE / UPCOMING)
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: getStatusColor(),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    getStatusText(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ===== EVENT DETAILS =====
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Date
                Row(
                  children: [
                    const Icon(Icons.calendar_month,
                        size: 18, color: Color(0xFFD50000)),
                    const SizedBox(width: 6),
                    Text(date),
                  ],
                ),

                const SizedBox(height: 6),

                // Location
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 18, color: Color(0xFFD50000)),
                    const SizedBox(width: 6),
                    Expanded(child: Text(location)),
                  ],
                ),

                const SizedBox(height: 16),

                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD50000),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      // nanti bisa ke detail event / tiket
                    },
                    child: const Text(
                      "Lihat Detail Event",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}