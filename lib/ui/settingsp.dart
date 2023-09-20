import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
final InAppReview inAppReview = InAppReview.instance;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
                  "Settings",
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
              height: 20.0,
            ),
         
            InkWell(
              onTap: () {
                inAppReview.openStoreListing(appStoreId: '6466745296');
                //show review
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).indicatorColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      Icons.star,
                      color: Theme.of(context).cardColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Rate App',
                      style: GoogleFonts.dmSans(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
                const SizedBox(
              height: 10.0,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0,
                        title: Text(
                          "Terms & Conditions",
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
                      body: InAppWebView(
                        initialUrlRequest: URLRequest(
                          url: Uri.parse('https://docs.google.com/document/d/1AO1KTQrzJVj5QtK9zAmezpe9qUcXF1gXGuqcsQBOY8E/edit?usp=sharing'),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).indicatorColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      Icons.edit_document,
                      color: Theme.of(context).cardColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Terms & Conditions',
                      style: GoogleFonts.dmSans(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0,
                        title: Text(
                          "Usage Policy",
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
                      body: InAppWebView(
                        initialUrlRequest: URLRequest(
                          url: Uri.parse('https://docs.google.com/document/d/1PvFOIeJkleoUnUm1t127dPJY1sd4kYQhjsu5WBZv4Mg/edit?usp=sharing'),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).indicatorColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      Icons.document_scanner,
                      color: Theme.of(context).cardColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Usage Policy',
                      style: GoogleFonts.dmSans(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
              const SizedBox(
              height: 10.0,
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showCupertinoModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 0,
                        title: Text(
                          "Support",
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
                      body: InAppWebView(
                        initialUrlRequest: URLRequest(
                          url: Uri.parse('https://forms.gle/pXA4W8J8K2mPM2Y18'),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * .95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).indicatorColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      Icons.support,
                      color: Theme.of(context).cardColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Support',
                      style: GoogleFonts.dmSans(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
           
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
