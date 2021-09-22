import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l2t_beta/home/widgets/widgets.dart';
import 'package:l2t_beta/home/widgets/page_details.dart';

class Home extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: Home());

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _beaches = [
    Beach(builder: (context) => const IntroHero()),
    Beach(builder: (context) => const FirstSection()),
    Beach(builder: (context) => const SecondSection()),
    Beach(builder: (context) => const ThirdSection()),
    Beach(builder: (context) => const FourthSection()),
  ];

  final _coastController = CoastController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Coast(
        scrollDirection: Axis.vertical,
        beaches: _beaches,
        controller: _coastController,
        observers: [
          CrabController(),
        ],
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

class IntroHero extends StatefulWidget {
  const IntroHero({Key? key}) : super(key: key);

  @override
  State<IntroHero> createState() => _IntroHeroState();
}

class _IntroHeroState extends State<IntroHero> {
  Image? l2t;

  @override
  void initState() {
    super.initState();
    l2t = Image.asset('assets/logo/1.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(l2t!.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xffF7F9FF),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Crab(
              tag: 'container',
              child: Container(
                height: 300,
                width: 500,
                child: l2t,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Text('Bring your vision to life',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline1!
                      .copyWith(fontSize: 50)),
            )
          ],
        ),
      ),
    );
  }
}

class FirstSection extends StatefulWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  Image? line;
  Image? l2t;

  @override
  void initState() {
    super.initState();
    l2t = Image.asset('assets/logo/2.png');
    line = Image.asset('assets/homepage_lines/1.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(line!.image, context);
    precacheImage(l2t!.image, context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: const Color(0xffF7F9FF),
          child: Padding(
            padding: EdgeInsets.symmetric(
              //dynamic gutters
              horizontal: (MediaQuery.of(context).size.width / 12 + 48),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Crab(
                      flightShuttleBuilder: textFlightShuttleBuilder,
                      tag: 'container',
                      child: Container(
                        height: 100,
                        width: 300,
                        child: Image.asset('assets/logo/2.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text('Serve',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(fontSize: 50)),
                    )
                  ],
                ),
                Crab(
                  flightShuttleBuilder: textFlightShuttleBuilder,
                  tag: 'line',
                  child: Container(
                      height: 300,
                      width: 50,
                      child: Image.asset('assets/homepage_lines/1.png')),
                ),
                PageDetails(
                  decribing_text: [
                    Text(
                      "We build hardware,\nsoftware, and teams",
                      style: GoogleFonts.montserrat(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "better, faster, cheaper",
                      style: GoogleFonts.montserrat(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                  images: [
                    "assets/activities_images/sample_img.png",
                    "assets/activities_images/sample_img.png",
                    "assets/activities_images/sample_img.png"
                  ],
                  images_bottom_text: ["Native Mobile", "Web", "UX/UI"],
                )
              ],
            ),
          ),
        ),
      );
}

class SecondSection extends StatefulWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  Image? line;
  Image? l2t;

  @override
  void initState() {
    super.initState();
    l2t = Image.asset('assets/logo/3.png');
    line = Image.asset('assets/homepage_lines/2.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(line!.image, context);
    precacheImage(l2t!.image, context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              //dynamic gutters
              horizontal: (MediaQuery.of(context).size.width / 12 + 48),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Crab(
                      flightShuttleBuilder: textFlightShuttleBuilder,
                      tag: 'container',
                      child: Container(
                        height: 100,
                        width: 300,
                        child: Image.asset('assets/logo/3.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text('Free',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(fontSize: 50)),
                    )
                  ],
                ),
                Crab(
                  flightShuttleBuilder: textFlightShuttleBuilder,
                  tag: 'line',
                  child: Container(
                      height: 300,
                      width: 50,
                      child: Image.asset('assets/homepage_lines/2.png')),
                ),
                PageDetails(
                  decribing_text: [
                    Text(
                      "We offer our services ",
                      style: GoogleFonts.montserrat(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "for free & paid",
                      style: GoogleFonts.montserrat(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                  images: [
                    "assets/activities_images/sample_img.png",
                    "assets/activities_images/sample_img.png",
                    "assets/activities_images/sample_img.png"
                  ],
                  images_bottom_text: ["Why?", "How?", "What?"],
                )
              ],
            ),
          ),
        ),
      );
}

class ThirdSection extends StatefulWidget {
  const ThirdSection({Key? key}) : super(key: key);

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  Image? line;
  Image? l2t;

  @override
  void initState() {
    super.initState();
    l2t = Image.asset('assets/logo/4.png');
    line = Image.asset('assets/homepage_lines/3.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(line!.image, context);
    precacheImage(l2t!.image, context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              //dynamic gutters
              horizontal: (MediaQuery.of(context).size.width / 12 + 48),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Crab(
                      flightShuttleBuilder: textFlightShuttleBuilder,
                      tag: 'container',
                      child: Container(
                        height: 100,
                        width: 300,
                        child: l2t,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text('Free',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(fontSize: 50)),
                    )
                  ],
                ),
                Crab(
                  flightShuttleBuilder: textFlightShuttleBuilder,
                  tag: 'line',
                  child: Container(height: 300, width: 50, child: line),
                ),
                PageDetails(
                  decribing_text: [
                    Text(
                      "Designed for scalability",
                      style: GoogleFonts.montserrat(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  images: [
                    "assets/activities_images/sample_img.png",
                    "assets/activities_images/sample_img.png",
                    "assets/activities_images/sample_img.png"
                  ],
                  images_bottom_text: ["Native Mobile", "Web", "UX/UI"],
                )
              ],
            ),
          ),
        ),
      );
}

class FourthSection extends StatefulWidget {
  const FourthSection({Key? key}) : super(key: key);

  @override
  State<FourthSection> createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection> {
  Image? line;
  Image? l2t;

  @override
  void initState() {
    super.initState();
    l2t = Image.asset('assets/logo/5.png');
    line = Image.asset('assets/homepage_lines/4.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(line!.image, context);
    precacheImage(l2t!.image, context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              //dynamic gutters
              horizontal: (MediaQuery.of(context).size.width / 12 + 48),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Crab(
                      flightShuttleBuilder: textFlightShuttleBuilder,
                      tag: 'container',
                      child: Container(
                        height: 100,
                        width: 300,
                        child: l2t,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text('Free',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .copyWith(fontSize: 50)),
                    )
                  ],
                ),
                Crab(
                  flightShuttleBuilder: textFlightShuttleBuilder,
                  tag: 'line',
                  child: Container(height: 300, width: 50, child: line),
                ),
                PageDetails(
                  decribing_text: [
                    Text(
                      "Learn how L2T can best\nserve you",
                      style: GoogleFonts.montserrat(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  images: [
                    "assets/activities_images/sample_img.png",
                    "assets/activities_images/sample_img.png",
                    "assets/activities_images/sample_img.png"
                  ],
                  images_bottom_text: ["Native Mobile", "Web", "UX/UI"],
                )
              ],
            ),
          ),
        ),
      );
}
