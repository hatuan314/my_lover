import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_lover/common/app_utils.dart';
import 'package:my_lover/common/constants/icon_constants.dart';
import 'package:my_lover/common/constants/layout_constants.dart';
import 'package:my_lover/presentation/journey/menstrual_cycle/menstrual_cycle_controller.dart';
import 'package:my_lover/presentation/themes/theme_color.dart';
import 'package:my_lover/presentation/themes/theme_text.dart';
import 'package:my_lover/presentation/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:my_lover/presentation/widgets/button_widget.dart';
import 'package:my_lover/presentation/widgets/touchable_widget.dart';

class AddMenstrualCycleBottomSheetWidget extends GetWidget<MenstrualCycleController> {
  const AddMenstrualCycleBottomSheetWidget({Key? key}) : super(key: key);

  Widget _selectDateWidget({String? title, Function()? onPressed, DateTime? date}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: ThemeText.caption,
          ),
          SizedBox(
            height: LayoutConstants.paddingVertical5,
          ),
          TouchableWidget(
            onPressed: onPressed,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(LayoutConstants.radius_8)),
                color: AppColor.secondColor,
              ),
              padding: EdgeInsets.symmetric(
                  vertical: LayoutConstants.paddingVertical8, horizontal: LayoutConstants.paddingHorizontal8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    IconConstants.icCalendar,
                    color: AppColor.textColor,
                    width: LayoutConstants.iconsSize15,
                  ),
                  Text(AppUtils.isNullEmpty(date) ? '' : DateFormat('dd/MM/yyyy').format(date!)),
                  const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _applyButtonWidget() {
    return ButtonWidget(
      onPressed: controller.addMenstrualCycleController,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Lưu',
          style: ThemeText.button.copyWith(color: AppColor.white),
        ),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Obx(
              () => _selectDateWidget(
                title: 'Bắt đầu',
                date: controller.rxStartDate.value,
                onPressed: () => openDatePicker(
                  context,
                  date: controller.rxStartDate.value,
                  onConfirm: controller.setStartDate,
                ),
              ),
            ),
            SizedBox(
              width: LayoutConstants.paddingHorizontal8,
            ),
            Obx(
                  () => _selectDateWidget(
                title: 'Kết thúc',
                date: controller.rxEndDate.value,
                    onPressed: () => openDatePicker(
                      context,
                      date: controller.rxEndDate.value,
                      onConfirm: controller.setEndDate,
                    ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: LayoutConstants.appPaddingVertical,
        ),
        _applyButtonWidget(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      header: 'Viết nhật ký',
      body: _bodyWidget(context),
    );
  }

  void openDatePicker(BuildContext context, {DateTime? date, Function(DateTime)? onConfirm}) {
    final minTime = DateTime(DateTime.now().year - 1, DateTime.now().month, DateTime.now().day);
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: minTime,
      onConfirm: onConfirm,
      currentTime: date,
      locale: LocaleType.vi,
    );
  }
}
