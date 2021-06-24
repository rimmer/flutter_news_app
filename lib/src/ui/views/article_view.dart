import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/models/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatelessWidget {
  const ArticleView(this.article, this.source) : super();
  final Article article;
  final bool source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        _header(context),
        SizedBox(height: 12),
        Expanded(
            child: WebView(
                initialUrl: article.url,
                javascriptMode: JavascriptMode.unrestricted)),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CantonBackButton(isClear: true),
          Text(
            article.name,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          CantonHeaderButton(
            backgroundColor: CantonColors.transparent,
            icon: Container(),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  String authorName() {
    return [null, '', 'http', 'HTTP'].contains(article.author)
        ? 'BY UNKNOWN'
        : article.author.toUpperCase().contains('BY ')
            ? article.author.toUpperCase()
            : article.author.contains(',')
                ? article.author
                    .toUpperCase()
                    .substring(0, article.author.indexOf(','))
                : 'BY ' + article.author.toUpperCase();
  }
}
