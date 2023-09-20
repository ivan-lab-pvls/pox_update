import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pockex/utils/enums/asseets_pa.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class AssetsPagex extends StatefulWidget {
  const AssetsPagex({Key? key, required List<String> arguments}) : super(key: key);

  @override
  State<AssetsPagex> createState() => _AssetsPagexState();
}

class _AssetsPagexState extends State<AssetsPagex> {
  final List<String> assets = [];

  final List<AssetsPair> assetsList = AssetsPair.values.reversed.toList();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assets.addAll(ModalRoute.of(context)?.settings.arguments as List<String>);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Text(
          "Add",
          textAlign: TextAlign.center,
          style: GoogleFonts.dmSans(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).canvasColor,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: CupertinoButton(
          child: Icon(
            Icons.close,
            color: Theme.of(context).canvasColor,
            size: 24,
          ),
          onPressed: () {
            final RxSharedPreferences pref = RxSharedPreferences.getInstance();
            pref.setStringList("assets", assets);
            pref.getStringList("assets");
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: assetsList.length,
          itemBuilder: (context, index) {
            return CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  if (assets.contains(assetsList[index].name)) {
                    assets.removeWhere(
                        (asset) => asset == assetsList[index].name);
                  } else {
                    assets.add(assetsList[index].name);
                  }
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 20,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: Container(
                              height: 20,
                              width: 20,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.network(
                                  "https://s3-symbol-logo.tradingview.com/country/${assetsList[index].name[3]}${assetsList[index].name[4]}.svg"),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: Container(
                              height: 20,
                              width: 20,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.network(
                                  "https://s3-symbol-logo.tradingview.com/country/${assetsList[index].name[0]}${assetsList[index].name[1]}.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      assetsList[index].name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).canvasColor,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).canvasColor,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: assets.contains(assetsList[index].name)
                                ? Theme.of(context).canvasColor
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
        ),
      ),
    );
  }
}
