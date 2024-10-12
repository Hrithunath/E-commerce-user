import 'package:e_commerce_shoes/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('MyOrders'),
          leading: const Icon(Icons.receipt_long),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pushReplacementNamed(context, "/MyOrders");
          },
        ),
        ListTile(
          title: const Text('Shipping Addresses'),
          leading: const Icon(Icons.location_on),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Payment Methods'),
          leading: const Icon(Icons.payment_rounded),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Settings'),
          leading: const Icon(Icons.settings),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Logout'),
          leading: const Icon(Icons.logout),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title:  const Center(child: Text('Confirm ',)),
                  content: const Text(
                      'Are you sure you want to sign out?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); 
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(LogoutEvent());
                        Navigator.of(context).pop();
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                );
              },
            );
          },
        )
      ],
    );
  }
}
