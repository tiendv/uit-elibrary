// MIT OpenCourseWare 

window.onload=function(){
	customResearch();
    populateYoutubePlaceholders();
    showRandomSidebarQuote();
    showRandomIndividualSupporterQuote();
}

function emailPopUp()
{
	var pageTitle = document.title;
	var pageUrl   = document.location;
	var URL = "/jsp/emailpage.jsp?title=" + pageTitle + "&referer=" + pageUrl;
	window.open(URL,null,"height=470,width=530,status=yes,toolbar=no,menubar=no,location=no,resizable=yes");
}

// rotating image change for homepage
function changeQuote()
{
var quotes = new Array(
'<p>&quot;OpenCourseWare is exactly the kind of thing that universities should be doing.&quot;</p><ul><li><strong>Larry Birenbaum</strong><br />MIT Class of 1969 and OCW supporter<br /> United States</li></ul>', 
'<p>&quot;Through OCW, I am part of a movement to help make education free and available to the world.&quot;</p><p><ul><li><strong>Clinton Blackburn</strong><br />MIT student<br />United States</li></ul>', 
'<p>&quot;I was amazed that a university such as MIT would freely give access to its educational information.&quot;</p><ul><li><b>Triatno Yudo Harjoko</b><br />Educator<br />Indonesia</li></ul>',
'<p>&quot;I found lecture notes, handouts and slides from presentations, and some problem sets. It helped me a lot.&quot;</p><ul><li><b>Maria Karamitsou</b><br />Student<br />Greece</li></ul>',
'<p>&quot;OCW opens up knowledge across the world and allows universities to benchmark teaching.&quot;</p><ul><li><b>Fran&ccedil;ois Viruly</b><br />Educator<br />South Africa</li></ul>',
'<p>&quot;My life is in teaching. To have a chance to do that with a world audience is just wonderful.&quot;</p><ul><li><b>Gilbert Strang</b><br />MIT Mathematics professor<br />United States</li></ul>',
'<p>&quot;It\'s a great opportunity for students to become extraordinary engineers.&quot;</p><ul><li><b>Juan Lara</b><br />Student<br />Mexico</li></ul>',
'<p>&quot;It puts a previously untouchable subject within reach for anyone who is interested.&quot;</p><ul><li><b>Wendy Ermold</b><br />Self Learner<br />United States</li></ul>',
'<p>&quot;I strive to make as much as possible enjoyable and educational at the same time.&quot;</p><ul><li><b>Amy Santee</b><br />Educator<br />United States</li></ul>',
'<p>&quot;It\'s an important way to ensure the quality of my courses.&quot;</p><ul><li><b>Shirley Harrell</b><br />Educator<br />United States</li></ul>',
'<p>&quot;OCW will enable us to create better educational linkages.&quot;</p><ul><li><b>Karen Willcox</b><br />MIT Aeronautics and Astronautics professor<br />United States</li></ul>');

var images = new Array (
"/images/wihomeimages/birenbaum.jpg", 
"/images/wihomeimages/blackburn.jpg", 
"/images/wihomeimages/harjoko.jpg",
"/images/wihomeimages/karamitsou.jpg",
"/images/wihomeimages/viruly.jpg",
"/images/wihomeimages/gil3.jpg",
"/images/wihomeimages/juan_banner.jpg",
"/images/wihomeimages/wendy_banner.jpg",
"/images/wihomeimages/santee_banner.jpg",
"/images/wihomeimages/harrell_banner.jpg",
"/images/wihomeimages/willcox_banner.jpg");

var links = new Array (
"/donate/ocw-course-champions-program/larry-birenbaum/", 
"/about/ocw-stories/clinton-blackburn/", 
"/about/ocw-stories/triatno-yudo-harjoko/",
"/about/ocw-stories/maria-karamitsou/",
"/about/ocw-stories/francois-viruly/",
"/about/ocw-stories/gilbert-strang/",
"/about/ocw-stories/juan-lara/",
"/about/ocw-stories/wendy-ermold/",
"/about/ocw-stories/amy-santee/",
"/about/ocw-stories/shirley-harrell/",
"/about/ocw-stories/karen-willcox/");

var rand = Math.floor(Math.random()*quotes.length);
var txt='';
txt+='<ul><li class="email"><a href="javascript:emailPopUp()">Email this page<\/a><\/li><\/ul>';
if(document.getElementById("switchbutton"))
	document.getElementById("switchbutton").innerHTML=txt;
document.getElementById("RichTextPlaceholder1").style.backgroundImage = "url("+images[rand]+")";
var mainQuotesPlaceHolder = document.getElementById("quote_main");
if(mainQuotesPlaceHolder){
	mainQuotesPlaceHolder.innerHTML = quotes[rand] + '<p><a href="' + links[rand] + '"  class="bullet">Read more<\/a><\/p>';
	}
//Enable survey on Site Home Page
//Hack for Opera -- dont know why Opera is running both window.onload and changequote functions for site home page. All others run changequote only
//if(!(navigator.appName =='Opera'))
customResearch();
}
// rotating image change ends here

