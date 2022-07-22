import 'package:chayxana/models/order_dto_new.dart';
import 'package:chayxana/pages/main/history/notification/notification_page.dart';
import 'package:chayxana/pages/main/home/booking/booking_page.dart';
import 'package:chayxana/pages/main/home/detail/detail_page.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/services/theme_service.dart';
import 'package:chayxana/views/app_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../views/net_image.dart';
import 'history_controller.dart';
import 'package:lottie/lottie.dart';

/// Group => III
class HistoryPage extends StatelessWidget {
  HistoryController controller = Get.put(HistoryController());
  static const String id = "/history_page";

  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HistoryController(),
        builder: (HistoryController controller) => Scaffold(
              appBar: appbar(
                  title: "order_history".tr,
                  leadingFunction: null,
                  actionsFunction: controller.openNot,
                  centerTitle: false,
                  leading: true,
                  actions: false,
              ),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  controller.data.isNotEmpty
                      ? SizedBox(
                          child: controller.isLoaded ? getLoading() : getShimmerLoader(),
                    )
                      ///   Center No orders
                      : Center(
                          heightFactor: Get.height / 25.6,
                          child:  Text(
                            "you_have_no_orders_yet".tr,
                            style: ThemeService.textStyleCenterNoorders,
                          ),
                        ),
                ],
              ),
            ),
    );
  }

  ///without shimmer
  Widget getLoading(){
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15,),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: controller.response != null
          ? controller.response!.object!.length
          : 0,
      itemBuilder: (context, index) {
        Order order = controller.response!.object![index];
      /// All Container
      return Container(
        padding: EdgeInsets.only(top: Get.height / 64),
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: 168,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.activeColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                /// Image Container
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 8),
                  height: 95,
                  width: Get.width / 3.9,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                  ),
                  child: NetImage(
                      imgUrl: "http://62.109.0.156:8085/api/v1/mobile/chayxana/getMainPicOfChayxana/${order.roomDto!.chayxanaDto!.chayxanaId}"),
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: 95,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Name Tea Hause
                        Text(
                          controller.limitedText(order.roomDto!.chayxanaDto!.chayxanaName ?? "No Name"),
                          style: ThemeService.textStyleHistoryContainer,
                        ),
                        const SizedBox(height: 4),
                        /// Location Tea House
                        Flexible(
                          child: Text(
                            controller.limitedText(
                              "${"location".tr}: ${"${order.roomDto!.chayxanaDto!.addressDto!.districtDto!.regionDto!.name!},${order.roomDto!.chayxanaDto!.addressDto!.districtDto!.name!}"}",
                            ),
                            style: ThemeService.textStyleHistoryContainer,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        /// Order date time  room number
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: Get.width / 1.682,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: order.status == 'NEW' ? AppColors.mainColor.withOpacity(.7)  : AppColors.btnColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      controller.dateFormat(),
                                      style: order.status == 'NEW' ? ThemeService.textStyleOrderRoomNumber  :  ThemeService.textStyleOrderData,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.symmetric(
                                        vertical: BorderSide(
                                          color: order.status == "NEW" ? AppColors.activeColor : AppColors.unSelectedTextColor,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    width: 54,
                                    height: Get.height * 0.061,
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller.timeStemp(order.orderTime!),
                                      style: order.status == "NEW" ? ThemeService.textStyleOrderRoomNumber : ThemeService.textStyleOrderData,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  //  SizedBox(width: 5,),
                                  Expanded(
                                    flex: 2,
                                    child: Text(order.roomDto!.roomNumber!.toString() + ('-') + ('room').tr,
                                      style: order.status == "NEW" ? ThemeService.textStyleOrderRoomNumber : ThemeService.textStyleOrderData,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
                height: 1, color: AppColors.borderColor),
            orderTypes(order),
          ],
        ),
      );
      },
    );
  }

  ///Shimmer
  Widget getShimmerLoader(){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.response != null
            ? controller.response!.object!.length
            : 0,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      enabled: true,
                      child: Container(
                        margin: const EdgeInsets.only(left: 15, right: 8, top: 15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        margin: const EdgeInsets.only(left: 15, right: 8, top: 15),
                        height: 105,
                        width: Get.width / 3.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              enabled: true,
                                child: const SizedBox(height: 5,),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              enabled: true,
                              child: Container(
                                height: 25,
                                width: 155,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              enabled: true,
                                child: const SizedBox(height: 5,),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              enabled: true,
                              child: Container(
                                height: 21,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              enabled: true,
                              child: const SizedBox(height: 5,),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              enabled: true,
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                enabled: true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 8),
                  child: const Divider(
                    thickness: 3,
                    color: Color(0xffE5E5E5),
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                enabled: true,
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 8),
                  height: 47,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

  ///orderTypes
  orderTypes(Order order) {
    return SizedBox(
        height: 45,
        width: Get.mediaQuery.size.width,
        child: order.roomDto!.bron!
          ///  Order Completed
            ? Center(
                child: Text('you_have_no_orders_yet'.tr),
              )
            : MaterialButton(
                child: order.status == 'NEW'
                   /// New Order Button
                    ? MaterialButton(
                        onPressed: () => orderBottomSheetCancel(order),
                        child:  Text(
                          "cancel_order".tr,
                            style: ThemeService.textStyleNewOrderButton,
                        ),
                )
                    : MaterialButton(
                        onPressed: () => orderBottomSheet(order),
                        child: order.status == 'DELETE'
                           /// Completed Order Button
                            ? MaterialButton(
                                onPressed: () => orderBottomSheet(order),
                                child:  Text(
                                  "canceled_order".tr,
                                    style: ThemeService.textStyleCompletedOrderButton,
                                ),
                        )
                        /// Cancel Order Button
                            : MaterialButton(
                                onPressed: () => orderBottomSheet(order),
                                child:  Text(
                                  "completed_order".tr,
                                    style: ThemeService.textStyleCompletedOrderButton,
                                ),
                        ),
                ),
                   onPressed: () => orderBottomSheet(order),
              ),
    );
  }

  /// Order BottomSheet Method
  orderBottomSheet(Order order) {
    return Get.bottomSheet(
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: EdgeInsets.only(bottom: Get.height / 14.93),
      height: Get.height / 4.81,
      width: Get.height,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.to(const BookingPage()),
            child:  Text(
              "book_again".tr,
              style: ThemeService.textStyleBookAgain,
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          GestureDetector(
            onTap: () async {
              if (await canLaunch('tel:${order.roomDto!.chayxanaDto!.phoneNumber}')) {
                await launch('tel:${order.roomDto!.chayxanaDto!.phoneNumber}');
              }
            },
            child:  Text(
              "call".tr,
                style: ThemeService.textStyleBookAgain,
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          GestureDetector(
            onTap: () {
              Get.to(const DetailPage());
            },
            child:  Text(
              "about_teahouse".tr,
                style: ThemeService.textStyleBookAgain,
            ),
          ),
        ],
      ),
     ),
    );
  }

  /// Order BottomSheet Method for cancel
  orderBottomSheetCancel(Order order) {
    return Get.bottomSheet(
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: EdgeInsets.only(bottom: Get.height / 14.93),
      height: Get.height / 4.81,
      width: Get.height,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
              Get.bottomSheet(
                Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,),
                margin: EdgeInsets.only(bottom: Get.height / 14.93),
                height: 350,
                width: Get.height,
                decoration: BoxDecoration(
                  color: AppColors.activeColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: 25,
                    ),
                    Obx(() => controller.isNull1.value ? SizedBox(
                              height: 150,
                              width: 150,
                              child: Lottie.asset(
                                  "assets/lotties/lottie_question.json",
                                  reverse: false,
                                  repeat: true,
                              ),
                    )
                          : Container(
                              height: 100,
                              width: 100,
                              margin: const EdgeInsets.symmetric(vertical: 29),
                              child: controller.isLottie.value
                                  ? Lottie.asset(
                                "assets/lotties/close.json",
                                  reverse: false,
                                  repeat: true,
                              )
                                  : Lottie.asset(
                                "assets/lotties/success.json",
                                  reverse: false,
                                  repeat: true,
                              ),
                            ),
                    ),
                    const SizedBox(height: 15,),
                    Obx(() => controller.isNull1.value ? Center(
                      child: Text(
                        "do_you_want_to_cancel".tr,
                        style: ThemeService.textStyleElevetedButtonStyle,
                      ),
                    ) : Center(
                      child: controller.isLottie.value ? Text(
                        "your_order_did_not_cancelled".tr,
                        style: ThemeService.textStyleElevetedButtonStyle,
                      ): Text(
                        "your_order_successfully_cancelled".tr,
                        style: ThemeService.textStyleElevetedButtonStyle,
                      ),
                    ),),
                    const SizedBox(height: 14,),
                    const Divider(
                      height: 1,
                      color: AppColors.borderColor,
                    ),
                    const SizedBox(height: 22,),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.yourIsNull1();
                              controller.yourIsLottie();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(187, 52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              primary: AppColors.btnColor,
                            ),
                            child:  Text(
                              "no".tr,
                              style: ThemeService.textStyleElevetedButtonStyle2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.changeStatus(order.orderId!);
                              controller.yourIsNull1();
                              controller.yourIsLottieFalse();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(187, 52),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              primary: AppColors.mainColor,
                            ),
                            child:  Text(
                              "yes".tr,
                              style: ThemeService.textStyleElevetedButtonStyle3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
               ),
              );
            },
            child:  Text(
              "cancel_order".tr,
              style: ThemeService.textStyleCancelOrder,
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          GestureDetector(
            onTap: () async {
              if (await canLaunch('tel:${order.roomDto!.chayxanaDto!.phoneNumber}')) {
                await launch('tel:${order.roomDto!.chayxanaDto!.phoneNumber}');
              }
            },
            child:  Text(
              "call".tr,
                style: ThemeService.textStyleCancelOrder,
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.borderColor,
          ),
          GestureDetector(
            onTap: () {
              Get.to(const DetailPage());
            },
            child:  Text(
              "about_teahouse".tr,
                style: ThemeService.textStyleCancelOrder,
            ),
          ),
        ],
      ),
     ),
    );
  }
}
