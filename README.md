[steemdata-rb](https://github.com/steem-third-party/steemdata-rb)
============

Wrapper for accessing [steemdata.com](https://steemdata.com/) in a ruby application.  It uses MongoID and ActiveModel to leverage all of the tools provided by those libraries.

<center>
  [![](https://cl.ly/0l3G3g1V4618/Image%202017-03-02%20at%2010.32.13%20AM.png)](https://github.com/steem-third-party/steemdata-rb)
</center>

> SteemData helps developers and researchers build better STEEM applications. We parse the STEEM blockchain for you, and provide the data as a fast and convenient MongoDB service.

**Note: This wrapper gem is built by @inertia.  SteemData is built by @furion.  Any questions about using this gem should be directed to @inertia.**

### Quick Start

Add the gem to your Gemfile:

```ruby
gem 'steemdata-rb', require: 'steemdata', github: 'steem-third-party/steemdata-rb'
```

Then:

```bash
$ bundle install
```

## Usage

```ruby
require 'steemdata'

SteemData.load

post = SteemData::Post.find_by(author: 'inertia', permlink: 'macintosh-plus')

puts post.to_json
```

Which returns:

```json
{
   "_id":{
      "$oid":"58992d230fbc46e3066fa9b1"
   },
   "abs_rshares":0,
   "active":"2017-01-24T21:28:27.000Z",
   "active_votes":[

   ],
   "allow_curation_rewards":true,
   "allow_replies":true,
   "allow_votes":true,
   "author":"inertia",
   "author_reputation":"66832013171970",
   "author_rewards":41294,
   "body":"Location | Lake of the Pines, CA\n------------ | -------------\nDate | 2017-01-24\nCamera | Canon EOS Rebel T6i\n\n[![IMG_0522220be.jpg](http://www.steemimg.com/images/2017/01/24/IMG_0522220be.jpg)](http://www.steemimg.com/image/Nscmu)\n\n[![IMG_0515591de.jpg](http://www.steemimg.com/images/2017/01/24/IMG_0515591de.jpg)](http://www.steemimg.com/image/NsZY3)\n\n[![IMG_05216fc72.jpg](http://www.steemimg.com/images/2017/01/24/IMG_05216fc72.jpg)](http://www.steemimg.com/image/Ns9li)\n\nAlso see: [Hand Me Downs](https://steemit.com/photography/@inertia/hand-me-downs), [Mac Lounge](https://steemit.com/photography/@inertia/mac-lounge), [Macintosh - [IMG-0014]](https://steemit.com/photography/@inertia/macintosh-img-0014), [Macintosh](https://steemit.com/cats/@inertia/macintosh)",
   "body_length":0,
   "cashout_time":"1969-12-31T23:59:59.000Z",
   "category":"photography",
   "children":3,
   "children_abs_rshares":0,
   "children_rshares2":"0",
   "created":"2017-01-24T19:35:57.000Z",
   "curator_payout_value":{

   },
   "depth":0,
   "id":{
      "$oid":"58992d230fbc46e3066fa9b1"
   },
   "identifier":"@inertia/macintosh-plus",
   "json_metadata":{
      "format":"markdown",
      "tags":[
         "photography",
         "cat",
         "cats",
         "pet",
         "pets"
      ],
      "app":"steemit/0.1",
      "image":[
         "http://www.steemimg.com/images/2017/01/24/IMG_0522220be.jpg",
         "http://www.steemimg.com/images/2017/01/24/IMG_0515591de.jpg",
         "http://www.steemimg.com/images/2017/01/24/IMG_05216fc72.jpg"
      ],
      "links":[
         "http://www.steemimg.com/image/Nscmu",
         "http://www.steemimg.com/image/NsZY3",
         "http://www.steemimg.com/image/Ns9li",
         "https://steemit.com/photography/@inertia/hand-me-downs",
         "https://steemit.com/photography/@inertia/mac-lounge",
         "https://steemit.com/photography/@inertia/macintosh-img-0014",
         "https://steemit.com/cats/@inertia/macintosh"
      ]
   },
   "last_payout":"2017-02-24T20:09:45.000Z",
   "last_update":"2017-01-24T19:35:57.000Z",
   "loaded":true,
   "max_accepted_payout":{

   },
   "max_cashout_time":"1969-12-31T23:59:59.000Z",
   "mode":"archived",
   "net_rshares":0,
   "net_votes":123,
   "openingPostIdentifier":"@inertia/macintosh-plus",
   "parent_author":"",
   "parent_permlink":"photography",
   "pending_payout_value":{

   },
   "percent_steem_dollars":0,
   "permlink":"macintosh-plus",
   "promoted":{

   },
   "reblogged_by":[

   ],
   "replies":[

   ],
   "reward_weight":10000,
   "root_comment":1827921,
   "root_title":"Macintosh Plus",
   "tags":[
      "photography",
      "photography",
      "cat",
      "cats",
      "pet",
      "pets"
   ],
   "title":"Macintosh Plus",
   "total_payout_reward":{

   },
   "total_payout_value":"6.396 SBD",
   "total_pending_payout_value":{

   },
   "total_vote_weight":0,
   "url":"/photography/@inertia/macintosh-plus",
   "vote_rshares":0
}
```

## Get in touch!

If you're using steemdata-rb, I'd love to hear from you.  Drop me a line and tell me what you think!  I'm @inertia on STEEM.
  
## License

I don't believe in intellectual "property".  If you do, consider Radiator as licensed under a Creative Commons [![CC0](http://i.creativecommons.org/p/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/) License.
