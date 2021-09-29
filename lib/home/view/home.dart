// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:headknocker/home/flows/flows.dart';
import 'package:headknocker/home/widgets/widgets.dart';

Future<String> cheapDelay() async {
  await Future.delayed(const Duration(seconds: 2), () {});
  return 'Hello World';
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black12,
        elevation: 0,
        onPressed: () {},
        child: Icon(Icons.settings),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: FutureBuilder<String>(
          future: cheapDelay(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeView();
            }
            return const HNLoad();
          },
        ),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var alarmSelect = false;
  var lockSelect = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 420,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFFCF4949),
                Color(0xFFC2351F),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 80,
              vertical: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Connected BUtton =======================
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[500],
                    elevation: 3,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Connected',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Lexus ES',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Image.asset(
                    'assets/lexus.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            alarmSelect = !alarmSelect;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            width: 3,
                            color: Colors.grey[500]!,
                          ),
                          elevation: alarmSelect ? 0 : 3,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                          primary: alarmSelect
                              ? Colors.transparent
                              : Colors.grey[500], // <-- Button color
                          onPrimary: Colors.red, // <-- Splash color
                        ),
                        child: Icon(
                          Icons.notifications_active,
                          color: alarmSelect ? Colors.grey[500] : Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lockSelect = !lockSelect;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            width: 3,
                            color: Colors.grey[500]!,
                          ),
                          elevation: lockSelect ? 0 : 3,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                          primary: lockSelect
                              ? Colors.transparent
                              : Colors.grey[500], // <-- Button color
                          onPrimary: Colors.red, // <-- Splash color
                        ),
                        child: Icon(
                          Icons.vpn_key,
                          color: lockSelect ? Colors.grey[500] : Colors.white,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.notifications_active,
                    size: 32, color: Theme.of(context).highlightColor),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ALARM', style: Theme.of(context).textTheme.headline1),
                    Text('Headknocker by Foreigner',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
                trailing: Icon(Icons.chevron_right,
                    color: Theme.of(context).highlightColor),
                onTap: () async {
                  await Navigator.of(context).push(OnboardingFlow.route());
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Onboarding Flow Complete!'),
                      ),
                    );
                },
              ),
              ListTile(
                leading: Icon(Icons.vpn_key,
                    size: 32, color: Theme.of(context).highlightColor),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LOCK', style: Theme.of(context).textTheme.headline1),
                    Text('Locked',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
                trailing: Icon(Icons.chevron_right,
                    color: Theme.of(context).highlightColor),
                onTap: () async {
                  await Navigator.of(context).push(OnboardingFlow.route());
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Onboarding Flow Complete!'),
                      ),
                    );
                },
              ),
              ListTile(
                leading: Icon(Icons.alarm,
                    size: 32, color: Theme.of(context).highlightColor),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SOFTWARE UPDATE',
                        style: Theme.of(context).textTheme.headline1),
                    Text('Up-to-date',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
                trailing: Icon(Icons.chevron_right,
                    color: Theme.of(context).highlightColor),
                onTap: () async {
                  await Navigator.of(context).push(OnboardingFlow.route());
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Onboarding Flow Complete!'),
                      ),
                    );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
