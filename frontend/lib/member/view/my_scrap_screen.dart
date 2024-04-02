import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/member/provider/mypage/my_scrap_state_notifier_provider.dart';

import '../../board/component/board_card.dart';
import '../../board/model/msg_board_response_model.dart';
import '../../board/view/msg_board_screen.dart';
import '../../common/const/colors.dart';
import '../../common/model/cursor_pagination_model.dart';

class MyScrapScreen extends ConsumerStatefulWidget {
  const MyScrapScreen({super.key});

  @override
  ConsumerState<MyScrapScreen> createState() => _MyScrapScreenState();
}

class _MyScrapScreenState extends ConsumerState<MyScrapScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListener);
  }

  void scrollListener() {
    if (controller.offset > controller.position.maxScrollExtent - 150) {
      ref.read(myScrapStateNotifierProvider.notifier).paginate(
            fetchMore: true,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _renderTop(),
            Expanded(
              child: _renderMyScrappedPostList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderTop() {
    return Container(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.chevron_left,
            ),
          ),
          const SizedBox(width: 113.0),
          Text(
            "스크랩한 글",
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderMyScrappedPostList() {
    final data = ref.watch(myScrapStateNotifierProvider);

    if (data is CursorPaginationModelLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: PRIMARY_COLOR,
        ),
      );
    }

    if (data is CursorPaginationModelError) {
      return const Center(
        child: Text("데이터를 불러올 수 없습니다."),
      );
    }

    final cp = data as CursorPaginationModel;

    return ListView.separated(
      controller: controller,
      itemCount: cp.data.length + 1,
      itemBuilder: (_, index) {
        if (index == cp.data.length) {
          return Center(
            child: cp is CursorPaginationModelFetchingMore
                ? const CircularProgressIndicator(
                    color: PRIMARY_COLOR,
                  )
                : const Text(
                    'Copyright 2024. Decl Team all rights reserved.\n',
                    style: TextStyle(
                      color: BODY_TEXT_COLOR,
                      fontSize: 12.0,
                    ),
                  ),
          );
        }

        final MsgBoardResponseModel pItem = cp.data[index];

        return GestureDetector(
          child: BoardCard.fromModel(msgBoardResponseModel: pItem),
          onTap: () async {
            // 상세페이지
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MsgBoardScreen(
                        board: pItem,
                      ),
                  fullscreenDialog: true),
            );
          },
        );
      },
      separatorBuilder: (_, index) {
        return const SizedBox(height: 1.0);
      },
    );
  }
}