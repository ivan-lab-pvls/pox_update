import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pockex/ui/dataz.dart';

import 'newsf.dart';

const int alop = 7;

class NewsFull extends StatefulWidget {
  const NewsFull({super.key});

  @override
  State<NewsFull> createState() => _AllNewsState();
}

class _AllNewsState extends State<NewsFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 44, 45),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'News',
                      style: GoogleFonts.dmSans(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: financeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Nes article = financeList[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadNewss(
                              title: financeList[index].title,
                              descriprtion: financeList[index].descriprtion,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, bottom: 15),
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 92, 91, 91),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: const Color.fromARGB(
                                          221, 255, 255, 255)),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  article.descriprtion,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: const Color.fromARGB(
                                          255, 212, 210, 210)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewsFull2 extends StatefulWidget {
  const NewsFull2({super.key});

  @override
  State<NewsFull2> createState() => _AllNewsState2();
}

var vied = 0;

class _AllNewsState2 extends State<NewsFull2> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              "News",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSans(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .26,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 87, 153),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Count: ${financeList.length}',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .26,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 87, 153),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Viewed: $vied',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .26,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 84, 87, 153),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Balance: 0\$',
                      style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: financeList.length,
                itemBuilder: (BuildContext context, int index) {
                  Nes article = financeList[index];

                  return InkWell(
                    onTap: () {
                      if (vied != financeList.length) {
                        setState(() {
                          vied++;
                        });
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadNewss(
                            title: financeList[index].title,
                            descriprtion: financeList[index].descriprtion,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 15),
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                        221, 255, 255, 255)),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                article.descriprtion,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    color: const Color.fromARGB(
                                        255, 212, 210, 210)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
