import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StrategyModel {
  final String title;
  final String description;
  final int difficulty;

  const StrategyModel({
    required this.title,
    required this.description,
    required this.difficulty,
  });
}

class StrategyDetailsPage extends StatelessWidget {
  final StrategyModel strategy;

  const StrategyDetailsPage({
    Key? key,
    required this.strategy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Theme.of(context).primaryColor,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        middle: Text(
          strategy.title,
          style: GoogleFonts.poppins(
            decoration: TextDecoration.none,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              strategy.title,
              style: GoogleFonts.poppins(
                decoration: TextDecoration.none,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Difficulty: ",
                  style: GoogleFonts.poppins(
                    decoration: TextDecoration.none,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 4),
                Row(
                  children: List.generate(
                    5,
                    (dotIndex) {
                      return Container(
                        margin: const EdgeInsets.only(right: 4),
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          color: strategy.difficulty > dotIndex
                              ? const Color.fromARGB(221, 255, 255, 255)
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              strategy.description,
              style: GoogleFonts.poppins(
                decoration: TextDecoration.none,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
