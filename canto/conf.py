from canto.extra import *
import os

# Handlers when in Linux console or xterm
if os.getenv("TERM") == "linux":
    link_handler("elinks \"%u\"", text=True)
    image_handler("fbi \"%u\"", text=True, fetch=True)
else:
    link_handler("chromeplus \"%u\"")
    image_handler("feh \"%u\"", fetch=True)

# Non-HTML Content
link_handler("mplayer -someoptions \"%u\"", ext="mp3")

# PDF Handling
link_handler("apvlv \"%u\"", ext="pdf", fetch=True)

# Image Handling
image_handler("feh \"%u\"", text=True, fetch=True)

# Max column width of 65 characters
def resize_hook (cfg):
    cfg.columns = cfg.width / 65

# Never discard items I haven't seen
never_discard("unread")

# I prefer change_tag to interval
# Uncomment these to use it too

# triggers.remove("interval")
# triggers.append("change_tag")

keys['/'] = search_filter
keys['y'] = yank

# Use [ / ] to switch between global filters
filters=[show_unread, None]

# Make unread items float to the top, when not
# using show_unread filter
default_tag_sorts([by_unread])

# Selected Feeds
default_rate(30)    # News feeds
add("http://feeds.feedburner.com/codinghorror")
add("http://feeds.reuters.com/reuters/oddlyEnoughNews")
add("http://feeds.reuters.com/reuters/domesticNews")
add("http://feeds.reuters.com/reuters/scienceNews")
add("http://feeds.reuters.com/reuters/topNews")
add("http://feeds.reuters.com/reuters/sportsNews")
add("http://feeds.reuters.com/reuters/healthNews")
add("http://news.cnet.com/8300-13772_3-52.xml")
add("http://news.cnet.com/8300-30685_3-264.xml")
add("http://news.cnet.com/2547-11386_3-0-5.xml")
add("http://news.cnet.com/8300-13578_3-38.xml")
add("http://www.nytimes.com/services/xml/rss/nyt/HomePage.xml")
add("http://digg.com/rss/containerentertainment.xml")
add("http://digg.com/rss/containergaming.xml")
add("http://digg.com/rss/containeroffbeat.xml")
add("http://digg.com/rss/containerscience.xml")
add("http://digg.com/rss/containersports.xml")
add("http://digg.com/rss/containertechnology.xml")
add("http://digg.com/rss/containerworld_business.xml")
add("http://feeds.gawker.com/gizmodo/excerpts.xml")
add("http://www.npr.org/rss/rss.php?id=1004")
add("http://www.npr.org/rss/rss.php?id=1001")
add("http://www.linux.com/feature/?theme=rss")
add("http://www.linux.com/feature/c4201?theme=rss")
add("http://www.archlinux.org/feeds/news/")
add("http://www.archlinux.org/feeds/packages/")
add("http://rss.slashdot.org/Slashdot/slashdot")
add("http://rss.slashdot.org/Slashdot/slashdotDevelopers")
add("http://rss.slashdot.org/Slashdot/slashdotGames")
add("http://rss.slashdot.org/Slashdot/slashdotLinux")
add("http://rss.slashdot.org/Slashdot/slashdotPolitics")
add("http://rss.slashdot.org/Slashdot/slashdotScience")
add("http://blog.wired.com/underwire/atom.xml")
add("http://blog.wired.com/wiredscience/atom.xml")
add("http://feeds.wired.com/wired/politics/security")
add("http://feeds.feedburner.com/DiscoverHealthMedicine")
add("http://feeds.feedburner.com/DiscoverMindBrain")
add("http://feeds.feedburner.com/DiscoverTechnology")
add("http://feeds.feedburner.com/DiscoverSpace")
add("http://feeds.feedburner.com/DiscoverEnvironment")
add("http://discovermagazine.com/topics/physics-math/rss.xml")
add("http://feeds.feedburner.com/TechCrunch")
add("http://feeds.feedburner.com/CrunchGear")
add("http://feeds.huffingtonpost.com/huffingtonpost/raw_feed")
add("http://feeds.huffingtonpost.com/huffingtonpost/LatestNews")
add("http://feeds.boingboing.net/boingboing/iBag")
add("http://www.xkcd.com/rss.xml")
#add("")
#...

# Blog Feeds
default_rate(120)   # Slow blog feeds
add("http://feeds.feedburner.com/wired27b")
add("http://feeds.feedburner.com/80beats")
add("http://feeds.feedburner.com/BadAstronomyBlog")
add("http://feeds.feedburner.com/CosmicVariance")
add("http://feeds.feedburner.com/DiscoverDiscoblog")
add("http://feeds.feedburner.com/GeneExpressionBlog")
add("http://feeds.feedburner.com/NotRocketScience")
add("http://feeds.feedburner.com/VisualScience")
add("http://feeds.mashable.com/Mashable")
add("http://thinkprogress.org/feed/")
add("http://feeds.feedburner.com/BigGovernment")
#add("")

# Quick Feeds
#default_rate(1)     # Quick feed
#default_keep(100)   # Lots of items could be missed
#add("http://quick1")
#add("http://quick2")

# Colors
colors[0] = (68, 234)
colors[1] = (181, 234)
colors[2] = (237, 234)