function showRandomSidebarQuote()
{
	var quotes = new Array(
	'<p>&quot;I donated because I want MIT to keep OCW going.&quot;<br /><br /> &mdash;Heath Novak<br />Student, USA</p>', 
	'<p>&quot;OCW inspires just as much as it enriches.&quot;<br /><br /> &mdash;Jeff Breidenbach<br /> MIT Alumnus, Class of 1996</p>',
	'<p>&quot;It\'s every person\'s responsibility to stand up and support the things he (or she) values.&quot;<br /><br /> &mdash;Assaf Tal<br /> Self Learner, Israel</p>',
	'<p>&quot;Supporting OCW was my way of saying \'thank you\' for having the courage and insight to take this bold step.&quot;<br /><br /> &mdash;Ted Inoue<br /> Self Learner, USA</p>',
	'<p>&quot;I gained so much by the educational materials from MIT faculty.&quot;<br /><br /> &mdash;Aditi Gupta<br /> Student, USA</p>',
	'<p>&quot;OCW has been instrumental in my professional development.&quot;<br /><br /> &mdash;Harry Crissy<br /> Self Learner, USA</p>') 
	
	var rand = Math.floor(Math.random() * quotes.length);
	var sidebarQuotesPlaceHolder = document.getElementById("quote_sidebar");
	if(sidebarQuotesPlaceHolder){
		sidebarQuotesPlaceHolder.innerHTML = quotes[rand];
	}
}
function showRandomIndividualSupporterQuote()
{
	var images = new Array (
	"/images/individualsupporter/donor_1.gif", 
	"/images/individualsupporter/donor_2.gif", 
	"/images/individualsupporter/donor_3.gif",
	"/images/individualsupporter/donor_4.gif",
	"/images/individualsupporter/donor_5.gif",
	"/images/individualsupporter/donor_6.gif",
	"/images/individualsupporter/donor_7.gif",
	"/images/individualsupporter/donor_8.gif",
	"/images/individualsupporter/donor_9.gif",
	"/images/individualsupporter/donor_10.gif");

	var quotes = new Array(
	'OpenCourseWare is how MIT will be remembered 500 years from now.',
	'I gave to OCW because I think it\'s one of the most noble endeavors imaginable. MIT, you rock! I\'m so proud of you!',
	'I\'ve used OCW as a reference long after my old college \'bibles\' ended up in the recycling bin. OCW is a shining example of ideas being celebrated.',
	'I\'ve been dreaming for years an initiative like the OCW for young students in Haiti and other Developing countries.',
	'I know the value of good educational content - and the tangible positive changes it can bring to an aspiring student. It really transforms life.',
	'I support you because you support me! Thank you for contributing to my professional development.',
	'As a Physics teacher, I find your website to be of enormous utility both for my own edification, as well as the education of my students.',
	'I find it inspiring that so many people, rich or poor, get to learn anything they desire from OpenCourseWare.',
	'This is the way education should be: open, high-quality and available to all who are interested in learning.',
	'This is what education is all about and it is boundless. This is why I support OCW.') 
	
	var rand = Math.floor(Math.random() * quotes.length);
	var sidebarQuotesPlaceHolder = document.getElementById("rotating_quotes");
	if(sidebarQuotesPlaceHolder){
		sidebarQuotesPlaceHolder.innerHTML = '<p><img title="' + quotes[rand] + '" src="' + images[rand] + '" alt="' + quotes[rand] + '" \/><\/p>';
	}
}

