<?php
namespace gryphon\view\multimedia;

use foundry\response as Response;
use foundry\fs\path as Path;
use foundry\view as View;
use foundry\view\template as Template;
use foundry\url as URL;

use foundry\model as M;

/*
 Function: main
  Main action and default callback for the section controller

 Parameters:
  request - _object_ current request instances
  payload - _mixed_ payload returned from controller action
  kwargs - _array_ (optional) additional keyword arguments

 Returns:
  _object_ returns foundry\request instance

 Namespace:
  \gryphon\view\multimedia
*/
function main($request, $payload, $kwargs=array()) {
	$slug = $payload['slug'];

	$ext = 'tpl';

	if( $slug ) {
		$str = sprintf('multimedia/templates/%s.%s', $slug, $ext);
		$payload['subActive'] = ucfirst($slug);
	} else {
		$str = sprintf('multimedia/main.%s', $ext);
	}

    if( $slug == 'video' ) {
        $id = false;
        $slug = false;

        $topMedia = false;

        $limit = 20;
        $start = 0;
        $page = $request->get('page', 'num');

        if( $page && $page >= 0 ) {
            $start = $page * $limit;
        }

        if( !($id = $request->get(':id', 'num')) ) {
            $id = $request->get(':slug', 'num');
        }

        $slug = $request->get(':slug', 'specialChars');

        $media = M::init('gryphon:media');
        if( !\admin\lib\auth::hasSession() ) {
            $media->where('self:status = 1');
        }

        $media = $media
            ->order('self:created desc')
            ->limit($start.', '.$limit);
        $tags = M::init('gryphon:tag')->findByName('multimedia');

        $media = $media
            ->where('self:type = "youtube" or self:type = "vimeo"')
            ->find();

        $url = 'gryphon:multimedia';
        if( $slug ) {
            $url .= '/'.$slug;
        }
        if( $id ) {
            $url .= '/'.$id;
        }

        $pag = new \foundry\model\paginator($media, $page, $limit, 5);
        $pag->setURL($url, array(
            'page' => '%PAGE%'
        ));

        if( $topMedia ) {
            $media->pop();
            $media->unshift($topMedia);
        }

        $payload['media'] = $media;
        $payload['pagination'] = $pag;
    }

	$s = $request->getSession();

	$payload['referrer'] = $s->get('article_referrer');

	$tpl = new Template($str);

	$res = new Response;
	$res->content = $tpl->render($payload);

	return $res;
}

?>