import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pockex/ui/cc.dart';

class StrategiesPage extends StatelessWidget {
  const StrategiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Theme.of(context).primaryColor,
      child: SafeArea(
        child: ListView.separated(
          itemCount: StrategiesConstants.strategies.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => StrategyDetailsPage(
                      strategy: StrategiesConstants.strategies[index],
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration:  BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StrategiesConstants.strategies[index].title,
                      style: GoogleFonts.poppins(decoration: TextDecoration.none,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Difficulty: ",
                          style: GoogleFonts.poppins(decoration: TextDecoration.none,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (dotIndex) {
                              return Container(
                                margin: const EdgeInsets.only(right: 4),
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: StrategiesConstants
                                              .strategies[index].difficulty >
                                          dotIndex
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      StrategiesConstants.strategies[index].description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(decoration: TextDecoration.none,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
        ),
      ),
    );
  }
}


class StrategiesConstants {
  static const List<StrategyModel> strategies = [
     StrategyModel(
      title: "Scalping",
      description:
          """Scalpers make numerous quick trades to profit from small price movements. They aim to capture tiny price differentials. Challenges include:

- High-frequency trading requires advanced technology and low-latency connections.
- Transaction costs can significantly impact profitability.
- Scalping can be stressful and emotionally taxing.""",
      difficulty: 3,
    ),
    StrategyModel(
      title: "Options Trading",
      description:
          """Options traders use contracts that give them the right (but not the obligation) to buy or sell an asset at a predetermined price. Challenges include:

- Complex strategies and the need to understand various options strategies.
- Limited time to expiry for options contracts.
- High leverage can lead to significant losses if the market moves against the trader.""",
      difficulty: 2,
    ),
    StrategyModel(
      title: "Algorithmic Trading",
      description:
          """Algorithmic traders use computer programs to execute trades based on predefined rules and strategies. Challenges include:

- Developing and maintaining effective algorithms requires programming skills and constant refinement.
- Technical glitches or "flash crashes" can lead to significant losses.
- Over-optimization can result in algorithms that perform well historically but fail in real-time markets.""",
      difficulty: 4,
    ),
    StrategyModel(
      title: "Mean Reversion",
      description:
          """Mean reversion traders assume that prices will revert to their historical average over time. They look for overbought or oversold conditions to enter trades. Challenges include:

- Identifying the true mean in volatile markets can be difficult.
- Prices can stay in overbought or oversold territories for extended periods.""",
      difficulty: 3,
    ),
    StrategyModel(
      title: "Day Trading",
      description:
          "Day traders aim to profit from short-term price movements within a single trading day. They make multiple trades throughout the day and often use technical analysis to identify entry and exit points. Challenges include: high-pressure environment with quick decision-making,Constant monitoring of the markets, leading to stress and burnout, Transaction costs can eat into profits due to frequent trading.",
      difficulty: 3,
    ),
    StrategyModel(
      title: "Swing Trading",
      description:
          "Swing traders hold positions for several days to weeks, aiming to capture larger price movements. They rely on technical and fundamental analysis to identify potential trends. Challenges include: balancing patience with timing, as swing trades require waiting for the right entry and exit points, holding positions overnight exposes traders to overnight risk, such as market gaps.",
      difficulty: 2,
    ),
    StrategyModel(
      title: "Trend Following",
      description:
          "Trend followers identify and ride established market trends. They use technical indicators to confirm trends and determine entry and exit points. Challenges include: false signals and whipsaws can lead to losses if trends reverse unexpectedly, missed opportunities during sideways or range-bound markets.",
      difficulty: 2,
    ),
    StrategyModel(
      title: "Arbitrage",
      description:
          """Arbitrageurs exploit price discrepancies of the same asset across different markets or exchanges. They buy low in one market and sell high in another to lock in risk-free profits. Challenges include:

- Fast execution is crucial, as price discrepancies can close rapidly.
- Transaction costs and fees can reduce or eliminate potential profits.
- Arbitrage opportunities are becoming scarcer due to advanced trading technology.""",
      difficulty: 3,
    ),
   
  ];
}
