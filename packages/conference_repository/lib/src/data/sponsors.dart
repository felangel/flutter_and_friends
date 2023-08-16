import 'package:conference_repository/conference_repository.dart';

const platinumSponsors = [
  appShack,
  hackBerry,
];

const goldSponsors = [
  invertase,
  skandia,
  dcm,
];

const silverSponsors = [
  flutter,
  tide,
  leanCode,
  appwrite,
];

const bronzeSponsors = [
  serverpod,
  blueFire,
  done,
];

const appShack = Sponsor(
  logo: 'appshack.png',
  url: 'https://appshack.se',
  tier: Tier.platinum,
);

const hackBerry = Sponsor(
  logo: 'hackberry.png',
  url: 'https://hackberry.se',
  tier: Tier.platinum,
);

const invertase = Sponsor(
  logo: 'invertase.png',
  url: 'https://invertase.io',
  tier: Tier.gold,
);

const skandia = Sponsor(
  logo: 'skandia.png',
  url: 'https://skandia.se',
  tier: Tier.gold,
);

const dcm = Sponsor(
  logo: 'dcm.png',
  url: 'https://dcm.dev',
  tier: Tier.gold,
);

const flutter = Sponsor(
  logo: 'flutter.png',
  url: 'https://flutter.dev',
  tier: Tier.silver,
);

const tide = Sponsor(
  logo: 'tide.png',
  url: 'https://tide.co',
  tier: Tier.silver,
);

const leanCode = Sponsor(
  logo: 'leancode.png',
  url: 'https://leancode.co',
  tier: Tier.silver,
);

const appwrite = Sponsor(
  logo: 'appwrite.png',
  url: 'https://appwrite.io',
  tier: Tier.silver,
);

const serverpod = Sponsor(
  logo: 'serverpod.png',
  url: 'https://serverpod.dev',
  tier: Tier.bronze,
);

const blueFire = Sponsor(
  logo: 'bluefire.png',
  url: 'https://opencollective.com/blue-fire',
  tier: Tier.bronze,
);

const done = Sponsor(
  logo: 'done.png',
  url: 'https://doneservices.se',
  tier: Tier.bronze,
);
