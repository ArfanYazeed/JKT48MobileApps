class RiwayatPembelian {
  final String event;
  final String tipeTiket;
  final int jumlah;
  final String metode;
  final int total;
  final DateTime tanggal;
  final List<int> kursi;

  RiwayatPembelian({
    required this.event,
    required this.tipeTiket,
    required this.jumlah,
    required this.metode,
    required this.total,
    required this.tanggal,
    required this.kursi,
  });
}