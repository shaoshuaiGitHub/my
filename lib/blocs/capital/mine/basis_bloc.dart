import 'package:rxdart/rxdart.dart';
import 'package:youxinbao/ui/pages/page_index.dart';

import "../../../common/component_index.dart";

class BasisBloc implements BlocBase {
  BuildContext bloccontext;
  NetRepository netRepository = NetRepository();

  //个人信息
  BehaviorSubject<UserInfoModel> _userController =
      BehaviorSubject<UserInfoModel>();
  Stream<UserInfoModel> get outUserInfo => _userController.stream;
  StreamSink<UserInfoModel> get _userInfoSink => _userController.sink;

  Future getUserInfo() async {
    TokenReq _getUserInfoByToken = TokenReq(AppInstance.currentUser.token);
    return netRepository.userInfo(_getUserInfoByToken.toJson()).then((resp) {
      if (resp.code == Constant.SUCCESS_CODE) {
        if (resp.data != null) {
          _userInfoSink.add(UserInfoModel.fromJson(resp.data));
        }
      } else {
        if (resp.code == 50008) {
          AppInstance.remove("user");
          Navigator.pushAndRemoveUntil(
            bloccontext,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (Route<dynamic> route) => false,
          );
          AppInstance.putString(Constant.KEY_THEME_COLOR, 'usercolor');
          final ApplicationBloc bloc =
              BlocProvider.of<ApplicationBloc>(bloccontext);
          bloc.sendAppEvent(1);
        }
        showToast(resp.msg);
      }
    });
  }

  //修改出资方授信总金额
  Future modifysMyAuthorMoney(double money) async {
    ModifyMoneyReq _modifyMoneyByToken =
        ModifyMoneyReq(AppInstance.currentUser.token, money);
    return netRepository.modifyMyAuthorMoney(_modifyMoneyByToken.toJson()).then(
      (resp) {
        if (resp.code == Constant.SUCCESS_CODE) {
          showToast(resp.msg);
        } else {
          showToast(resp.msg);
        }
      },
    );
  }

  void showToast(String msg, {int duration, int gravity: 0}) {
    Toast.show(msg, bloccontext, duration: duration, gravity: gravity);
  }

  void dispose() {
    _userController.close();
  }
}
