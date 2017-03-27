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
gem 'steemdata-rb', require: 'steemdata'
```

Then:

```bash
$ bundle install
```

## Usage

Look for a specific post using `author` and `permlink`.

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
   "body": ...
 }
```

You can find posts with a high number of `active_votes`.

```ruby
post = SteemData::Post.where('active_votes.1700' => {'$exists' => true}).last

puts "https://steemit.com/#{post.parent_permlink}/@#{post.author}/#{post.permlink}"
```

Which returns:

```
https://steemit.com/votu/@sirlunchthehost/take-the-vote-negation-poll-now-brought-to-you-by-sirlunchthehost-aka-the-saru-pirate-king
```

Or do the same with `net_votes`.

```ruby
post = SteemData::Post.where(:net_votes.gte => 1700).last

puts "https://steemit.com/#{post.parent_permlink}/@#{post.author}/#{post.permlink}"
```

Which returns:

```
https://steemit.com/votu/@sirlunchthehost/take-the-vote-negation-poll-now-brought-to-you-by-sirlunchthehost-aka-the-saru-pirate-king
```

You can count the number of posts created in the last 24 hours.

```ruby
 > SteemData::Post.where(:created.gte => 24.hours.ago.utc).count
 => 1366
```

Or do the same for a particular topic.

```ruby
 > SteemData::Post.where(parent_permlink: 'life', :created.gte => 24.hours.ago.utc).count
 => 86
```

## Get in touch!

If you're using steemdata-rb, I'd love to hear from you.  Drop me a line and tell me what you think!  I'm @inertia on STEEM.
  
## License

I don't believe in intellectual "property".  If you do, consider Radiator as licensed under a Creative Commons [![CC0](http://i.creativecommons.org/p/zero/1.0/80x15.png)](http://creativecommons.org/publicdomain/zero/1.0/) License.
