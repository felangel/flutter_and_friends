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
  logo: 'https://i.ibb.co/zZbjS8s/appshack.png',
  url: 'https://appshack.se',
  tier: Tier.platinum,
);

const hackBerry = Sponsor(
  logo:
      'https://images.confetticdn.com/images/scale/w_1000,f_auto/event-59448/image-28ae9031-6a2f-41f7-8246-dfa54579757c/hackberry.png',
  url: 'https://hackberry.se',
  tier: Tier.platinum,
);

const invertase = Sponsor(
  logo:
      'https://images.confetticdn.com/images/scale/w_1000,f_auto/event-59448/image-3465602d-b555-4d56-ab91-ddf962d303bd/Logo-3-.png',
  url: 'https://invertase.io',
  tier: Tier.gold,
);

const skandia = Sponsor(
  logo: 'https://i.ibb.co/r6Fw64g/skandia.png',
  url: 'https://skandia.se',
  tier: Tier.gold,
);

const dcm = Sponsor(
  logo: 'https://i.ibb.co/yByVZ84/dcm.png',
  url: 'https://dcm.dev',
  tier: Tier.gold,
);

const flutter = Sponsor(
  logo:
      'https://images.confetticdn.com/images/scale/w_1000,f_auto/event-59448/image-9ca1de1c-0046-4e22-ac86-568d490cb138/flutter_logo.png',
  url: 'https://flutter.dev',
  tier: Tier.silver,
);

const tide = Sponsor(
  logo: 'https://i.ibb.co/rdmhG4m/tide.png',
  url: 'https://tide.co',
  tier: Tier.silver,
);

const leanCode = Sponsor(
  logo:
      'https://images.confetticdn.com/images/scale/w_1000,f_auto/event-59448/image-7fdb57dd-c189-46bc-82e1-b4dd7a6becaf/leancode-removebg-preview.png',
  url: 'https://leancode.co',
  tier: Tier.silver,
);

const appwrite = Sponsor(
  logo: 'https://i.ibb.co/4PRcDYK/appwrite.png',
  url: 'https://appwrite.io',
  tier: Tier.silver,
);

const serverpod = Sponsor(
  logo: 'https://i.ibb.co/R0jjp9X/serverpod.png',
  url: 'https://serverpod.dev',
  tier: Tier.bronze,
);

const blueFire = Sponsor(
  logo:
      'https://images.confetticdn.com/images/scale/w_1000,f_auto/event-59448/image-65967b2c-e1c4-4e74-894d-55406d5a49b3/logotype.png',
  url: 'https://opencollective.com/blue-fire',
  tier: Tier.bronze,
);

const done = Sponsor(
  logo:
      'https://images.confetticdn.com/images/scale/w_1000,f_auto/event-59448/image-2148fd45-1793-455c-b4e9-9b582f522c49/logo-purple.png',
  url: 'https://doneservices.se',
  tier: Tier.bronze,
);
