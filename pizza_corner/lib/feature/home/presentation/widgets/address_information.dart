import 'package:flutter/material.dart';
import 'package:pizza_corner/core/const.dart';

class AddressInformation extends StatelessWidget {
  const AddressInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: defaultContainer, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Your Delivery Address'),
                SizedBox(height: 5),
                Text(
                  '241 Hillside Road, HASTINGS',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.edit),
          )
        ],
      ),
    );
  }
}
