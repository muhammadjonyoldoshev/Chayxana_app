import 'dart:async';
import 'dart:convert';
import 'package:chayxana/models/order_dto_new.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../services/constants/app_assets.dart';
import '../../../services/dio_service.dart';
import 'notification/notification_page.dart';

/// Group => III
class HistoryController extends GetxController {

  bool isLoaded = false;
  String data = "date";
  RxBool isNull1 = true.obs;
  RxBool isLottie = false.obs;
  Timer? _timer;
  ApiResponse? response;
  bool isLoading =true;
  int currentPage = 0;
  String selectedMenu = '';

  ///clock style
  String dateFormat(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d-MMMM').format(now);
    return formattedDate;
  }


  ///Notification Icon
  openNot() {
    Get.to(const NotificationPage());
  }


  ///Time formatter
  String timeStemp(int stemp) {
    String time = DateTime.fromMillisecondsSinceEpoch(stemp * 1000).toString();
    String result = time.substring(12, 17);
    return result;
  }


  ///Lotties
  yourIsNull1(){
    isNull1(isNull1.value = false);
  }
  yourIsLottie(){
    isLottie(isLottie.value = true);
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if(timer.tick>1){
        timer.cancel();
      }
      Get.back();
      isNull1.value = true;
      update();
    });
  }
  yourIsLottieFalse(){
    isLottie(isLottie.value = false);
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if(timer.tick>1){
        timer.cancel();
      }
      Get.back();
      isNull1.value = true;
      update();
    });
  }


  final List<String> menus = [AppAssets.homeIC, AppAssets.historyIC, AppAssets.personIC];

  ///Text Limit
  String limitedText(String text) {
    return text.length > 27 ? "${text.substring(0, 27)}..." : text;
  }

  @override
  void onInit() async{
    super.onInit();
    selectedMenu = menus.first;
    getHistoryDataFromNetwork();
    await Future.delayed(const Duration(seconds: 3), () {
      isLoaded = true;
      update();
    });
  }


  ///Changing status
  void changeStatus(String id)async{
    await NetworkService.PUT("${NetworkService.API_CHANGE_STATUS}$id", {},{}) ?? "";
    getHistoryDataFromNetwork();
  }
  

  ///Getting Date from Network
  void getHistoryDataFromNetwork() async{
    isLoading=true;
    update();
    var body =  await  NetworkService.GET("${NetworkService.API_HISTORY_LIST}c73ebcd8-09b3-4820-b9ef-e670b7cb858f", {}) ?? "";
    Map<String, dynamic> json = jsonDecode(body);
    response = ApiResponse.fromJson(json);
    isLoading=false;
    update();
  }
}