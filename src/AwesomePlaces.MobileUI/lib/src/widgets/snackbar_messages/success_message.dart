import 'package:flutter/material.dart';

import 'custom_snackbar.dart';

class SuccessMessage extends StatelessWidget implements CustomSnackBar {
  final String message;

  const SuccessMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(height: 0),
                ),
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 48,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Success!',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Text(
                                  message,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 15,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          const Positioned(
                              top: 5,
                              child: Icon(
                                Icons.check_outlined,
                                color: Colors.white,
                                size: 20,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
