class Club {
  final String name;
  final String college;
  final String logo;

  const Club({
    required this.name,
    required this.college,
    this.logo = 'assets/logos/clubs/istelogo.png',
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      name: json['name'] as String,
      college: json['college'] as String,
      logo: json['logo'] as String? ?? 'assets/logos/clubs/istelogo.png',
    );
  }
}