function emailPopUp()
{
	var pageTitle = document.title;
	var pageUrl   = document.location;
	var URL = "/jsp/emailpage.jsp?title=" + pageTitle + "&referer=" + pageUrl;
	window.open(URL,null,"height=470,width=530,status=yes,toolbar=no,menubar=no,location=no,resizable=yes");
}

//Clear the default value of search input 

function clearSearchBox()
{
	if(document.getElementById("terms").value == "Enter search keyword")
	{
		document.getElementById("terms").value = "";	
	}
	
}

function fillSearchBox()
{
	if(document.getElementById("terms").value == "")
	{
		document.getElementById("terms").value = "Enter search keyword";	
	}
}

function clearEmailBox()
{

	if(document.getElementById("txt_subscribe").value == "Enter email address")
	{
		document.getElementById("txt_subscribe").value = "";	
	}
	
}
function populateYoutubePlaceholders(){
    var stringToReplace = "ACTUAL_LINK_GOES_HERE";
    var videoinjectionstring = '<object type="application/x-shockwave-flash" style="width:425px; height:344px;" data="' + stringToReplace+ '">'
            + '<param name="movie" value="' + stringToReplace + '"></param>'
            + '<param name="allowFullScreen" value="true"></param></object>';
    var blacklist_div = document.getElementById("dept_links");
    if(blacklist_div != null){
        return;
        }
    var videoContainers = document.getElementsByClassName("youtubevideo");
    
    for(i = 0; i < videoContainers.length; i ++){
        var videoURL = videoContainers[i].getElementsByTagName("a")[0].getAttribute("href");
        var finalvideoinjectionstring = videoinjectionstring.replace(stringToReplace, videoURL).replace(stringToReplace, videoURL);
        videoContainers[i].innerHTML = finalvideoinjectionstring;
    }
}

document.getElementsByClassName = function(cl) {
    var retnode = [];
    var myclass = new RegExp('\\b'+cl+'\\b');
    var elem = this.getElementsByTagName('div');
    for (var i = 0; i < elem.length; i++) {
    var classes = elem[i].className;
    if (myclass.test(classes)) {
        retnode.push(elem[i]);
        break;
        }
    }
    return retnode;
};


// This next little bit of code tests whether the user accepts cookies.
var WM_acceptsCookies = false;
if(document.cookie == '') {
	document.cookie = 'WM_acceptsCookies=yes'; // Try to set a cookie.
	if(document.cookie.indexOf('WM_acceptsCookies=yes') != -1) {
	WM_acceptsCookies = true;
	}// If it succeeds, set variable
} else { // there was already a cookie
	WM_acceptsCookies = true;
}

