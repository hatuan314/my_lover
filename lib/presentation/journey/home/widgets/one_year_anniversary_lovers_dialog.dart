import 'package:flutter/material.dart';
import 'package:my_lover/common/constants/image_constants.dart';
import 'package:my_lover/presentation/widgets/app_dialog.dart';

class OneYearAnniversaryLoversDialog extends StatelessWidget {
  const OneYearAnniversaryLoversDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppDialog(
      dearText: 'Gửi Sumi của anh.',
      content: 'Chúc mừng ngày kỷ niệm 1 năm yêu nhau.\n'
          'Nếu em đọc được tin nhắn này tức là chúng mình đã yêu nhau được 1 năm rồi.'
          ' Một năm nói là dài thì cũng không phải là dài, nhưng cũng không hề ngắn.'
          ' Đã có nhiều điều xảy ra để thử thách cả 2 đứa, để cả 2 đứa có cơ hội hiểu nhau hơn.'
          ' Vào thời điểm anh viết những dòng này, em vẫn còn đang rất lo lắng về tình cảm anh dành cho em.'
          ' Sumi ngố, 1 năm qua anh đã dành tất cả tình cảm cho em (Thỉnh thoảng anh vô tình làm em khóc),'
          ' hiện tại anh đang yêu em, và chắc chắn là tương lai anh cũng vẫn yêu em.\n'
          'Cảm ơn em đã yêu anh, đặt niềm tin vào anh, dành những thứ tuyệt vời nhất của tuổi thanh xuân của em'
          ' cho anh. Anh biết em cũng yêu anh, mong đợi nhiều vào anh và muốn 2 đứa sẽ đi đến một cái kết'
          'viên mãn, tốt đẹp là về chung 1 nhà. Đó cũng là điều anh mong muốn và đang cố gắng hàng ngày để biến'
          ' nó thành hiện thực càng sớm càng tốt.\n'
          'Hai đứa mình cùng nhau cố gắng em nhé. Anh đang cố gắng trở thành rể thảo, còn em cũng phải cố trở thành dâu'
          'hiền. Anh tin rằng dù có thế nào đi chăng nữa, chỉ cần 2 đứa mình yêu nhau, tin tưởng nhau và tin tưởng nhau'
          'thì chẳng có gì mà hai đứa không vượt qua được cả.\n',
      lastMessage: 'Sumi chỉ cần yêu anh.\nCả thế giới cứ để anh lo',
      icon: ImageConstants.coupe,
    );
  }
}
