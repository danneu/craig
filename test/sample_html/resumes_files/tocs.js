$(document).ready(function(){$('#catAbb, input.min, input.max').removeAttr('disabled');$('#showImgs').css('display','inline');if(checkCookie()==='show'){showImgs();}else{hideImgs();}
$('input.min').DefaultValue('min');$('input.max').DefaultValue('max');$('form').submit(function(){if(catAbb&&($('#catAbb').val()===catAbb)){$('#catAbb').attr('disabled','disabled');}});$('#nh').hide().removeAttr('disabled');newSel=$('#nh').clone();newSel.find('#all').remove();$('#nh').replaceWith(newSel);$('#hoodtogon, #hoodtitle').show();$('#hoodtitle').click(toggleHoods);countHoods();$('body').click(function(e){if(!$(e.target).parents('#hoodpicker').length){$('#hoodtogon').show();$('#hoodtogoff').hide();$('#nh').slideUp(100);}});$('#satabs a').click(function(e){e.preventDefault();var f=$('#searchform');var t=f.attr('action').match(/\/search\/.../);var s=getSub($(this).attr('href'));if(s){t=t+"/"+s;}
f.attr('action',t);f.submit();});if(showMapTabs){$('div.container').before('<blockquote><span class="modebtns">'+
'<span class="modebtnup" id="golistview">'+listViewText+'</span>'+
'<span class="modebtnup" id="gopicview">'+picViewText+'</span>'+
'<span class="modebtndown" id="gomapview">'+mapViewText+'</span>'+
'</span></blockquote>');$('blockquote').has('#tocpix').before('&nbsp;<blockquote><span class="modebtns">'+
'<span class="modebtndown" id="golistview">'+listViewText+'</span>'+
'<span class="modebtnup" id="gopicview">'+picViewText+'</span>'+
'<span class="modebtnup" id="gomapview">'+mapViewText+'</span>'+
'</span></blockquote>');$('#tocpix').hide();if((checkCookie()==='show')&&!$('div.container').html()){$('#golistview').removeClass('modebtndown');$('#golistview').addClass('modebtnup');$('#gopicview').removeClass('modebtnup');$('#gopicview').addClass('modebtndown');}
if($('div.container').html()){$('#toc_rows blockquote').first().hide();}
$('#golistview').click(function(e){e.preventDefault();if($(this).hasClass('modebtndown')){return false;}
hideImgs();if($('div.container').html()){$('#usemapcheck input').removeAttr('checked');$('#searchform').submit();}
else{$('#golistview').removeClass('modebtnup');$('#golistview').addClass('modebtndown');$('#gopicview').removeClass('modebtndown');$('#gopicview').addClass('modebtnup');}});$('#gopicview').click(function(e){e.preventDefault();if($(this).hasClass('modebtndown')){return false;}
showImgs();if($('div.container').html()){$('#usemapcheck input').removeAttr('checked');$('#searchform').submit();}
else{$('#golistview').removeClass('modebtndown');$('#golistview').addClass('modebtnup');$('#gopicview').removeClass('modebtnup');$('#gopicview').addClass('modebtndown');}});$('#gomapview').click(function(e){e.preventDefault();if($(this).hasClass('modebtndown')){return false;}
$('#usemapcheck input:not(:checked)').attr('checked',true);$('#shortlistcheck input').removeAttr('checked');$('#searchform').submit();});$('span.modebtns').prependTo('div.container');$('span.itemsfound').prependTo('div.container');$('#mapcontainer').prepend('<br style="clear:both">');$('span.maptag').click(function(e){e.preventDefault();var mapTagPostingID=$(this).attr('id');mapTagPostingID=mapTagPostingID.replace('maptagid_','');$('#usemapcheck input:not(:checked)').attr('checked',true);$('#zoomtoposting').val(mapTagPostingID);$('#shortlistcheck input').removeAttr('checked');$('#searchform').submit();});}});function toggleHoods(){$('#hoodtogon, #hoodtogoff').toggle();$('#nh').slideToggle(100);$('select#nh').toChecklist({addScrollBar:false,showSelectedItems:true,submitDataAsArray:false});$('#nh').click(countHoods);countHoods();}
function countHoods(){$('span#hoodcount').text($('#nh :checked').length||$('#nh :selected').length||'all');}
function showImgs(){if(!window.tocpix)return;$('span.ih').removeClass('ih').addClass('i')
.each(function(){if($(this).attr('id')){var iP=$(this).attr('id').split(':');thumbURL='http://'+iP[0]+'.craigslist.org/thumb/'+iP[1];postURL=$(this).siblings('a').attr('href');$(this).html('<a href="'+postURL+'"><img alt="" src="'+thumbURL+'"></a>')
.mouseover(function(){var iP=$(this).attr('id').split(':');fullURL='http://'+iP[0]+'.craigslist.org/medium/'+iP[1];$('#floater').html('<img src="'+fullURL+'">').show();})
.mouseout(function(){$('#floater').hide();})
.mousemove(function(e){$('#floater').css({'left':e.pageX+15+'px','top':e.pageY+15+'px'});})}})
$('#showImgs').hide();$('#hideImgs').css('display','inline');var date=new Date();date.setTime(date.getTime()+(365*24*60*60*1000));document.cookie="cl_img=show; expires="+date.toGMTString()+"; path=/";}
function getSub(url){var match=url.match(/\/search\/...\/(...)/);if(match){var sub=match[1];return sub;}
match=url.match(/\/(...)\/...\//);if(match){var sub=match[1];return sub;}}
function hideImgs(){$('span.i').removeClass('i').addClass('ih');$('#showImgs').css('display','inline');$('#hideImgs').hide();document.cookie='cl_img=null; expires=Fri, 27 Jul 2001 02:47:11 UTC; path=/';}
function checkCookie(){var C=document.cookie.split(';');for(i=0;i<C.length;i++){var c=$.trim(C[i]);if(c.indexOf('cl_img=')===0)return c.substring(7);}
return null;}