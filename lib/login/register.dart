import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../profile/profile.dart';
import '../auth/session.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final idController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final postalController = TextEditingController();
  final birthController = TextEditingController();
  final namaLengkapController = TextEditingController();
  final namaPanggilanController = TextEditingController();
  final tanggalLahirController = TextEditingController();

  bool isPasswordHidden = true;
  String selectedGender = "Pria";
  String selectedOshi = "JKT48: Abigail Rachel";

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      birthController.text = DateFormat('dd MMMM yyyy').format(picked);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    namaLengkapController.dispose();
    namaPanggilanController.dispose();
    tanggalLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE60023), Color(0xFFFF758F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// HEADER
                const SizedBox(height: 10),
                const Text(
                  "Pendaftaran Anggota",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Daftar sekarang dan jadi bagian dari komunitas!",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 25),

                /// CARD FORM
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSection("Informasi Login"),

                        buildTextField(
                          controller: emailController,
                          label: "Alamat Email",
                          icon: Icons.email_outlined,
                        ),

                        buildPasswordField(),

                        const SizedBox(height: 20),

                        buildSection("Informasi User"),

                        buildTextField(
                          controller: nameController,
                          label: "Nama Lengkap",
                          icon: Icons.person_outline,
                        ),

                        buildTextField(
                          controller: nicknameController,
                          label: "Nama Panggilan",
                          icon: Icons.badge_outlined,
                        ),

                        buildDateField(),

                        buildDropdown(),

                        buildGender(),

                        buildTextField(
                          controller: addressController,
                          label: "Alamat",
                          icon: Icons.home_outlined,
                        ),

                        buildTextField(
                          controller: cityController,
                          label: "Kota / Provinsi",
                          icon: Icons.location_city_outlined,
                        ),

                        buildTextField(
                          controller: phoneController,
                          label: "Nomor Handphone",
                          icon: Icons.phone_outlined,
                        ),

                        const SizedBox(height: 25),

                        /// BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Session.isLogin = true;
                                Session.namaLengkap =
                                    namaLengkapController.text;
                                Session.email = emailController.text;

                                Navigator.pop(context, {
                                  'name': nameController.text,
                                  'email': emailController.text,
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Registrasi berhasil"),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                Navigator.pop(context); // kembali ke profile
                              }
                            },
                            child: const Text(
                              "Konfirmasi",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ===== COMPONENT =====

  Widget buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFE60023),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFFE60023)),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFE60023)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: passwordController,
        obscureText: isPasswordHidden,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFE60023)),
          labelText: "Kata Sandi",
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordHidden ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget buildDateField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: birthController,
        readOnly: true,
        onTap: pickDate,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.calendar_today,
            color: Color(0xFFE60023),
          ),
          labelText: "Tanggal Lahir",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget buildDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField(
        value: selectedOshi,
        decoration: InputDecoration(
          labelText: "Oshimen",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        items: const [
          DropdownMenuItem(
            value: "JKT48: Abigail Rachel",
            child: Text("JKT48: Abigail Rachel"),
          ),
          DropdownMenuItem(value: "JKT48: Freya", child: Text("JKT48: Freya")),
        ],
        onChanged: (value) {
          setState(() {
            selectedOshi = value!;
          });
        },
      ),
    );
  }

  Widget buildGender() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          const Text("Jenis Kelamin: "),
          Radio(
            value: "Pria",
            groupValue: selectedGender,
            activeColor: const Color(0xFFE60023),
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          const Text("Pria"),
          Radio(
            value: "Wanita",
            groupValue: selectedGender,
            activeColor: const Color(0xFFE60023),
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          const Text("Wanita"),
        ],
      ),
    );
  }
}