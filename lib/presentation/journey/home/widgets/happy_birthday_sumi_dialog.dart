import 'package:flutter/material.dart';
import 'package:my_lover/common/constants/image_constants.dart';
import 'package:my_lover/presentation/widgets/app_dialog.dart';

class HappyBirthdaySumiDialog extends StatelessWidget {
  final int dating;

  const HappyBirthdaySumiDialog({Key? key, required this.dating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDialog(
        dearText: 'Hổ con của anh ơi!',
        content:
            'Hôm nay là sinh nhật của em, cũng là ngày thứ $dating, 2 đứa mình yêu nhau và nếu em đọc được tin nhắn'
            'này thì tức là em vẫn chưa gỡ My Sumi và 2 đứa vẫn còn đang rất rất yêu nhau.\n'
            'Tin nhắn này đã được anh viết và lập trình từ lâu, để hiển thị đúng vào ngày hổ con của anh ra đời, thế nên'
            ' anh đoán em sẽ đọc được tin nhắn này vào ngày thứ tư thứ 2 của tháng 7 (Nếu ko đúng thì do anh viết code '
            'sai. Anh xin lỗi ạ). Nếu như sắp xếp đc công việc thì tối nay 2 đứa mình sẽ ở cạnh nhau, anh tổ chức cho em'
            ' một bữa tiệc sinh nhật nho nhỏ, ấm cúng. Còn nếu không được thì có lẽ 2 đứa mình cũng đã có 1 ngày đi chơi '
            'vô cùng vui vẻ vào ngày chủ nhẩt trước đó rổi.\n'
            'Chúc hổ con của anh có một ngày sinh nhật vui vẻ, hạnh phúc bên những người mà em yêu thương (Trong đó có'
            'anh. Em ko cho anh vào danh sách những người em yêu thương là anh dỗi em đấy). Chúc em thêm tuổi mới thêm'
            'nhiều niềm vui, thêm yêu nghề nhà giáo mà em đã chọn, trưởng thành hơn, đảm đang, bớt vụng về hơn. Và đặc '
            'biệt, điều mà anh mong muốn nhất đó là em sẽ thêm yêu và tin tưởng hơn ở anh (chồng tương lai của em).',
        lastMessage: 'Sumi chỉ cần yêu anh.\nCả thế giới cứ để anh lo',
        icon: ImageConstants.happyBirthday);
  }
}
