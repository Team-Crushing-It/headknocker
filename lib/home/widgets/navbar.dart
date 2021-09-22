import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:l2t_beta/home/widgets/widgets.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          HoverLogo(
            onTap: () {
              print('tapped');
            },
            visible: true,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
              child: const Text(
                'Sign-up',
                style: (TextStyle(color: Colors.black)),
              ),
              onPressed: () async => await canLaunch(
                      'https://5t563f0edni.typeform.com/to/WXMSubwC')
                  ? await launch('https://5t563f0edni.typeform.com/to/WXMSubwC')
                  : throw 'Could not launch'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            child: const Text(
              'Login',
              style: (TextStyle(color: Colors.black)),
            ),
            onPressed: () {
              // context.read<NavigationCubit>().logInWithGitHub();
            },
          ),
        ),
      ],
    );
  }
}
