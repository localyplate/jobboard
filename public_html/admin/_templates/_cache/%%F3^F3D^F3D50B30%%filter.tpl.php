<?php /* Smarty version 2.6.26, created on 2012-10-16 02:55:43
         compiled from filter.tpl */ ?>
            <span><?php echo $this->_tpl_vars['translations']['header']['filter_jobs']; ?>
</span>
            <ul>
                <li>
                    <?php if ($this->_tpl_vars['filter'] != 'day'): ?>
                        <a href="<?php echo $this->_tpl_vars['BASE_URL_ADMIN']; ?>
advanced/<?php echo $this->_tpl_vars['current_category']; ?>
/day/"><?php echo $this->_tpl_vars['translations']['filter']['day']; ?>
</a>
                    <?php else: ?>
                        <strong><a href="#"><?php echo $this->_tpl_vars['translations']['filter']['day']; ?>
</a></strong>
                    <?php endif; ?>
                </li>
                <li>
                    <?php if ($this->_tpl_vars['filter'] != 'week'): ?>
                        <a href="<?php echo $this->_tpl_vars['BASE_URL_ADMIN']; ?>
advanced/<?php echo $this->_tpl_vars['current_category']; ?>
/week/"><?php echo $this->_tpl_vars['translations']['filter']['week']; ?>
</a>
                    <?php else: ?>
                        <strong><a href="#"><?php echo $this->_tpl_vars['translations']['filter']['week']; ?>
</a></strong>
                    <?php endif; ?>
                </li>
                <li>
                    <?php if ($this->_tpl_vars['filter'] != 'supmonth'): ?>
                        <a href="<?php echo $this->_tpl_vars['BASE_URL_ADMIN']; ?>
advanced/<?php echo $this->_tpl_vars['current_category']; ?>
/supmonth/"><?php echo $this->_tpl_vars['translations']['filter']['supmonth']; ?>
</a>
                    <?php else: ?>
                        <strong><a href="#"><?php echo $this->_tpl_vars['translations']['filter']['supmonth']; ?>
</a></strong>
                    <?php endif; ?>
                </li>
                <li>
                    <?php if ($this->_tpl_vars['filter'] != 'infmonth'): ?>
                        <a href="<?php echo $this->_tpl_vars['BASE_URL_ADMIN']; ?>
advanced/<?php echo $this->_tpl_vars['current_category']; ?>
/infmonth/"><?php echo $this->_tpl_vars['translations']['filter']['infmonth']; ?>
</a>
                    <?php else: ?>
                        <strong><a href="#"><?php echo $this->_tpl_vars['translations']['filter']['infmonth']; ?>
</a></strong>
                    <?php endif; ?>
                </li>
                <li>
                    <?php if ($this->_tpl_vars['filter'] != 'nofilter'): ?>
                        <a href="<?php echo $this->_tpl_vars['BASE_URL_ADMIN']; ?>
advanced/<?php echo $this->_tpl_vars['current_category']; ?>
/nofilter/"><?php echo $this->_tpl_vars['translations']['filter']['nofilter']; ?>
</a>
                    <?php else: ?>
                        <strong><a href="#"><?php echo $this->_tpl_vars['translations']['filter']['nofilter']; ?>
</a></strong>
                    <?php endif; ?>
                </li>
            </ul>