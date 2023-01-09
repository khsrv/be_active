import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/models/time_enum.dart';
import 'package:be_active/screens/notes_screen.dart';
import 'package:be_active/screens/time_screen.dart';
import 'package:be_active/widgets/button/gradient_button.dart';
import 'package:be_active/widgets/cards/time_cards.dart';
import 'package:be_active/widgets/main/founder_widget.dart';
import 'package:be_active/widgets/modals/info_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: GradientButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotesScreen(),
                ),
              );
            },
            title: 'Закметки',
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Be Active",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showFounderModal(context: context);
            },
            icon: const Icon(
              Icons.info,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const FounderWidget(),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TimeCardWidget(
                    image: 'assets/images/morning.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimeScreen(
                            time: TimeEnum.morning,
                          ),
                        ),
                      );
                    },
                  ),
                  TimeCardWidget(
                    image: 'assets/images/day.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimeScreen(
                            time: TimeEnum.day,
                          ),
                        ),
                      );
                    },
                  ),
                  TimeCardWidget(
                    image: 'assets/images/night.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimeScreen(
                            time: TimeEnum.nigt,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
