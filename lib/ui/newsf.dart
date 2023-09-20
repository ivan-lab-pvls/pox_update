import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadNewss extends StatefulWidget {
  final String title;
  final String descriprtion;
  const ReadNewss({
    super.key,
    required this.title,
    required this.descriprtion,
  });

  @override
  State<ReadNewss> createState() => _NewsPageState();
}

class _NewsPageState extends State<ReadNewss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Read more',
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
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  widget.title,
                  style: GoogleFonts.dmSans(
                    color: const Color.fromARGB(255, 254, 254, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  widget.descriprtion,
                  style: GoogleFonts.dmSans(
                    color: const Color.fromARGB(255, 197, 197, 200),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey
                  ),
                  child: Center(
                    child: Text('Empty comments', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
