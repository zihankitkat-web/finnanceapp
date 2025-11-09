import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // buat ikon tambahan (iOS style)

class AtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String balance;
  final Color color1;
  final Color color2;
  final String? logoPath;

  const AtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.balance,
    required this.color1,
    required this.color2,
    this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    // Warna khas placeholder
    final Map<String, Color> placeholderColors = {
      'BCA': const Color(0xFF1E40AF),
      'BRI': const Color(0xFF003B6F),
      'BJB': const Color(0xFF0047AB),
      'Mandiri': const Color(0xFF003399),
    };

    // Ikon modern per bank
    final Map<String, IconData> placeholderIcons = {
      'BCA': CupertinoIcons.creditcard_fill,
      'BRI': Icons.account_balance_wallet_rounded,
      'BJB': Icons.account_balance_rounded,
      'Mandiri': Icons.credit_card_rounded,
    };

    final bankKey = bankName.split(' ').last;

    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(2, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ==== Logo dan Nama Bank ====
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ==== Jika ada logo gambar ====
              if (logoPath != null)
                Image.asset(
                  logoPath!,
                  height: 40,
                  width: 60,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Gambar tidak ditemukan → tampilkan placeholder icon
                    return _buildIconPlaceholder(
                        bankKey, placeholderColors, placeholderIcons);
                  },
                )
              else
                // ==== Kalau logoPath null → tampilkan placeholder icon ====
                _buildIconPlaceholder(
                    bankKey, placeholderColors, placeholderIcons),

              // ==== Nama Bank ====
              Text(
                bankName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // ==== Saldo ====
          Text(
            balance,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          // ==== Nomor Kartu ====
          Text(
            cardNumber,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // ==== Placeholder pakai ikon modern ====
  Widget _buildIconPlaceholder(String bankKey,
      Map<String, Color> colors, Map<String, IconData> icons) {
    final color = colors[bankKey] ?? Colors.grey;
    final icon = icons[bankKey] ?? Icons.credit_card;

    return CircleAvatar(
      radius: 20,
      backgroundColor: color.withOpacity(0.9),
      child: Icon(
        icon,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}