function WM_setCookie (name, value, hours, path, domain, secure) {
if (WM_acceptsCookies) { // Don't waste your time if the browser doesn't accept cookies.
var not_NN2 = (navigator && navigator.appName && (navigator.appName == 'Netscape') && navigator.appVersion && (parseInt(navigator.appVersion) == 2))?false:true;

if (!hours)
hours = 2000;

if(hours && not_NN2) { // NN2 cannot handle Dates, so skip this part
	if ( (typeof(hours) == 'string') && Date.parse(hours) ) { // already a Date string
	var numHours = hours;
	} 
	else if (typeof(hours) == 'number') { // calculate Date from number of hours
	var numHours = (new Date((new Date()).getTime() + hours*3600000)).toGMTString();
	}
}
document.cookie = name + '=' + escape(value) + ((numHours)?(';expires=' + numHours):'') + ';path=/' + ((domain)?';domain=' + domain:'') + ((secure && (secure == true))?'; secure':''); // Set the cookie, adding any parameters that were specified.
}
} // WM_setCookie

function WM_readCookie(name) {
if(document.cookie == '') { // there's no cookie, so go no further
	return false;
} 
else { // there is a cookie
	var firstChar, lastChar;
	var theBigCookie = document.cookie;
	firstChar = theBigCookie.indexOf(name); // find the start of 'name'
	var NN2Hack = firstChar + name.length;
	if((firstChar != -1) && (theBigCookie.charAt(NN2Hack) == '=')) { // if you found the cookie
		firstChar += name.length + 1; // skip 'name' and '='
		lastChar = theBigCookie.indexOf(';', firstChar); // Find the end of the value string (i.e. the next ';').
		if(lastChar == -1) lastChar = theBigCookie.length;
		return unescape(theBigCookie.substring(firstChar, lastChar));
	} else { // If there was no cookie of that name, return false.
		return false;
	}
}
} // WM_readCookie

//Code for 2011 Fall campaign
document.getElementsByClassName = function(cl) {
var retnode = [];
var myclass = new RegExp('\\b'+cl+'\\b');
var elem = this.getElementsByTagName('div');
for (var i = 0; i < elem.length; i++) {
var classes = elem[i].className;
if (myclass.test(classes)) {
	retnode.push(elem[i]);
	break;
	}
}
return retnode;
};

function customResearch(){
var n = 100; /* One out of n visitors will be given survey */
var random_num;
var offset = -1;
var cookiename = "InterceptSurvey2010";

var surveymarkup='<div id="mainsurvey"><img border="0" src="/images/Fall_11_campaign.jpg" usemap="#campaign" alt="Help millions reach their potential." title="Help millions reach their potential." /><map name="campaign"><area shape="rect" coords="0,235,138,251" href="http://www.flickr.com/photos/stephanieasher/"><area onclick="onClickMinimize();" href="javascript:void(0)" coords="934,13,9" shape="circle"><area shape="rect" coords="0,0,950,251" href="http://ocw.mit.edu/donate/why-donate/" onclick="onClickGetStarted();"></map></div>';

var pageHeader = document.getElementsByClassName('logo')[0];

random_num = Math.round(n * Math.random());
random_num = 1; // uncomment this line to debug, this will trigger the research everytime
if ((random_num == 1) && (navigator.appName.indexOf('WebTV') == -1))
	if (!WM_readCookie(cookiename)) {
	//insert survey code
	var ndiv = document.createElement("div");
	ndiv.innerHTML = surveymarkup;
	if(!(pageHeader.innerHTML == surveymarkup))
	pageHeader.parentNode.insertBefore(ndiv,pageHeader);	
	}
}
var newwindow = '';
function onClickGetStarted(url) {
document.getElementById("mainsurvey").style.display = "none";
random_num = 1;
var cookiename = "InterceptSurvey2010";
if ((random_num == 1) && (navigator.appName.indexOf('WebTV') == -1))
  if (!WM_readCookie(cookiename)) {
   /* comment this to prompt until they complete the survey */
   WM_setCookie(cookiename,'2010')      
}
}

function onClickMinimize(){
random_num = 1;
var cookiename = "InterceptSurvey2010";
var cururl = window.location;
if ((random_num == 1) && (navigator.appName.indexOf('WebTV') == -1)){
   WM_setCookie(cookiename,'2010',24)
   document.getElementById("mainsurvey").style.display = "none";
}
}
//Code for Fall campaign ends