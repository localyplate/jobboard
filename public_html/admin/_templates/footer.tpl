	</div><!-- #wrap -->
	<div class="footer clear">
	</div><!-- .footer -->
	{literal}
	<script type="text/javascript">
		//<![CDATA[
 		$(document).ready(function()
		{
		   var keywords = $('#keywords');
			// setup search box
			keywords.bind('click', function() {
				if (this.value == '{/literal}{$translations.search.default}{literal}')
				{
					keywords.clearFields();
				}
			});

			keywords.bind('blur', function() {  
				if (this.value == '{/literal}{$translations.search.default}{literal}' || this.value == '')
				{
					this.value = '{/literal}{$translations.search.default}{literal}';
				}
			});

			// setup live search
			keywords.keyup(function(key) {
				var searchKeywords = jQuery.trim(this.value);
				var len = searchKeywords.length;
			    if (key.keyCode != 9 && len >= 3)
				{
					$("#indicator").show();	
					clearTimeout(window.search_timer);	
					window.search_timer = setTimeout(function(){Jobber.PerformSearch('{/literal}{$BASE_URL_ADMIN}{literal}search/{/literal}{$current_category}{literal}|', searchKeywords)}, 800);
			    }
			});
		});
		
		Jobber.jobber_admin_url = "{/literal}{$BASE_URL_ADMIN}{literal}";
		Jobber.FixPng();
		//]]>
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("a.iframe").fancybox({
				hideOnContentClick: true,
				frameWidth: 980,
				frameHeight: 500
			});
		}); 
	</script>
    <script type="text/javascript" src="{/literal}{$BASE_URL}{literal}js/tiny_mce/tiny_mce.js"></script>
    <script language="javascript" type="text/javascript">
        tinyMCE.init({
            mode : "textareas",
            editor_selector : "mceEditor",
            theme: "advanced",
			plugins : "safari,lists,advimage,advlink,inlinepopups,contextmenu,fullscreen,jbimages",
					
            theme_advanced_toolbar_align: "left",
            theme_advanced_toolbar_location: "top",
			theme_advanced_statusbar_location : "bottom",

            theme_advanced_buttons1: "bold,italic,underline,separator,justifyleft,justifycenter,justifyright,justifyfull,fontsizeselect,forecolor,backcolor,separator,bullist,numlist,separator,undo,redo,separator,link,unlink,image,separator,jbimages,separator,fullscreen",
		 	theme_advanced_buttons2 : "",
			theme_advanced_buttons3 : "",
			theme_advanced_buttons4 : "",
			height: "500px",
            width: "450px",
			
			//  options
			relative_urls:false
			
        });
    </script>
    {/literal}

	<div id="overlay"><img src="{$BASE_URL_ADMIN}img/ajax-loader.gif" /></div>
	<div id="messagesContainer"></div>
	{if $CURRENT_PAGE == "categories"}
	<div id="help" style="display: none;">
		<p class="bold">Categories help</p>
		<ul>
			<li><strong>Name</strong>: The name that will be used in the template</li>
			<li><strong>Title</strong>:</li>
			<li><strong>Description</strong>:</li>
			<li><strong>Keywords</strong>:</li>
			<li><strong>URL</strong>:</li>
		</ul>
	</div>
	{/if}
</body>
</html>