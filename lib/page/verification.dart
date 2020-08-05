import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_login_register_firebase/bloc/verification_bloc.dart';
import 'package:flutter_login_register_firebase/model/account.dart';

class Verification extends StatefulWidget {
  Verification({Key key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  Account account = Account();

  @override
  void initState() {
    triggerPhoneNumberCode(context, Account.verifyPhoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 412, height: 640);
    return Scaffold(
        appBar: AppBar(
          title: Text('Verification'),
        ),
        body: BlocConsumer<VerificationBloc, VerificationState>(
          listener: (context, state) {
            if (state is VerificationSuccess) {
              Navigator.pushNamed(context, '/home');
            }
          },
          builder: (context, state) {
            return buildVerificationInitial(context);
          },
        ));
  }

  Widget buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  final FocusNode _firstInputFocusNode = new FocusNode();
  final FocusNode _secondInputFocusNode = new FocusNode();
  final FocusNode _thirdInputFocusNode = new FocusNode();
  final FocusNode _fourthInputFocusNode = new FocusNode();
  final FocusNode _fifthInputFocusNode = new FocusNode();
  final FocusNode _sixthInputFocusNode = new FocusNode();

  Widget buildVerificationInitial(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 60.h,
                width: 54.w,
                margin: EdgeInsets.only(
                  top: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF1F1F3),
                ),
                alignment: Alignment.center,
                child: TextField(
                  focusNode: _firstInputFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF07200), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(34),
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    FocusScope.of(context).requestFocus(_secondInputFocusNode);
                    Account.verificationCode1 = value;
                  },
                ),
              ),
              Container(
                height: 60.h,
                width: 54.w,
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF1F1F3),
                ),
                child: TextField(
                  focusNode: _secondInputFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF07200), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(34),
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    FocusScope.of(context).requestFocus(_thirdInputFocusNode);
                    Account.verificationCode2 = value;
                  },
                ),
              ),
              Container(
                height: 60.h,
                width: 54.w,
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF1F1F3),
                ),
                child: TextField(
                  focusNode: _thirdInputFocusNode,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF07200), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(34),
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    FocusScope.of(context).requestFocus(_fourthInputFocusNode);
                    Account.verificationCode3 = value;
                  },
                ),
              ),
              Container(
                height: 60.h,
                width: 54.w,
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF1F1F3),
                ),
                child: TextField(
                  focusNode: _fourthInputFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF07200), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(34),
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    FocusScope.of(context).requestFocus(_fifthInputFocusNode);
                    Account.verificationCode4 = value;
                  },
                ),
              ),
              Container(
                height: 60.h,
                width: 54.w,
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF1F1F3),
                ),
                child: TextField(
                  focusNode: _fifthInputFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF07200), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(34),
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    FocusScope.of(context).requestFocus(_sixthInputFocusNode);
                    Account.verificationCode5 = value;
                  },
                ),
              ),
              Container(
                height: 60.h,
                width: 54.w,
                margin: EdgeInsets.only(
                  top: 15,
                  left: 10,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFF1F1F3),
                ),
                child: TextField(
                  focusNode: _sixthInputFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFF07200), width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(34),
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (value) {
                    Account.verificationCode6 = value;
                  },
                ),
              ),
            ],
          ),
          Container(
            height: 47,
            width: 200,
            margin: EdgeInsets.only(
              top: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: () {
                triggerVerifyCode(
                    context,
                    Account.verificationCode1,
                    Account.verificationCode2,
                    Account.verificationCode3,
                    Account.verificationCode4,
                    Account.verificationCode5,
                    Account.verificationCode6);
              },
              child: Container(
                child: Text(
                  "Verify",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void triggerPhoneNumberCode(BuildContext context, String phoneNumber) {
  final verificationBloc = BlocProvider.of<VerificationBloc>(context);
  verificationBloc.add(OnSendPhoneNumber(phoneNumber));
}

void triggerVerifyCode(
    BuildContext context,
    String verificationCode1,
    String verificationCode2,
    String verificationCode3,
    String verificationCode4,
    String verificationCode5,
    String verificationCode6) {
  final verificationBloc = BlocProvider.of<VerificationBloc>(context);
  String verificationCode = verificationCode1 +
      verificationCode2 +
      verificationCode3 +
      verificationCode4 +
      verificationCode5 +
      verificationCode6;
  verificationBloc.add(OnVerifyCode(verificationCode));
}
