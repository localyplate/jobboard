<?php /* Smarty version 2.6.26, created on 2015-02-12 01:26:11
         compiled from spotlight.tpl */ ?>
<?php if ($this->_tpl_vars['spotlight_jobs']): ?>
	<h2><?php echo $this->_tpl_vars['translations']['homepage']['spotlight_jobs']; ?>
<?php if ($this->_tpl_vars['current_category_name'] != ''): ?>, <?php echo $this->_tpl_vars['current_category_name']; ?>
<?php endif; ?></h2>
	
	<?php $_from = $this->_tpl_vars['spotlight_jobs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['job']):
?>
		<div class="row-spot">
			<span class="row-info">
				<img src="<?php echo $this->_tpl_vars['BASE_URL']; ?>
_templates/<?php echo $this->_tpl_vars['THEME']; ?>
/img/icon-<?php echo $this->_tpl_vars['job']['type_var_name']; ?>
.png" alt="<?php echo $this->_tpl_vars['job']['type_name']; ?>
" />
				<a href="<?php echo $this->_tpl_vars['BASE_URL']; ?>
<?php echo $this->_tpl_vars['URL_JOB']; ?>
/<?php echo $this->_tpl_vars['job']['id']; ?>
/<?php echo $this->_tpl_vars['job']['url_title']; ?>
/" title="<?php echo $this->_tpl_vars['job']['title']; ?>
"><?php echo $this->_tpl_vars['job']['title']; ?>
</a> <span class="la"><?php echo $this->_tpl_vars['translations']['homepage']['at']; ?>
</span> <?php echo $this->_tpl_vars['job']['company']; ?>
<?php if ($this->_tpl_vars['job']['is_location_anywhere']): ?>, <?php echo $this->_tpl_vars['translations']['jobs']['location_anywhere']; ?>
<?php else: ?> <span class="la"><?php echo $this->_tpl_vars['translations']['homepage']['in']; ?>
</span> <?php echo $this->_tpl_vars['job']['location']; ?>
<?php endif; ?>
			</span>
			<span class="spotlight-image"></span>
		</div>
	<?php endforeach; endif; unset($_from); ?>
    <br />
<?php endif; ?>