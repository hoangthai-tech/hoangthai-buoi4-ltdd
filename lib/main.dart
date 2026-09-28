import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 390),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1. TopBar (Row: MainAxisAlignment.spaceBetween | w: 336, h: 42)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 16,
                          color: Color(0xFF334155),
                        ),
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Icon(
                          Icons.share_outlined,
                          size: 18,
                          color: Color(0xFF334155),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // 2. Profile Header (Column: CrossAxisAlignment.center | h: 241)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Gradient Ring: 140x140 | #FFB088 -> #FF8080 -> #FFCF71
                      Container(
                        width: 140,
                        height: 140,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFFB088),
                              Color(0xFFFF8080),
                              Color(0xFFFFCF71),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      // White Border: 132x132
                      Container(
                        width: 132,
                        height: 132,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Avatar: 124x124 (lấy từ assets máy)
                      ClipOval(
                        child: SizedBox(
                          width: 124,
                          height: 124,
                          child: Image.asset(
                            'assets/images/images.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Image.asset(
                              'assets/images/avatar.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: const Color(0xFFCBD5E1),
                                child: const Icon(Icons.person, size: 60, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Verified Badge: 28x28 | Blue #0284C7
                      Positioned(
                        bottom: 4,
                        right: 8,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Color(0xFF0284C7),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Tên: 24px w700/w800 #0F172A
                  const Text(
                    'Alex Rivers',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Node 19:25: 'Lead Mobile Engineer' | 15px w500 | #64748B
                  const Text(
                    'Lead Mobile Engineer',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Location Pill: Radius 20 | #F1F5F9 | h: 30
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.place_outlined,
                          size: 14,
                          color: Color(0xFF64748B),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Tokyo, Japan',
                          style: TextStyle(
                            color: Color(0xFF475569),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 3. Stats Card (Radius 20 | BoxShadow 0 8 18 | w: 336, h: 78)
                  Container(
                    height: 78,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCol('148', 'Projects'),
                        Container(width: 1, height: 28, color: const Color(0xFFE2E8F0)),
                        _buildStatCol('9 Yrs', 'Experience'),
                        Container(width: 1, height: 28, color: const Color(0xFFE2E8F0)),
                        _buildStatCol('4.9 ★', 'Rating', isGold: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // 4. About Me (Heading 17px Bold, Body 14px Regular | Line-height 21px)
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant architecture, intuitive UX, and design systems.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 21 / 14,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 5. Skills & Expertise (Column > 2 Rows | h: 32 per chip)
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Skills & Expertise',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Row 1: Flutter, Dart, Clean Arch
                  Row(
                    children: [
                      _buildSkillChip(
                        icon: Icons.brush_outlined,
                        label: 'Flutter',
                        bgColor: const Color(0xFFE0F2FE),
                        textColor: const Color(0xFF0284C7),
                      ),
                      const SizedBox(width: 8),
                      _buildSkillChip(
                        icon: Icons.code_rounded,
                        label: 'Dart',
                        bgColor: const Color(0xFFDCFCE7),
                        textColor: const Color(0xFF16A34A),
                      ),
                      const SizedBox(width: 8),
                      _buildSkillChip(
                        icon: Icons.layers_outlined,
                        label: 'Clean Arch',
                        bgColor: const Color(0xFFFFE4E6),
                        textColor: const Color(0xFFE11D48),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Row 2: UI/UX, Firebase
                  Row(
                    children: [
                      _buildSkillChip(
                        icon: Icons.palette_outlined,
                        label: 'UI/UX',
                        bgColor: const Color(0xFFF3E8FF),
                        textColor: const Color(0xFF9333EA),
                      ),
                      const SizedBox(width: 8),
                      _buildSkillChip(
                        icon: Icons.local_fire_department_outlined,
                        label: 'Firebase',
                        bgColor: const Color(0xFFFEF3C7),
                        textColor: const Color(0xFFD97706),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // 6. Featured Projects (Row: 2 Expanded Cards | 165x145 | Radius 16)
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Featured Projects',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: _buildProjectCard(
                          imageAssetPath: 'assets/images/project1.png',
                          fallbackUrl: 'https://images.unsplash.com/photo-1578916171728-46686eac8d58?w=500',
                          title: 'E-Shop Flutter',
                          subtitle: 'Mobile App • 2026',
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _buildProjectCard(
                          imageAssetPath: 'assets/images/project2.png',
                          fallbackUrl: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=500',
                          title: 'Crypto Vault',
                          subtitle: 'Finance • Clean Arch',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // 7. Contact Card (Radius 20 | Shadow 0 4 12 | w: 336, h: 192)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildContactRow(
                          icon: Icons.alternate_email_rounded,
                          title: 'Contact Information',
                          isBold: true,
                        ),
                        const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
                        _buildContactRow(
                          icon: Icons.mail_outline_rounded,
                          title: 'alex.rivers@email.com',
                          isBold: false,
                        ),
                        const Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
                        _buildContactRow(
                          icon: Icons.phone_outlined,
                          title: '+81 (90) 1234-5678',
                          isBold: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets chuẩn xác theo Figma API ---

  static Widget _buildStatCol(String val, String label, {bool isGold = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          val,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: isGold ? const Color(0xFFEAB308) : const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }

  static Widget _buildSkillChip({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildProjectCard({
    required String imageAssetPath,
    required String fallbackUrl,
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageAssetPath,
              height: 85,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.network(
                fallbackUrl,
                height: 85,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 85,
                  color: const Color(0xFFE2E8F0),
                  child: const Icon(Icons.image_outlined, color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildContactRow({
    required IconData icon,
    required String title,
    required bool isBold,
  }) {
    return SizedBox(
      height: 62,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 18,
                color: isBold ? const Color(0xFF0F172A) : const Color(0xFF64748B),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
                  color: isBold ? const Color(0xFF0F172A) : const Color(0xFF334155),
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: Color(0xFFCBD5E1),
            ),
          ],
        ),
      ),
    );
  }
}
