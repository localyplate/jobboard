<?php /* Smarty version 2.6.26, created on 2012-10-16 02:39:30
         compiled from footer.tpl */ ?>
	</div><!-- #wrap -->
	<div class="footer clear">
	</div><!-- .footer -->
	<?php echo '
	<script type="text/javascript">
		//<![CDATA[
 		$(document).ready(function()
		{
		   var keywords = $(\'#keywords\');
			// setup search box
			keywords.bind(\'click\', function() {
				if (this.value == \''; ?>
<?php echo $this->_tpl_vars['translations']['search']['default']; ?>
<?php echo '\')
				{
					keywords.clearFields();
				}
			});

			keywords.bind(\'blur\', function() {  
				if (this.value == \''; ?>
<?php echo $this->_tpl_vars['translations']['search']['default']; ?>
<?php echo '\' || this.value == \'\')
				{
					this.value = \''; ?>
<?php echo $this->_tpl_vars['translations']['search']['default']; ?>
<?php echo '\';
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
					window.search_timer = setTimeout(function(){Jobber.PerformSearch(\''; ?>
<?php echo $this->_tpl_vars['BASE_URL_ADMIN']; ?>
<?php echo 'search/'; ?>
<?php echo $this->_tpl_vars['current_category']; ?>
<?php echo '|\', searchKeywords)}, 800);
			    }
			});
		});
		
		Jobber.jobber_admin_url = "'; ?>
<?php echo $this->_tpl_vars['BASE_URL_ADMIN']; ?>
<?php echo '";
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
    <script type="text/javascript" src="'; ?>
<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo 'js/tiny_mce/tiny_mce.js"></script>
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
    '; ?>


	<div id="overlay"><img src="<?php echo $this->_tpl_vars['BASE_URL_ADMIN']; ?>
img/ajax-loader.gif" /></div>
	<div id="messagesContainer"></div>
	<?php if ($this->_tpl_vars['CURRENT_PAGE'] == 'categories'): ?>
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
	<?php endif; ?>
</body>
</html>