import 'package:covid_app/app/model/articles.dart';
import 'package:covid_app/app/model/news.dart';
import 'package:covid_app/app/respository/news_container_repository.dart';
import 'package:covid_app/app/ui/new_details/news_details_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'news_container_viewmodel.g.dart';

class NewsContainerViewModel = _NewsContainerViewModelBase
    with _$NewsContainerViewModel;

abstract class _NewsContainerViewModelBase with Store {
  NewsContainerRepository repository = NewsContainerRepository();

  @observable
  News data;

  @action
  Future<List<Articles>> getData() async {
    final response = await repository.getPosts();
    return response;
  }

  void navigateToDetails(context, title, author, publicationAt, content) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => NewsDetailsPage(
                  title: title,
                  author: author,
                  publicationAt: publicationAt,
                  description: content,
                )));
  }
}
