const List<String> categorysList = [
  "전체",
  "인기게시판",
  "자유게시판",
  "대학원게시판",
  "취준게시판",
  "스터디모집",
  "홍보게시판",
];

Map<String, String> categoryCodesList = {
  "전체": "ALL",
  "인기게시판": "HOT",
  "자유게시판": "FREE",
  "대학원게시판": "GRADUATE",
  "취준게시판": "JOB",
  "스터디모집": "STUDY",
  "홍보게시판": "PROMOTION",
};

Map<String, String> categoryCodesReverseList = {
  "HOT": "인기게시판",
  "FREE": "자유게시판",
  "GRADUATE": "대학원게시판",
  "JOB": "취준게시판",
  "STUDY": "스터디모집",
  "PROMOTION": "홍보게시판",
};
