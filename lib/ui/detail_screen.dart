import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita',
          style: textTheme.headline1,
        ),

        // Back button
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News title
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                style: textTheme.headline2,
              ),

              SizedBox(height: 8,),

              // News date
              Text(
                'Sunday, 01 March 2021 by Lorem Ipsum',
                style: textTheme.subtitle1
              ),

              SizedBox(height: 16,),

              // News image
              Image.network(
                'https://asset.kompas.com/crops/xAqIt1VurCw-ncN41E0vag75IbQ=/0x0:1000x667/780x390/filters:watermark(data/photo/2020/03/10/5e6775d554370.png,0,-0,1)/data/photo/2020/11/06/5fa565d9943e3.jpg'
              ),

              SizedBox(height: 8,),

              // News link
              RichText(
                text: TextSpan(
                  text: 'Klik untuk melihat artikel asli.',
                  style: textTheme.caption,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch('https://github.com');
                    }
                ),
              ),

              SizedBox(height: 16,),

              // News content
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam vestibulum morbi blandit cursus risus. Proin gravida hendrerit lectus a. Blandit turpis cursus in hac habitasse platea dictumst quisque. Viverra adipiscing at in tellus. Nulla facilisi nullam vehicula ipsum a arcu cursus. Consequat ac felis donec et. Est ultricies integer quis auctor elit sed vulputate mi. Massa placerat duis ultricies lacus sed turpis. Et tortor consequat id porta nibh venenatis cras sed felis. Arcu ac tortor dignissim convallis aenean et tortor at risus. Risus ultricies tristique nulla aliquet. Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada nunc. Diam quam nulla porttitor massa id. Pharetra convallis posuere morbi leo urna molestie at. Pharetra magna ac placerat vestibulum lectus mauris ultrices. Turpis egestas maecenas pharetra convallis posuere morbi. Ornare massa eget egestas purus viverra accumsan in nisl nisi. Libero enim sed faucibus turpis in eu mi. A erat nam at lectus urna duis convallis convallis tellus.',

                style: textTheme.bodyText1,
              ),

            ]
          ),
        ),
      )
    );
  }
}