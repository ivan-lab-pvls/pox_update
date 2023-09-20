import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

const List<String> advices = [
  "Risk Management is Key: Never risk more than you can afford to lose on a single trade. Use stop-loss orders to limit potential losses, and diversify your investments to spread risk.",
  "Stay Informed: Continuously monitor news and events that can impact the markets. Economic indicators, geopolitical developments, and company earnings reports can all have a significant effect.",
  "Educate Yourself First: Before diving into trading, take the time to thoroughly understand the financial markets, trading strategies, and risk management principles. Knowledge is your best tool.",
  "Start with a Demo Account: Practice your trading skills on a demo account with virtual money. This allows you to gain experience without risking real capital.",
  "Set Clear Goals: Define your financial goals and trading objectives. Knowing what you want to achieve will help you make informed decisions and stay focused.",
  "Use Proper Position Sizing: Determine the appropriate position size for each trade based on your risk tolerance and account size. Avoid over-leveraging, as it can lead to significant losses.",
  "Adapt and Learn from Mistakes: Losses are part of trading. Instead of dwelling on them, view them as learning opportunities. Adapt your strategies and risk management based on your experiences.",
  "Control Your Emotions: Emotional trading can lead to impulsive decisions and losses. Stick to your trading plan, and avoid letting fear and greed drive your actions.",
  "Keep Records: Maintain a trading journal to track your trades, strategies, and outcomes. This will help you identify what works and what doesn't.",
  "Stay Patient and Disciplined: Successful trading takes time. Don't rush into trades or chase quick profits. Stick to your plan, and be patient as you work toward your goals.",
];

class AdvicesScreen extends StatefulWidget {
  const AdvicesScreen({super.key});

  @override
  State<AdvicesScreen> createState() => _AdvicesScreenState();
}

class _AdvicesScreenState extends State<AdvicesScreen> {
  var adviceIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Text(
                "Community",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 160,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: theme.primaryColor,
                        width: 2,
                      ),
                    ),
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      advices[adviceIndex],
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ArrowButton(
                        isLeft: true,
                        onTap: _decreaseAdviceIndex,
                      ),
                      const SizedBox(width: 24),
                      ArrowButton(
                        isLeft: false,
                        onTap: _increaseAdviceIndex,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _decreaseAdviceIndex() {
    if (adviceIndex > 0) {
      setState(() {
        adviceIndex--;
      });
    }
  }

  void _increaseAdviceIndex() {
    if (adviceIndex < advices.length - 1) {
      setState(() {
        adviceIndex++;
      });
    }
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.isLeft,
    required this.onTap,
  });

  final bool isLeft;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 173, 158, 249),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(
          isLeft ? FontAwesomeIcons.chevronLeft : FontAwesomeIcons.chevronRight,
          size: 18,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
