import 'package:covid_app/app/ui/new_details/details_component.dart';
import 'package:covid_app/app/utils/empty_state.dart';
import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsDetailsPage extends StatelessWidget {
  String title;
  String author;
  String publicationAt;
  String description;

  NewsDetailsPage(
      {this.title, this.author, this.publicationAt, this.description});

  Widget returnDetails() {
    if (title == null ||
        author == null ||
        publicationAt == null ||
        description == null) {
      return EmptyState();
    } else {
      return DetailsComponent(
        title: title,
        author: author,
        publicationAt: publicationAt,
        description: description,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return returnDetails();
  }
}
