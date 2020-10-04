import 'package:covid_app/app/ui/quiz/quiz_viewmodel.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';

// ignore: must_be_immutable
class QuestionsContainer extends StatefulWidget {
  Function getQuestionList;

  QuestionsContainer({this.getQuestionList});
  @override
  _QuestionsContainerState createState() => _QuestionsContainerState();
}

class _QuestionsContainerState extends State<QuestionsContainer> {
  var vm = QuizViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: vm.getQuestions(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(thirtySix),
                      ),
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: SelectableTags(
                          height: fiftySix,
                          backgroundContainer: Colors.transparent,
                          padding: EdgeInsets.all(sixteen),
                          borderRadius: BorderRadius.all(
                            Radius.circular(twentyFour),
                          ),
                          borderSide: BorderSide(color: Colors.transparent),
                          boxShadow: [BoxShadow(color: Colors.grey)],
                          activeColor: rosePrimaryColor,
                          color: Color.fromRGBO(243, 243, 243, 1),
                          textColor: darkPrimaryColor,
                          tags: snapshot.data,
                          columns: 1,
                          symmetry: false,
                          alignment: MainAxisAlignment.start,
                          margin: EdgeInsets.only(right: 14, top: 14, left: 5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                backgroundColor: Color.fromRGBO(231, 242, 245, 1),
              ),
            );
          }
        });
  }
}
