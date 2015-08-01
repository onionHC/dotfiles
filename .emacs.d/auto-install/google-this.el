<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: ﾃ彙ersicht</title><link rel="alternate" type="application/wiki" title="Diese Seite bearbeiten" href="http://www.emacswiki.org/emacs?action=edit;id=%c3%9cbersicht" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/minor-edits.rss" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  // https://stackoverflow.com/questions/280634/endswith-in-javascript
  if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
      return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;

	items = toc.getElementsByTagName('a');
	for (var i = 0; i < items.length; i++) {
	  while (items[i].textContent.endsWith('ﾃ｢ﾂ慊�')) {
            var text = items[i].childNodes[0].nodeValue;
	    items[i].childNodes[0].nodeValue = text.substring(0, text.length - 1);
	  }
	}
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://emacswiki.org/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><div class="menu"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/%c3%9cbersicht">ﾃ彙ersicht</a> <a href="http://www.emacswiki.org/emacs/Letzte_%c3%84nderungen" class="local">Letzte ﾃ����derungen</a> <a href="http://www.emacswiki.org/emacs/Neuigkeiten" class="local">Neuigkeiten</a> <a class="local" href="http://www.emacswiki.org/emacs/Suchen">Suchen</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispSektion">ElispSektion</a> <a class="local" href="http://www.emacswiki.org/emacs/KurzAnleitung">KurzAnleitung</a> <a class="local" href="http://www.emacswiki.org/emacs/Impressum">Impressum</a> </span><form method="get" action="http://www.emacswiki.org/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search"><p><label for="search">Suchen:</label> <input type="text" name="search"  size="20" id="search" accesskey="f" /> <label for="searchlang">Sprache:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Los!" /></p></form></div><h1><a href="http://www.emacswiki.org/emacs?search=%22%c3%9cbersicht%22" title="Klicken um nach Verweisen auf diese Seite zu suchen" rel="nofollow">ﾃ彙ersicht</a></h1></div><div class="wrapper"><div class="content browse"><div class="include WikiLanguageMenu"><p><a class="url http outside" href="http://www.emacswiki.org/emacs?interface=de">Deutsch</a> | <a href="http://www.emacswiki.org/emacs?interface=en" class="url http outside">English</a> | <a class="url http outside" href="http://www.emacswiki.org/emacs?interface=es">Espaﾃｱol</a> | <a href="http://www.emacswiki.org/emacs?interface=fr" class="url http outside">Franﾃｧais</a> | <a href="http://www.emacswiki.org/emacs?interface=pt" class="url http outside">Portuguﾃｪs</a> | <a href="http://www.emacswiki.org/emacs?interface=ru" class="url http outside">ﾐ�ﾑτ��������ｺﾐｸﾐｹ</a> | <a class="url http outside" href="http://www.emacswiki.org/emacs?interface=zh-cn">邂�菴謎ｸｭ譁�</a> | <a href="http://www.emacswiki.org/emacs?interface=zh-tw" class="url http outside"> 郢����ｫ比ｸｭ譁�</a> | <a class="url http outside" href="http://www.emacswiki.org/emacs?interface=se">Svenska</a> | <a class="url http outside" href="http://www.emacswiki.org/emacs?interface=ja">譌･譛ｬ隱�</a> | <a class="url http outside" href="http://www.emacswiki.org/emacs?interface=ko">����懋ｵｭ����ｴ</a> | <a class="url http outside" href="http://www.emacswiki.org/emacs?interface=it">Italiano</a> </p></div><p><em>The <a href="http://www.emacswiki.org/emacs/EmacsWiki" class="local">EmacsWiki</a> is dedicated to documenting and discussing <a class="local" href="http://www.emacswiki.org/emacs/EmacsAndXEmacs">EmacsAndXEmacs</a>. See the <a class="local" href="http://www.emacswiki.org/emacs/MissionStatement">MissionStatement</a> for more</em> &#x2013; hier geht es um Editoren der Emacs/XEmacs Familie. &#x263a;</p><ul><li><a href="http://www.emacswiki.org/emacs/TextBearbeiten" class="local">TextBearbeiten</a> &#x2013; Alles was mit dem Editieren von Text <i>Quellcode</i>&#x2026; zu tun hat</li><li><a class="local" href="http://www.emacswiki.org/emacs/ZyklischeBuffer">ZyklischeBuffer</a> &#x2013; Wieviele Leute haben das schon gemacht?</li><li><a href="http://www.emacswiki.org/emacs/EinfachZwischenFensterSpringen" class="local">EinfachZwischenFensterSpringen</a> &#x2013; nicht immer C-x o</li><li><a class="local" href="http://www.emacswiki.org/emacs/AktiveMen%c3%bcs">AktiveMenﾃｼs</a> &#x2013; Die Menﾃｼleiste erscheint nur auf Wunsch</li><li><a href="http://www.emacswiki.org/emacs/EigeneHTMLTimeStamps" class="local">EigeneHTMLTimeStamps</a> &#x2013; Beinflussung des Aussehens der HTML hhmts-Zeitstempel</li><li><a href="http://www.emacswiki.org/emacs/AUCTeXDeutsch" class="local">AUCTeXDeutsch</a> &#x2013; Fﾃｼr (La)TeXniker</li><li><a href="http://www.emacswiki.org/emacs/FileVariablen" class="local">FileVariablen</a> &#x2013; Lokale, Datei-spezifische Einstellungen</li><li><a href="http://www.emacswiki.org/emacs/EmacsOnGermanMac" class="local">EmacsOnGermanMac</a> &#x2013; Mac-Keyboard, Emacs und Umlaute</li><li><a href="http://www.emacswiki.org/emacs/OctaveMode" class="local">OctaveMode</a> &#x2013; Octave-Mode unter Windows mit Xemacs</li><li>Deutschsprachige Sites zum Emacs im ODP &#x2013; Unter <a class="url http" href="http://dmoz.org/World/Deutsch/Computer/Software/Editoren/Emacs/">http://dmoz.org/World/Deutsch/Computer/Software/Editoren/Emacs/</a> sind deutschprachige Sites, die sich mit dem Emacs beschﾃ､ftigen gelistet. Ergﾃ､nzungen sind mehr als willkommen.</li><li><a href="http://www.emacswiki.org/emacs/AnSysDe" class="local">AnSysDe</a> &#x2013; Ansys mode </li><li><a class="url http outside" href="http://www.emacswiki.org/emacs-de/YasnippetDeutsch">YASnippet</a> &#x2013; Vorlagen einfﾃｼgen ﾃｼber Schlﾃｼsselwﾃｶrtern und Tab-Taste</li></ul><p>Meiner Meinung nach mﾃｼssen wir mit dem Organisieren der Seiten erst anfangen, wenn die Liste der deutschen Seiten unﾃｼbersichtlich lang geworden ist. Davon sind wir noch weit entfernt. &#x263a; &#x2013; <a href="http://www.emacswiki.org/emacs/AlexSchroeder" class="local">AlexSchroeder</a></p><dl><dt>XEmacs Besonderheiten</dt><dd>Schreib einfach auf die Seite: &#x201c;Folgendes gilt nur fﾃｼr XEmacs&#x201d; - wenn es Emacs Leute gibt, die das auch kﾃｶnnen, dann werden die das schon abﾃ､ndern.</dd><dt>Bilder</dt><dd>URL tippen und wenn die URL mit JPG oder PNG endet, wird ein IMG tag generiert. Ansonsten kann man einen Bilderlink mit [[image:foo]] setzen, und auf der Seite &#x201c;foo&#x201d; dann ein Bild speichern (denn auf jeder Seite kann entweder ein Bild oder Text (evt. mit IMG tags) stehen.</dd><dt>Name ist auf Deutsch nicht eindeutig</dt><dd>Beispiel: EDiff. Lﾃｶsung: <a class="local" href="http://www.emacswiki.org/emacs/EDiffDeutsch">EDiffDeutsch</a>, analog zu <a class="local" href="http://www.emacswiki.org/emacs/AUCTeXSpanish">AUCTeXSpanish</a>, wenn der Titel ohne Suffix (&#x201c;EDiff&#x201d;) nicht auf Deutsch ﾃｼbersetzt werden kann.</dd></dl></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="translation bar"><br /> <a class="translation ja" href="http://www.emacswiki.org/emacs-ja/繧ｵ繧､繝医����繝��������">ja</a> <a class="translation ko" href="http://www.emacswiki.org/emacs-ko/���������ｸ">ko</a> <a href="http://www.emacswiki.org/emacs-se/Innehﾃ･llsFﾃｶrteckning" class="translation se">se</a> <a href="http://www.emacswiki.org/emacs-es/MapaDelSitio" class="translation es">es</a> <a href="http://www.emacswiki.org/emacs-fr/PlanDuSite" class="translation fr">fr</a> <a href="http://www.emacswiki.org/emacs-ru/ﾐ墟ｰﾑ�ﾑひｰﾐ｡ﾐｰﾐｹﾑひｰ" class="translation ru">ru</a> <a class="translation en" href="http://www.emacswiki.org/emacs-en/SiteMap">en</a> <a class="translation pt" href="http://www.emacswiki.org/emacs-pt/MapaDoSite">pt</a> <a href="http://www.emacswiki.org/emacs-zh/邯ｲ遶吝慍蝨�" class="translation zh">zh</a> <a rel="nofollow" class="translation new" href="http://www.emacswiki.org/emacs?action=translate;id=ﾃ彙ersicht;missing=it_uk">ﾃ彙ersetzung hinzufﾃｼgen</a></span><div class="edit bar"><a accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_%c3%9cbersicht" class="comment local">Diskussion</a> <a title="Hier klicken um die Seite zu bearbeiten" accesskey="b" href="http://www.emacswiki.org/emacs?action=edit;id=%c3%9cbersicht" rel="nofollow" class="edit">Diese Seite bearbeiten</a> <a rel="nofollow" class="history" href="http://www.emacswiki.org/emacs?action=history;id=%c3%9cbersicht">Andere Versionen dieser Seite</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=%c3%9cbersicht">Administration</a></div><div class="time">Zuletzt geﾃ､ndert 2013-10-20 15:10 UTC von frnk-590d9088.pool.mediaWays.net <a rel="nofollow" class="diff" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=%c3%9cbersicht">(Unterschiede)</a></div><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
