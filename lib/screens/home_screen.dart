import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../widgets/atm_card.dart';
import '../models/transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Finance Mate'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.9),
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFF8E1), // krem lembut
              Color(0xFFFFE0E9), // pink muda
              Color(0xFFE1BEE7), // ungu pastel
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== My Cards =====
              FadeInDown(
                duration: const Duration(milliseconds: 700),
                child: const Text(
                  'My Cards',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              // ===== Bank Cards =====
              FadeInRight(
                duration: const Duration(milliseconds: 800),
                child: SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      HeroAtmCard(
                        bankName: 'Bank BCA',
                        cardNumber: '**** 6699',
                        balance: 'Rp862.700.000',
                        color1: Color(0xFF0033A0),
                        color2: Color(0xFF0070C0),
                      ),
                      HeroAtmCard(
                        bankName: 'Bank BRI',
                        cardNumber: '**** 9876',
                        balance: 'Rp79.350.765',
                        color1: Color(0xFF003B6F),
                        color2: Color(0xFFFF8C00),
                      ),
                      HeroAtmCard(
                        bankName: 'Bank BJB',
                        cardNumber: '**** 7425',
                        balance: 'Rp427.874.000',
                        color1: Color(0xFF0047AB),
                        color2: Color(0xFF00B4D8),
                      ),
                      HeroAtmCard(
                        bankName: 'Bank Mandiri',
                        cardNumber: '**** 5463',
                        balance: 'Rp69.500.764',
                        color1: Color(0xFF002060),
                        color2: Color(0xFFFFC107),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ===== Categories =====
              FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              BounceInUp(
                duration: const Duration(milliseconds: 900),
                child: SizedBox(
                  height: 95,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      AnimatedMenuItem(
                        label: 'Health',
                        icon: Icons.favorite_rounded,
                        bgColor: Color(0xFFE1F5FE),
                        iconColor: Color(0xFF0288D1),
                      ),
                      AnimatedMenuItem(
                        label: 'Travel',
                        icon: Icons.flight_takeoff_rounded,
                        bgColor: Color(0xFFE8F5E9),
                        iconColor: Color(0xFF2E7D32),
                      ),
                      AnimatedMenuItem(
                        label: 'Food',
                        icon: Icons.fastfood_rounded,
                        bgColor: Color(0xFFFFF3E0),
                        iconColor: Color(0xFFF57C00),
                      ),
                      AnimatedMenuItem(
                        label: 'Event',
                        icon: Icons.celebration_rounded,
                        bgColor: Color(0xFFF3E5F5),
                        iconColor: Color(0xFF6A1B9A),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ===== Recent Transactions =====
              FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: const Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),

              Column(
                children: List.generate(transactions.length, (index) {
                  final t = transactions[index];
                  IconData icon;
                  Color iconColor;

                  switch (t.category) {
                    case 'Food':
                      icon = Icons.local_cafe_rounded;
                      iconColor = Colors.brown;
                      break;
                    case 'Travel':
                      icon = Icons.directions_car_rounded;
                      iconColor = Colors.teal;
                      break;
                    case 'Health':
                      icon = Icons.fitness_center_rounded;
                      iconColor = Colors.redAccent;
                      break;
                    case 'Event':
                      icon = Icons.movie_rounded;
                      iconColor = Colors.deepPurple;
                      break;
                    case 'Income':
                      icon = Icons.attach_money_rounded;
                      iconColor = Colors.green;
                      break;
                    default:
                      icon = Icons.account_balance_wallet_rounded;
                      iconColor = Colors.blueGrey;
                  }

                  return SlideInUp(
                    duration: Duration(milliseconds: 400 + index * 100),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(2, 3),
                          ),
                        ],
                        border: Border.all(color: Colors.white.withOpacity(0.4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Pulse(
                                infinite: true,
                                duration: const Duration(seconds: 4),
                                child: CircleAvatar(
                                  backgroundColor: iconColor.withOpacity(0.15),
                                  radius: 20,
                                  child: Icon(icon, color: iconColor),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    t.category,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            t.amount,
                            style: TextStyle(
                              color: t.amount.startsWith('-')
                                  ? Colors.redAccent
                                  : Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==== Animated Menu Item ====
class AnimatedMenuItem extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  const AnimatedMenuItem({
    super.key,
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  State<AnimatedMenuItem> createState() => _AnimatedMenuItemState();
}

class _AnimatedMenuItemState extends State<AnimatedMenuItem>
    with SingleTickerProviderStateMixin {
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = 0.9),
      onTapUp: (_) => setState(() => scale = 1.0),
      onTapCancel: () => setState(() => scale = 1.0),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 150),
        child: Container(
          width: 85,
          margin: const EdgeInsets.only(right: 14),
          child: Column(
            children: [
              ZoomIn(
                duration: const Duration(milliseconds: 600),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: widget.bgColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Icon(widget.icon, color: widget.iconColor, size: 26),
                ),
              ),
              const SizedBox(height: 6),
              Text(widget.label,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}

// ==== Hero Atm Card ====
class HeroAtmCard extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String balance;
  final Color color1;
  final Color color2;

  const HeroAtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.balance,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: bankName,
      child: FadeInRight(
        duration: const Duration(milliseconds: 700),
        child: AtmCard(
          bankName: bankName,
          cardNumber: cardNumber,
          balance: balance,
          color1: color1,
          color2: color2,
        ),
      ),
    );
  }
}
