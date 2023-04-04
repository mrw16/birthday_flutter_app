import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreenPage extends StatefulWidget {
  const IntroductionScreenPage({super.key});

  @override
  State<IntroductionScreenPage> createState() => _IntroductionScreenPageState();
}

class _IntroductionScreenPageState extends State<IntroductionScreenPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final bodyStyle = GoogleFonts.poppins(
      fontSize: 14,
    );

    final pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      pages: [
        PageViewModel(
          title: "Happy birthday",
          body:
              "Terima kasih telah dan masih berjuang hingga sejauh ini. Aku sangat bangga padamu yang kuat dan tak kenal kata lelah. Semoga di fase ini apa yang kamu harapkan dikabulkan oleh Tuhan!",
          image: Image.asset('images/birthday_girl.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Have a great one",
          body:
              "Seiring usiamu bertambah, semoga kamu semakin menjadi lebih dewasa, bahagia, dan sukses. Semoga rahmat Tuhan ada dalam setiap langkahmu.",
          image: Image.asset('images/birthday_cake.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Selamat ulang tahun",
          body:
              "Ini hadiah kecil, tetapi aku harap dapat membuat beberapa minggu ke depanmu sedikit lebih mudah.",
          image: Image.asset('images/birthday_gift.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        GoRouter.of(context).go('/input-name');
      },
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const FaIcon(FontAwesomeIcons.circleChevronLeft),
      next: const FaIcon(FontAwesomeIcons.circleChevronRight),
      done: Text(
        'Lanjut',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
