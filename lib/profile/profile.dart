import 'package:flutter/material.dart';
import '../login/login.dart';
import '../login/register.dart';
import 'package:intl/intl.dart';
import '../auth/session.dart';
import 'riwayat_pembelian.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Status login sementara

  // Set user setelah login/register
  void setUser(String userName, String userEmail) {
    setState(() {
      Session.isLogin = true;
      Session.namaLengkap = userName;
      Session.email = userEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFD32F2F), Color(0xFFFF5252)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        "Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Card putih
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Session.isLogin
                        ? _buildProfileView()
                        : _buildGuestView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Tampilan jika sudah login
  Widget _buildProfileView() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFD32F2F),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),

          Text(
            Session.namaLengkap,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(Session.email, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 30),

          // Logout Button
          SizedBox(
            width: 150,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD32F2F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 4,
              ),
              onPressed: () {
                setState(() {
                  Session.isLogin = false;
                  Session.namaLengkap = "";
                  Session.email = "";
                });
              },
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// ===== FITUR TAMBAHAN =====
          // Riwayat Pembelian

          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.red),
              title: const Text(
                "Riwayat Pembelian",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text("Lihat semua transaksi"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RiwayatPembelianPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Tampilan jika belum login
  Widget _buildGuestView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.person_off, size: 100, color: Color(0xFFD32F2F)),
        const SizedBox(height: 16),
        const Text(
          "Anda belum memiliki akun",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          "Silakan daftar atau login terlebih dahulu",
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),

        // Register Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
            ),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const RegisterPage()),
              );

              if (result != null && mounted) {
                setUser(result['name'], result['email']);
              }
            },
            child: const Text(
              "Register",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        const SizedBox(height: 15),

        // Login Button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFD32F2F), width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );

              if (result != null && mounted) {
                setUser(result['name'], result['email']);
              }
            },
            child: const Text(
              "Login",
              style: TextStyle(color: Color(0xFFD32F2F)),
            ),
          ),
        ),
      ],
    );
  }
}