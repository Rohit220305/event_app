import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Future: accept user model via constructor

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = 'Rohit Mhetre';
    final email = 'rohit.mhetre@email.com';
    const imagePath = 'assets/images/profile/rohit_photo.jpg';

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              Center(
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: theme.colorScheme.surfaceVariant,
                  child: ClipOval(
                    child: SizedBox(
                      width: 110,
                      height: 110,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback to initials if asset not found
                          return Container(
                            color: theme.colorScheme.surfaceVariant,
                            alignment: Alignment.center,
                            child: Text(
                              _initials(name),
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Name
              Text(
                name,
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),

              // Email
              Text(
                email,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 18),

              Divider(color: theme.dividerColor, thickness: 1),

              const SizedBox(height: 16),

              // Options list
              Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    _buildTile(context, icon: Icons.edit, title: 'Edit Profile', onTap: () {}),
                    _buildTile(context, icon: Icons.group, title: 'My Clubs', onTap: () {}),
                    _buildTile(context, icon: Icons.card_membership, title: 'My Certificates', onTap: () {}),
                    _buildTile(context, icon: Icons.settings, title: 'Settings', onTap: () {}),
                    _buildTile(
                      context,
                      icon: Icons.logout,
                      title: 'Logout',
                      isLogout: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  static String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    final first = parts.first.isNotEmpty ? parts.first[0] : '';
    final last = parts.length > 1 && parts.last.isNotEmpty ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }

  Widget _buildTile(BuildContext context, {required IconData icon, required String title, bool isLogout = false, VoidCallback? onTap}) {
    final theme = Theme.of(context);
    final color = isLogout ? theme.colorScheme.error : theme.colorScheme.primary;
    final textStyle = isLogout ? TextStyle(color: theme.colorScheme.error) : null;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
      leading: Icon(icon, color: color),
      title: Text(title, style: textStyle),
      trailing: Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
      onTap: onTap,
    );
  }
}
