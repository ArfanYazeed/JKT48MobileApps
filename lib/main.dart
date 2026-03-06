import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;
import 'profile/profile.dart';
import 'jadwal/jadwal.dart';
import '../member/member.dart';
import 'shop-page.dart';
import 'fans.dart';
import 'news.dart';
import 'theater/theater.dart';
import 'package:jkt48/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JKT48 Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

// ================= MAIN PAGE (NAVIGATION CONTROLLER) =================
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Semua halaman
  final List<Widget> _pages = const [
    HomePage(),
    ProfilePage(), // sekarang tidak error lagi
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _pages[_selectedIndex], // halaman berubah di sini
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFD50000),
        unselectedItemColor: Colors.grey,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// ================= HOME PAGE (TANPA SCAFFOLD!) =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 8),
        BannerSlider(),
        SizedBox(height: 24),
        MenuGrid(),
        SizedBox(height: 24),
        NewsSection(),
        SizedBox(height: 30),
        TheaterMenuSection(),
        SizedBox(height: 30),
        VideoSection(),
        SizedBox(height: 30),
      ],
    );
  }
}

// ================= APP BAR =================
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      shadowColor: const Color.fromARGB(255, 14, 11, 11).withOpacity(0.2),
      backgroundColor: const Color(0xFFD50000),
      centerTitle: true,
      title: const Text(
        "JKT48 Official",
        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

// ================= BANNER SLIDER =================
class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  int currentIndex = 0;
  Timer? timer;

  final List<String> banners = [
    "asset/image/5.jpg",
    "asset/image/6.jpg",
    "asset/image/7.jpg",
    "asset/image/8.jpg",
    "asset/image/9.jpg",
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!mounted) return;
      currentIndex = (currentIndex + 1) % banners.length;
      _controller.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 190,
          child: PageView.builder(
            controller: _controller,
            physics: const PageScrollPhysics(),
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [Image.asset(banners[index], fit: BoxFit.cover)],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            banners.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 22 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentIndex == index ? Colors.red : Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ================= SECTION TITLE =================
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ================= MENU GRID =================
class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  final List<Map<String, dynamic>> menus = const [
    {"title": "News", "icon": Icons.article_rounded},
    {"title": "Schedule", "icon": Icons.calendar_month},
    {"title": "Members", "icon": Icons.groups_rounded},
    {"title": "Theater", "icon": Icons.theaters_rounded},
    {"title": "Shop", "icon": Icons.shopping_bag_rounded},
    {"title": "Fans Official", "icon": Icons.favorite_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menus.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final menu = menus[index];
          return InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () {
              switch (menu["title"]) {
                case "News":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewsPage()),
                  );
                  break;

                case "Schedule":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalPage()),
                  );
                  break;

                case "Members":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MemberPage()),
                  );
                  break;

                case "Theater":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TheaterPage(),
                    ),
                  );
                  break;

                case "Shop":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShopPage()
                    ),
                  );
                  break;

                case "Fans Official":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FansPage()
                    ),
                  );
                  break;
              }
            },
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(menu["icon"], size: 34, color: Colors.red),
                  const SizedBox(height: 10),
                  Text(
                    menu["title"],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= NEWS SECTION FINAL =================
class NewsSection extends StatelessWidget {
  NewsSection({super.key});

  final List<News> newsList = [
    News(
      category: "EVENT",
      date: "23 Februari 2026",
      title:
          "Pengumuman Mengenai JKT48 OFC Event “JKT48 Psychology Project: Discovering Our Love, Dream and Passion”",
      detail: "Detail lengkap event Psychology Project JKT48...",
      imageUrl: "",
    ),
    News(
      category: "THEATER",
      date: "20 Februari 2026",
      title: "Pengumuman Mengenai Ramadhan Charity Donation 2026",
      detail: "Detail charity donation...",
      imageUrl: "",
    ),
    News(
      category: "OTHER",
      date: "17 Februari 2026",
      title: "Pengumuman Mengenai Aktivitas Gendis Mayrannisa di JKT48",
      detail: "Detail aktivitas Gendis...",
      imageUrl: "",
    ),
    News(
      category: "THEATER",
      date: "16 Februari 2026",
      title:
          "Pengumuman Mengenai Aktivitas JKT48 Theater Selama Bulan Ramadan 2026",
      detail: "Detail aktivitas theater Ramadan...",
      imageUrl: "",
    ),
  ];

  Color getCategoryColor(String category) {
    switch (category) {
      case "EVENT":
        return const Color(0xFF2F5D8C);
      case "THEATER":
        return const Color(0xFF8E44AD);
      case "OTHER":
        return Colors.black;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF2F2F2),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// TITLE
          const Text(
            "NEWS",
            style: TextStyle(
              color: Colors.red,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 30),

          /// NEWS LIST
          Column(
            children: newsList.map((news) {
              final color = getCategoryColor(news.category);

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NewsPage(initialNews: news),
                    ),
                  );
                },
                child: Column(
                  children: [
                    /// CATEGORY + DATE
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(4),
                          ),
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

                        Text(
                          news.date,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// TITLE
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        news.title,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 1.4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// RED LINE
                    Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.red, width: 1),
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 10),

          /// CHECK ALL BUTTON
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NewsPage()),
              );
            },
            child: const Text(
              "Check All >",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class TheaterMenuSection extends StatelessWidget {
  const TheaterMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //  BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset("asset/image/2.jpg", fit: BoxFit.cover),
          ),

          // DARK OVERLAY (biar teks lebih jelas)
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),

          // TOMBOL DI TENGAH
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TheaterPage()),
                );
              },
              child: Container(
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Text(
                  "Apa Itu Theater JKT48 >",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoSection extends StatefulWidget {
  const VideoSection({super.key});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  int currentIndex = 0;

  final List<String> videos = [
    "axdKwZcayuA",
    "HTTOAl8mMjE",
    "aOgTX9-crmg",
    "rzpltLtgMe4",
    "zCcCtvbYf1M",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "VIDEO",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.red,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 20),

        // 🎬 CAROUSEL VIDEO (SWIPE MANUAL)
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pageController,
            itemCount: videos.length,
            physics: const BouncingScrollPhysics(), // bisa swipe manual
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              return AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: currentIndex == index ? 0 : 10,
                ),
                child: YoutubeCard(videoId: videos[index]),
              );
            },
          ),
        ),

        const SizedBox(height: 14),

        // 🔴 DOT INDICATOR (BISA DIKLIK)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            videos.length,
            (index) => GestureDetector(
              onTap: () {
                // pindah page saat dot dipencet
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: currentIndex == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentIndex == index ? Colors.red : Colors.grey[400],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class YoutubeCard extends StatelessWidget {
  final String videoId;
  const YoutubeCard({super.key, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final String viewType = 'youtube-$videoId';

    if (kIsWeb) {
      // Register iframe YouTube (WEB ONLY)
      ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
        final iframe = html.IFrameElement()
          ..src = "https://www.youtube.com/embed/$videoId"
          ..style.border = '0'
          ..allow =
              'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture'
          ..allowFullscreen = true
          ..style.width = '100%'
          ..style.height = '100%';

        return iframe;
      });

      return Container(
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: HtmlElementView(viewType: viewType),
        ),
      );
    } else {
      // Fallback Android/iOS
      return Container(
        width: 320,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Text("YouTube hanya aktif di Web"),
      );
    }
  }
}
