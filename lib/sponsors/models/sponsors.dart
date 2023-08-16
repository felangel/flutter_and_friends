enum Tier {
  platinum,
  gold,
  silver,
  bronze,
}

class Sponsor {
  const Sponsor({
    required this.logo,
    required this.url,
    required this.tier,
  });

  final String logo;
  final String url;
  final Tier tier;
}
