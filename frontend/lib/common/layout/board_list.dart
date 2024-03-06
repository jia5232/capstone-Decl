import 'package:flutter/material.dart';
import 'package:frontend/common/const/colors.dart';
import 'package:frontend/common/const/msg_board_model.dart';
import 'package:frontend/common/layout/text_with_icon.dart';
import 'package:frontend/common/view/msg_board_screen.dart';

class BoardList extends StatelessWidget {
  final MsgBoardModel board;
  const BoardList({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MsgBoardScreen(
                    board: board,
                  ),
              fullscreenDialog: true),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: BODY_TEXT_COLOR.withOpacity(0.5),
              width: 1,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: PRIMARY_COLOR.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(board.category),
                    ),
                  ),
                  Row(
                    children: [
                      TextWithIcon(
                          icon: Icons.favorite_outline_rounded,
                          text: board.heart),
                      const SizedBox(
                        width: 13,
                      ),
                      TextWithIcon(
                          icon: Icons.chat_outlined, text: board.comment),
                      const SizedBox(
                        width: 13,
                      ),
                      TextWithIcon(
                          icon: Icons.star_outline_rounded,
                          text: board.favorite),
                      const SizedBox(
                        width: 13,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      board.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      board.preview,
                      softWrap: false,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${board.date} | ${board.name}",
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
