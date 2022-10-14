import 'package:dio/dio.dart';

class DioHelper
{
  static   late Dio dio;
  static init()
  {
    dio = Dio(BaseOptions(
      baseUrl:'https://newsapi.org' ,
      receiveDataWhenStatusError: true,)
    );
  }
   static Future<Response> getData({required String url,required Map<String,dynamic> ?query}) async
  {
    return await dio.get(url,queryParameters: query);
  }

}
// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6e1a2d469d044c86bb8aa985f0b63c4c
//{
// "status": "ok",
// "totalResults": 66,
// -"articles": [
// -{
// -"source": {
// "id": null,
// "name": "CNBC"
// },
// "author": "Tanaya Macheel, Samantha Subin",
// "title": "Stocks fall as investors digest September jobs report, Dow drops more than 500 points - CNBC",
// "description": "The major averages are on track for weekly gains, despite taking a spill on Thursday.",
// "url": "https://www.cnbc.com/2022/10/06/stock-market-futures-open-to-close-news.html",
// "urlToImage": "https://image.cnbcfm.com/api/v1/image/107129952-1664999922452-gettyimages-1243750977-AA_05102022_890221.jpeg?v=1665148836&w=1920&h=1080",
// "publishedAt": "2022-10-07T16:29:00Z",
// "content": "Asset prices may feel soft everywhere this week, but not in the oil patch. Maybe it has to do with OPEC+ agreeing midweek to cut future crude oil production.\r\nEarly Friday, before September's nonfarm… [+1023 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "The Guardian"
// },
// "author": "Gloria Oladipo",
// "title": "Top robot companies pledge not to add weapons to their tech to avoid harm risk - The Guardian",
// "description": "Leading robotics firms promise not to add weapons to general use technology and said they would oppose others doing so",
// "url": "https://www.theguardian.com/technology/2022/oct/07/killer-robots-companies-pledge-no-weapons",
// "urlToImage": "https://i.guim.co.uk/img/media/70a8a77b5f9b6a65445d63adafa32b87c3e42823/0_103_3500_2101/master/3500.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctZGVmYXVsdC5wbmc&enable=upscale&s=70bcad736640c076fd6c19ae63ba049d",
// "publishedAt": "2022-10-07T16:08:00Z",
// "content": "Several robot production companies have pledged not to support the weaponization of their general purpose robots and have encouraged other companies to follow suit.\r\nIn an open letter, six leading ro… [+2219 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "Barron's"
// },
// "author": "Al Root",
// "title": "Tesla Won't Stop Falling Until Musk Stops Selling. Here's Where the Stock Is Headed. - Barron's",
// "description": "Tesla stock is forming a bearish head-and-shoulders pattern. And with CEO Elon Musk likely selling more stock to fund his Twitter purchase, shares of the electric-vehicle giant might have further to fall.",
// "url": "https://www.barrons.com/articles/tesla-stock-elon-musk-sales-twitter-51665156048",
// "urlToImage": "https://images.barrons.com/im-639217/social",
// "publishedAt": "2022-10-07T15:21:00Z",
// "content": "Tesla\r\nstock has been having a terrible week, and its likely to get worse for the shares before it gets better. There are a few reasons for that. One is technical, the other is CEO Elon Musk. \r\nThe w… [+232 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "CNBC"
// },
// "author": "Jessica Dickler",
// "title": "'The month of unprecedented deals' — From Amazon to Target, here's what you need to know about the early holiday sales going on now - CNBC",
// "description": "Retailers are kicking off a slew of holiday deals earlier than ever before. Here's a rundown of some of the sales events happening now.",
// "url": "https://www.cnbc.com/2022/10/07/amazons-prime-early-access-sale-2022-here-are-the-best-deals.html",
// "urlToImage": "https://image.cnbcfm.com/api/v1/image/106992129-1640090624214-gettyimages-1237359066-AFP_9V23W4.jpeg?v=1665155631&w=1920&h=1080",
// "publishedAt": "2022-10-07T15:13:51Z",
// "content": "Amazon's Prime Early Access sale: What's in store\r\nWhen Amazon's sale kicks off Oct. 11, expect to find the best discounts on Amazon devices, such as the Kindle, Echo and Fire TV streamer, and its pr… [+4845 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "The-sun.com"
// },
// "author": "Israel Salas-Rodriguez",
// "title": "Panic at Union Square after ‘unknown substance’ causes passengers to cough and vomit and cops shut down sta... - The US Sun",
// "description": "",
// "url": "https://www.the-sun.com/news/6389953/panic-union-square-manhattan-unknown-substance-released/",
// "urlToImage": "https://www.the-sun.com/wp-content/uploads/sites/6/2022/10/GettyImages-467790168.jpg?strip=all&quality=100&w=1920&h=1080&crop=1",
// "publishedAt": "2022-10-07T15:11:10Z",
// "content": "AN unknown substance that was released on a subway platform caused several straphangers to vomit and cough uncontrollably.\r\nThe terrifying incident unfolded inside Manhattan's 14 Street-Union Square … [+2188 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "TheStreet"
// },
// "author": "Bret Kenwell",
// "title": "AMD Stock Is Hitting Lows. Here's When to Buy. - TheStreet",
// "description": "AMD stock is hitting 52-week lows as it reports disappointing preliminary revenue results. Here's when to buy the chipmaker's shares.",
// "url": "https://www.thestreet.com/investing/amd-stock-is-hitting-lows-heres-when-to-buy-technical-analysis",
// "urlToImage": "https://www.thestreet.com/.image/t_share/MTkyMDMwMjc2NDg0ODY3NTI3/amd-nvidia-lead-js-090122.jpg",
// "publishedAt": "2022-10-07T14:41:49Z",
// "content": "Advanced Micro Devices  (AMD)  finally slipped up, just as Nvidia  (NVDA)  did a few months ago. \r\nShares of the veteran chipmaker are down 8% on Friday, but not because they're following the broader… [+2571 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "YouTube"
// },
// "author": null,
// "title": "The U.S. economy is going to hit the brakes hard, says Hayman Capital's Kyle Bass - CNBC Television",
// "description": "Kyle Bass, founder and CIO of Hayman Capital Management, joins CNBC's \"Squawk Box\" to react to September's key jobs report and what it means for the Federal ...",
// "url": "https://www.youtube.com/watch?v=y8JZU56rclY",
// "urlToImage": "https://i.ytimg.com/vi/y8JZU56rclY/hqdefault.jpg",
// "publishedAt": "2022-10-07T13:53:00Z",
// "content": null
// },
// -{
// -"source": {
// "id": "bloomberg",
// "name": "Bloomberg"
// },
// "author": null,
// "title": "ESPN Nears Large New Partnership With DraftKings (DIS, DKNG) - Bloomberg",
// "description": null,
// "url": "https://www.bloomberg.com/tosv2.html?vid=&uuid=e97a180b-4650-11ed-8f5a-744743507065&url=L25ld3MvYXJ0aWNsZXMvMjAyMi0xMC0wNi9lc3BuLXNhaWQtdG8tYmUtbmVhci1sYXJnZS1uZXctcGFydG5lcnNoaXAtd2l0aC1kcmFmdGtpbmdz",
// "urlToImage": null,
// "publishedAt": "2022-10-07T13:51:42Z",
// "content": "To continue, please click the box below to let us know you're not a robot."
// },
// -{
// -"source": {
// "id": "reuters",
// "name": "Reuters"
// },
// "author": null,
// "title": "Binance-linked blockchain hit by $570 million crypto hack - Reuters",
// "description": "A blockchain linked to Binance, the world's largest crypto exchange, has been hit by a $570 million hack, a Binance spokesperson said on Friday, the latest in a series of hacks to hit the crypto sector this year.",
// "url": "https://www.reuters.com/technology/hackers-steal-around-100-million-cryptocurrency-binance-linked-blockchain-2022-10-07/",
// "urlToImage": "https://www.reuters.com/resizer/ABCMh9ikIDmGih0GHVx53KYFDZU=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/4ZFQ6IKNTRNMDEZFGMD2XWOR2E.jpg",
// "publishedAt": "2022-10-07T13:30:00Z",
// "content": "LONDON, Oct 7 (Reuters) - A blockchain linked to Binance, the world's largest crypto exchange, has been hit by a $570 million hack, a Binance spokesperson said on Friday, the latest in a series of ha… [+2319 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "Fox Business"
// },
// "author": "Caitlin McFall",
// "title": "UK warns of three-hour winter blackouts if gas demand falls short - Fox Business",
// "description": "The U.K. national power operator has warned that citizens should brace for up to three-hour energy blackouts this winter in the 'unlikely' event gas supplies dwindle.",
// "url": "https://www.foxbusiness.com/politics/uk-warns-three-hour-winter-blackouts-gas-demand-falls-short",
// "urlToImage": "https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2022/10/0/0/GettyImages-501418510.jpg?ve=1&tl=1",
// "publishedAt": "2022-10-07T12:57:24Z",
// "content": "The U.K. national power operator has warned that citizens should brace for up to three-hour power blackouts this winter in the \"unlikely\" event that gas supplies fall short.\r\nThe National Grid's Elec… [+3229 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "CNBC"
// },
// "author": "Jennifer Liu",
// "title": "Remote work could keep fueling high turnover: 'The map is open for job seekers' - CNBC",
// "description": "More than 4 million people have quit each month for the past 15 months.",
// "url": "https://www.cnbc.com/2022/10/07/remote-work-could-keep-fueling-high-turnover.html",
// "urlToImage": "https://image.cnbcfm.com/api/v1/image/107129925-1664997919975-gettyimages-1363267248-sherri_family_2727.jpeg?v=1665145801&w=1920&h=1080",
// "publishedAt": "2022-10-07T12:30:01Z",
// "content": "More than 4 million people quit their jobs in August, marking the 15th straight month where as many people left their old jobs for something new. That's despite months of headlines indicating compani… [+4224 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "Yahoo Entertainment"
// },
// "author": "Pras Subramanian",
// "title": "Musk: Tesla Semi truck coming in December, first deliveries to Pepsi - Yahoo Finance",
// "description": "As if Elon Musk’s week couldn’t be more eventful, the Tesla CEO gave the automotive world more news to chew on.\nIn a tweet last night, Musk said Tesla has...",
// "url": "https://finance.yahoo.com/news/musk-tesla-semi-truck-coming-in-december-first-deliveries-to-pepsi-122909513.html",
// "urlToImage": "https://s.yimg.com/ny/api/res/1.2/pwsbGPAD7ROYoIVqXpjqDg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD03NTA-/https://s.yimg.com/os/creatr-uploaded-images/2022-10/708debb0-463a-11ed-bff9-bf625547ab36",
// "publishedAt": "2022-10-07T12:29:09Z",
// "content": "As if Elon Musks week couldnt be more eventful, the Tesla (TSLA) CEO gave the automotive world more news to chew on.\r\nIn a tweet last night, Musk said Tesla has begun production of its long-awaited e… [+1578 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "YouTube"
// },
// "author": null,
// "title": "Stock Market Coverage - Friday October 7 Yahoo Finance - Yahoo Finance",
// "description": "#bonds #bitcoin #Biden #Stockmarket #coronavirus #memestocks #Fed#YahooFinance #investing #stockmarket #bitcoin #cryptoThe latest market coverage and big int...",
// "url": "https://www.youtube.com/watch?v=NDK8QAnFNxU",
// "urlToImage": "https://i.ytimg.com/vi/NDK8QAnFNxU/maxresdefault_live.jpg",
// "publishedAt": "2022-10-07T12:24:07Z",
// "content": null
// },
// -{
// -"source": {
// "id": "reuters",
// "name": "Reuters"
// },
// "author": null,
// "title": "Samsung's earnings slump on rapid drop-off in chip demand - Reuters",
// "description": "Samsung Electronics Co Ltd <a href=\"https://www.reuters.com/companies/005930.KS\" target=\"_blank\">(005930.KS)</a> flagged a worse-than-expected 32% drop in quarterly operating earnings on Friday, as an economic downturn slashed demand for electronic devices an…",
// "url": "https://www.reuters.com/technology/samsung-elec-q3-profit-likely-fell-32-demand-slumped-downturn-2022-10-06/",
// "urlToImage": "https://www.reuters.com/resizer/RH4NAgs1vDkR4utP16a8Zv4cFoc=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/XAZ6EDUXZJOMRBV3VN2BOHWLVM.jpg",
// "publishedAt": "2022-10-07T11:40:00Z",
// "content": "SEOUL, Oct 7 (Reuters) - Samsung Electronics Co Ltd (005930.KS) flagged a worse-than-expected 32% drop in quarterly operating earnings on Friday, as an economic downturn slashed demand for electronic… [+4319 chars]"
// },
// -{
// -"source": {
// "id": "engadget",
// "name": "Engadget"
// },
// "author": "https://www.engadget.com/about/editors/mariella-moon",
// "title": "Amazon will no longer publicly test its Scout delivery robots - Engadget",
// "description": "It's also 'reorienting' the program and matching team members to other roles within the company..",
// "url": "https://www.engadget.com/amazon-ends-scout-robot-test-113516997.html",
// "urlToImage": "https://s.yimg.com/os/creatr-uploaded-images/2022-10/b4a3a070-4625-11ed-a75d-e0916cdd5a37",
// "publishedAt": "2022-10-07T11:35:48Z",
// "content": "Amazon's Scout robot, a small machine that looks like a cooler and can navigate sidewalks, won't be delivering anybody's packages anymore. The e-commerce giant has shut down field testing for the exp… [+1661 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "CNBC"
// },
// "author": "Michael Wayland",
// "title": "New cars are finally back in stock — but Americans might not be able to afford them - CNBC",
// "description": "The Federal Reserve aggressively increasing interest rates could slow a sales rebound for the U.S. automotive industry.",
// "url": "https://www.cnbc.com/2022/10/07/new-cars-are-finally-back-in-stock-but-they-come-at-a-steep-price.html",
// "urlToImage": "https://image.cnbcfm.com/api/v1/image/106876589-16197931072021-04-30t142836z_612620112_rc2e6n9006lk_rtrmadp_0_usa-economy.jpeg?v=1665140401&w=1920&h=1080",
// "publishedAt": "2022-10-07T11:00:01Z",
// "content": "Vehicles are displayed for sale at an AutoNation car dealership on April 21, 2022 in Valencia, California.\r\nDETROIT New cars are slowly becoming more widely available, as supply chain bottlenecks fin… [+5656 chars]"
// },
// -{
// -"source": {
// "id": "cnn",
// "name": "CNN"
// },
// "author": "Nicole Goodkind",
// "title": "OPEC's production cut is a win for oil stocks - CNN",
// "description": "The White House isn't very happy with OPEC's decision to slash oil production by 2 million barrels per day. Consumers won't be big fans either, as the move will likely send gas prices higher.",
// "url": "https://www.cnn.com/2022/10/07/investing/premarket-trading-stocks/index.html",
// "urlToImage": "https://media.cnn.com/api/v1/images/stellar/prod/221006143018-khurais-oil-field-file.jpg?c=16x9&q=w_800,c_fill",
// "publishedAt": "2022-10-07T10:51:00Z",
// "content": "A version of this story first appeared in CNN Business Before the Bell newsletter. Not a subscriber? You can sign up right here. You can listen to an audio version of the newsletter by clicking the s… [+6213 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "Endpoints News"
// },
// "author": "Beth Snyder Bulik",
// "title": "Eli Lilly hits the gas on tirzepatide in obesity, nabs rolling submission for potential blockbuster indication - Endpoints News",
// "description": "In the already buzzy obesity drug market, Eli Lilly is the latest newsmaker, nabbing a fast-track designation and rolling review from the FDA on Thursday. While Lilly’s tirzepatide study in obesity initially read out positive results in April, it’s initiating…",
// "url": "https://endpts.com/eli-lilly-hits-the-gas-on-tirzepatide-in-obesity-nabs-rolling-submission-for-potential-blockbuster-indication/",
// "urlToImage": "https://endpts.com/wp-content/uploads/2021/12/David-Ricks-Getty-1-scaled.jpg",
// "publishedAt": "2022-10-07T10:34:14Z",
// "content": "In the already buzzy obesity drug market, Eli Lilly is the latest newsmaker, nabbing a fast-track designation and rolling review from the FDA on Thursday.\r\nWhile Lilly’s tirzepatide study in obesity … [+498 chars]"
// },
// -{
// -"source": {
// "id": null,
// "name": "New Hampshire Public Radio"
// },
// "author": "Susan Phillips",
// "title": "'Steam loops' under many cities could be a climate change solution - New Hampshire Public Radio",
// "description": "\"Steam loops\" under hundreds of U.S. cities and universities have warmed buildings for a century. Now they could become a climate change solution.",
// "url": "https://www.nhpr.org/2022-10-07/steam-loops-under-many-cities-could-be-a-climate-change-solution",
// "urlToImage": "https://npr.brightspotcdn.com/dims4/default/cc54f8d/2147483647/strip/true/crop/3000x1575+0+212/resize/1200x630!/quality/90/?url=https%3A%2F%2Fmedia.npr.org%2Fassets%2Fimg%2F2022%2F10%2F06%2F2022-06-11-k-paynter-vicinity-steram-loop-raw-files-14-of-23-_custom-13c6fb420d8e2b3d543773c52eebb50585a0c68a.jpg",
// "publishedAt": "2022-10-07T10:21:00Z",
// "content": "Across North America, hundreds of downtowns, college campuses and hospitals are heated by steam carried through networks of underground pipes. Electric companies installed many of these \"steam loops\"… [+7571 chars]"
// },
// -{
// -"source": {
// "id": "the-wall-street-journal",
// "name": "The Wall Street Journal"
// },
// "author": "Anna Hirtenstein, Margot Patrick",
// "title": "Credit Suisse Stock Price Jumps After $3 Billion Bond Buyback - The Wall Street Journal",
// "description": "The Wall Street Journal’s full markets coverage.",
// "url": "https://www.wsj.com/livecoverage/stock-market-news-today-2022-10-07",
// "urlToImage": "https://images.wsj.net/im-639103/social",
// "publishedAt": "2022-10-07T10:20:10Z",
// "content": null
// }
// ]
// }