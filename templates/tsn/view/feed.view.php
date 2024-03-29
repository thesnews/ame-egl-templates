<?php
namespace tsn\view\feed;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\url as URL;
use foundry\config as Conf;

use foundry\model as M;

function main($request, $payload, $kwargs=array()) {
	$response = new Response;
	$feed = $payload['feed'];
	$items = $payload['items'];

	$pfx = '';
	if( $feed->full_content ) {
		include_once 'tsn/serializers/tsn_'.$feed->type.'.class.php';
		$pfx = 'tsn_';
	}

	if( $feed->type == 'atom' ) {
		$entries = $items->serialize($pfx.'atom');
		$lastUpdate = date('c', $items->peekBack()->getCreated());

		$link = URL::site('/', true);

$response->content = <<<ATOM
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
	<title>{$feed->title}</title>
	<link href="{$link}" rel="self" />
	<id>{$feed->url}</id>
	<updated>{$lastUpdate}</updated>
	$entries
</feed>
ATOM;

		$response->setHeader('Content-Type', 'application/atom+xml; charset=utf-8');
	} elseif( $feed->type == 'rss' ) {
		$entries = $items->serialize($pfx.'rss');
		if( $items->length ) {
			$lastUpdate = date('r', $items->peekFront()->getCreated());
		}
		$buildDate = date('r', time());

		$link = URL::site('/', true);

		$v = sprintf('Gryphon %s', \foundry\config::get('gryphon:version'));
		$c = date('Y').' '.Conf::get('publication:name');

$response->content = <<<RSS
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:media="http://search.yahoo.com/mrss/">
	<channel>
		<title>{$feed->title}</title>
		<link>{$link}</link>
		<pubDate>{$buildDate}</pubDate>
		<lastBuildDate>{$lastUpdate}</lastBuildDate>
		<generator>{$v}</generator>
		<copyright>{$c}</copyright>
		<description>{$feed->description}</description>
		$entries
	</channel>
</rss>
RSS;

		$response->setHeader('Content-Type', 'application/rss+xml; charset=utf-8');
	} elseif( $feed->type == 'podcast' ) {
		$entries = $items->serialize('podcast');
		$lastUpdate = date('r', $items->peekFront()->created);
		$buildDate = date('r', time());

		$link = URL::site('/', true);

		$v = sprintf('Gryphon %s', \foundry\config::get('gryphon:version'));
		$c = date('Y').' '.Conf::get('publication:name');

		$i = '';

		if( $feed->media->length ) {
			$image = $feed->media->pop();

			$i = sprintf('<itunes:image href="%s" />', $image->url);

		}


$response->content = <<<RSS
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
	<channel>
		<title>{$feed->title}</title>
		<link>{$link}</link>
		<pubDate>{$buildDate}</pubDate>
		<lastBuildDate>{$lastUpdate}</lastBuildDate>
		<generator>{$v}</generator>
		<description>{$feed->description}</description>
		<copyright>{$c}</copyright>
		<itunes:summary>{$feed->description}</itunes:summary>
		{$i}
		$entries
	</channel>
</rss>
RSS;

		$response->setHeader('Content-Type', 'application/rss+xml');
	}


	return $response;
}

?>