//JS script for Joomla template
var siteurl = '';

function fixIEPNG(el, bgimgdf, sizingMethod, type, offset){
	var objs = el;
	if(!objs) return;
	if ($type(objs) != 'array') objs = [objs];
	if(!sizingMethod) sizingMethod = 'crop';
	if(!offset) offset = 0;
	var blankimg = siteurl + 'images/blank.gif';
	objs.each(function(obj) {
		var bgimg = bgimgdf;
		if (obj.tagName == 'IMG') {
			//This is an image
			if (!bgimg) bgimg = obj.src;
			if (!(/\.png$/i).test(bgimg) || (/blank\.png$/i).test(bgimg)) return;

			obj.setStyle('height',obj.offsetHeight);
			obj.setStyle('width',obj.offsetWidth);
			obj.src = blankimg;
			obj.setStyle ('visibility', 'visible');
			obj.setStyle('filter', "progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+bgimg+", sizingMethod='"+sizingMethod+"')");
		}else{
			//Background
			if (!bgimg) bgimg = obj.getStyle('backgroundImage');
			var pattern = new RegExp('url\s*[\(\"\']*([^\'\"\)]*)[\'\"\)]*');
			if ((m = pattern.exec(bgimg))) bgimg = m[1];
			if (!(/\.png$/i).test(bgimg) || (/blank\.png$/i).test(bgimg)) return;
			if (!type)
			{
				obj.setStyle('background', 'none');
				//if(!obj.getStyle('position'))
				if(obj.getStyle('position')!='absolute' && obj.getStyle('position')!='relative') {
					obj.setStyle('position', 'relative');
				}

				//Get all child
				var childnodes = obj.childNodes;
				for(var j=0;j<childnodes.length;j++){
					if((child = $(childnodes[j]))) {
						if(child.getStyle('position')!='absolute' && child.getStyle('position')!='relative') {
							child.setStyle('position', 'relative');
						}
						child.setStyle('z-index',2);
					}
				}
				//Create background layer:
				var bgdiv = new Element('IMG');
				bgdiv.src = blankimg;
				bgdiv.width = obj.offsetWidth - offset;
				bgdiv.height = obj.offsetHeight - offset;
				bgdiv.setStyles({
					'position': 'absolute',
					'top': 0,
					'left': 0
				});

				bgdiv.className = 'TransBG';

				bgdiv.setStyle('filter', "progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+bgimg+", sizingMethod='"+sizingMethod+"')");
				bgdiv.inject(obj, 'top');
				//alert(obj.innerHTML + '\n' + bgdiv.innerHTML);
			} else {
				obj.setStyle('filter', "progid:DXImageTransform.Microsoft.AlphaImageLoader(src="+bgimg+", sizingMethod='"+sizingMethod+"')");
			}
		}
	}.bind(this));

}
window.addEvent('domready', function(){

	var StyleCookie = new Hash.Cookie('JVMajuStyleCookieSite');
	var settings = { colors: '' };
	var style_1, style_2, style_3;
	//new Asset.css(StyleCookie.get('colors'));

	/* Style 1 */
	if($('s1')){$('s1').addEvent('click', function(e) {
		e = new Event(e).stop();
		if (style_1) style_1.remove();
		new Asset.css(pathcolor + 'green.css', {id: 'green'});
		style_1 = $('green');
		settings['colors'] = pathcolor + 'green.css';
		StyleCookie.empty();
		StyleCookie.extend(settings);
	});}

	/* Style 2 */
	if($('s2')){$('s2').addEvent('click', function(e) {
		e = new Event(e).stop();
		if (style_2) style_2.remove();
		new Asset.css(pathcolor + 'gray.css', {id: 'gray'});
		style_2 = $('gray');
		settings['colors'] = pathcolor + 'gray.css';
		StyleCookie.empty();
		StyleCookie.extend(settings);
	});}

	/* Style 3 */
	if($('s3')){$('s3').addEvent('click', function(e) {
		e = new Event(e).stop();
		if (style_3) style_3.remove();
		new Asset.css(pathcolor + 'red.css', {id: 'red'});
		style_3 = $('red');
		settings['colors'] = pathcolor + 'red.css';
		StyleCookie.empty();
		StyleCookie.extend(settings);
	});}
});


function getElementsByClass(searchClass,node,tag) {
	var classElements = new Array();
	var j = 0;
	if ( node == null )
		node = document;
	if ( tag == null )
		tag = '*';
	var els = node.getElementsByTagName(tag);
	var elsLen = els.length;
	var pattern = new RegExp('(^|\\s)'+searchClass+'(\\s|$)');
	for (var i = 0; i < elsLen; i++) {
		if ( pattern.test(els[i].className) ) {
			classElements[j] = els[i];
			j++;
		}
	}
	return classElements;
}

function makeEqualHeight(divs) {
	if(!divs || divs.length < 2) return;
	var maxh = 0;
	divs.each(function(el, i){
		var ch = el.getCoordinates().height;
		maxh = (maxh < ch) ? ch : maxh;		
	},this);
	divs.each(function(el, i){
		el.setStyle('height', maxh-el.getStyle('padding-top').toInt()-el.getStyle('padding-bottom').toInt());		
	},this);
}
//Add 1st item identity
jvAddClassToFirstItem = function(el) {
	li= $E(el);
	if(li) {
		li.addClass('jv-first-item');
	}
	return true;
}
//Add span to module title
function addSpanToTitle (firstword) {
	var modules = getElementsByClass ('module.*', null, "div");
	if (!modules) return;
	for (var i=0; i<modules.length; i++) {
		var module = modules[i];
		var title = module.getElementsByTagName ("h3")[0];
		if (title) {
			if (title.getElementsByTagName("span").length == 0) {
				text = title.innerHTML;
				var pos = text.indexOf(' ');
				if (firstword && pos!=-1) {
					title.innerHTML = "<span>"+text.substr(0,pos)+"</span>"+text.substr(pos);
				}else{
					title.innerHTML = "<span>"+text+"</span>";
				}
			}
		}
	}
}

jvArticleStyle = function() {
	var las = $$('#jv-component .article_row');
	if(!las || las.length<1) return;
	if(las) {
		las.each(function(el) {
			var lis = $ES('.article_column_pad',el);
			if(!lis || lis.length<1) return;
			if(lis && lis.length > 1) {
				var maxh = 0;
				lis.each(function(el, i){
					var ch = el.getCoordinates().height;
					maxh = (maxh < ch) ? ch : maxh;		
				},this);
				lis.each(function(el, i){
					el.setStyle('height', maxh-el.getStyle('padding-top').toInt()-el.getStyle('padding-bottom').toInt());		
				},this);
			}	
			var obj = lis[lis.length-1];
			if(lis[lis.length-1].innerHTML.trim()=='' && lis.length > 2) {
			obj.remove();
			obj = lis[lis.length-2];
			}
			if (obj) obj.setStyle('background','none');
		});
	}
}

window.addEvent ('load', function() {
	jvAddClassToFirstItem('#mainlevel-nav li');							  
	jvArticleStyle();
});