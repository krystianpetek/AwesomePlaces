import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String content;

  const ErrorMessage({super.key, required this.content});

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
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                  'Error!',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Text(
                                  content,
                                  style: TextStyle(
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
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          const Positioned(
                              top: 5,
                              child: Icon(
                                Icons.clear_outlined,
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
