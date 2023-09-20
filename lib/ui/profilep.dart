import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pockex/ui/assse.dart';

import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'x.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  final WebViewController _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Assets",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * .7,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 30.0,
                    childAspectRatio: 3),
                itemCount: FXA.values.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showCupertinoModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        builder: (context) {
                          _webViewController.loadHtmlString("""
                                        <!-- TradingView Widget BEGIN -->
                                        <div class="tradingview-widget-container">
                                          <div id="tradingview_8aa14"></div>
                                          <div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/" rel="noopener nofollow" target="_blank"><span class="blue-text">Track all markets on TradingView</span></a></div>
                                          <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                                          <script type="text/javascript">
                                          new TradingView.widget(
                                          {
                                          "autosize": true,
                                          "symbol": "OANDA:${FXA.values[index].name}",
                                          "interval": "D",
                                          "timezone": "Etc/UTC",
                                          "theme": "light",
                                          "style": "1",
                                          "locale": "en",
                                          "toolbar_bg": "#f1f3f6",
                                          "enable_publishing": false,
                                          "allow_symbol_change": true,
                                          "container_id": "tradingview_8aa14"
                                        }
                                          );
                                          </script>
                                        </div>
                                        <!-- TradingView Widget END -->
                                        """);
                          return Scaffold(
                            appBar: AppBar(
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 0,
                              title: Text(
                                FXA.values[index].name,
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
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            body: WebViewWidget(controller: _webViewController),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 20,
                      width: 200,
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.all(
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
                                          "https://s3-symbol-logo.tradingview.com/country/${FXA.values[index].name[3]}${FXA.values[index].name[4]}.svg"),
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
                                          "https://s3-symbol-logo.tradingview.com/country/${FXA.values[index].name[0]}${FXA.values[index].name[1]}.svg"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              FXA.values[index].name,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.dmSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).canvasColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
