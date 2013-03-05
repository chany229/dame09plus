/*
 * jQuery hashchange event - v1.3pre - 7/17/2010
 * http://benalman.com/projects/jquery-hashchange-plugin/
 * 
 * Copyright (c) 2010 "Cowboy" Ben Alman
 * Dual licensed under the MIT and GPL licenses.
 * http://benalman.com/about/license/
 */
(function($,e,b){var c="hashchange",h=document,f,g=$.event.special,i=h.documentMode,d="on"+c in e&&(i===b||i>7);function a(j){j=j||location.href;return"#"+j.replace(/^[^#]*#?(.*)$/,"$1")}$[c+"Delay"]=50;$.fn[c]=function(j){return j?this.bind(c,j):this.trigger(c)};g[c]=$.extend(g[c],{setup:function(){if(d){return false}$(f.start)},teardown:function(){if(d){return false}$(f.stop)}});f=(function(){var j={},p,m=a(),k=function(q){return q},l=k,o=k;j.start=function(){p||n()};j.stop=function(){p&&clearTimeout(p);p=b};function n(){var r=a(),q=o(m);if(r!==m){l(m=r,q);$(e).trigger(c)}else{if(q!==m){location.href=location.href.replace(/#.*/,"")+q}}p=setTimeout(n,$[c+"Delay"])}(function(){var q=$.browser,r,s;if(!q.msie||q.version>7){return}j.start=function(){if(!r){s=$[c+"IframeSrc"];s=s&&s+a();r=$('<iframe tabindex="-1" title="empty"/>').hide().one("load",function(){s||l(a());n()}).attr("src",s||"javascript:0").insertAfter("body")[0].contentWindow;h.onpropertychange=function(){try{if(event.propertyName==="title"){r.document.title=h.title}}catch(t){}}}};j.stop=k;o=function(){return a(r.location.href)};l=function(w,t){var v=r.document,u=$[c+"Domain"];if(w!==t){v.title=h.title;v.open();u&&v.write('<script>document.domain="'+u+'"<\/script>');v.close();r.location.hash=w}}})();return j})()})(jQuery,this);
