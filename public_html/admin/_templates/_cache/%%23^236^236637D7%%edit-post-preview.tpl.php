<?php /* Smarty version 2.6.26, created on 2012-02-06 03:39:58
         compiled from edit-post-preview.tpl */ ?>
<div class="block mb2">
	<h3>Preview</h3>
	<div class="block_inner">
		<div id="job-details">
		<?php if ($this->_tpl_vars['job']['days_old'] > 40): ?>
			<div id="notice">
				This job ad has been posted over 40 days ago...
			</div>
		<?php endif; ?>
			<h2><img src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
_templates/<?php echo $this->_tpl_vars['THEME']; ?>
/img/icon-<?php echo $this->_tpl_vars['job']['type_var_name']; ?>
.png" alt="<?php echo $this->_tpl_vars['job']['type_name']; ?>
" /> <?php echo $this->_tpl_vars['job']['title']; ?>
</h2>
			<p>
				<span class="light">at</span>
				<?php if ($this->_tpl_vars['job']['url'] && $this->_tpl_vars['job']['url'] != 'http://'): ?>
					<a href="<?php echo $this->_tpl_vars['job']['url']; ?>
"><?php echo $this->_tpl_vars['job']['company']; ?>
</a>
				<?php else: ?>
					<strong><?php echo $this->_tpl_vars['job']['company']; ?>
</strong>
				<?php endif; ?>
				<?php if ($this->_tpl_vars['job']['is_location_anywhere']): ?>
					<strong>(<?php echo $this->_tpl_vars['translations']['jobs']['location_anywhere']; ?>
)</strong>
				<?php else: ?>
					<span class="light">in</span> <strong><?php echo $this->_tpl_vars['job']['location']; ?>
</strong>
				<?php endif; ?>
			</p>
			<div id="job-description">
				<?php echo $this->_tpl_vars['job']['textiledDescription']; ?>

			</div>
		</div><!-- #job-details -->
	</div>
</div>