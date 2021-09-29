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

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(80),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          primary: Colors.blue, // <-- Button color
                          onPrimary: Colors.red, // <-- Splash color
                        ),
                        child: const Icon(Icons.menu, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          primary: Colors.blue, // <-- Button color
                          onPrimary: Colors.red, // <-- Splash color
                        ),
                        child: const Icon(Icons.menu, color: Colors.white),
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
