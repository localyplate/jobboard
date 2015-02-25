{include file="header.tpl"}
		
		<div id="content">
			<div id="job-listings">
               {include file="spotlight.tpl"}

				{if $jobs}
				<div id="sort-by-type">
				{$translations.category.display_only}&nbsp; 
					{section name=tmp loop=$types}
						<a href="{$BASE_URL}{$URL_JOBS}/{$current_category}/{$types[tmp].var_name}/" title="{$current_category} {$types[tmp].name}"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-{$types[tmp].var_name}.png" alt="{$types[tmp].name}" /></a>
					{/section}
				</div><!-- #sort-by-type -->
				{/if}
                <h2>
                {if $current_category == 'all'}
					{$translations.alljobs.all_jobs}
                {else}
					{$translations.category.jobs_for} {$current_category_name}
                {/if}
				</h2>
				{include file="posts-loop.tpl"}
			</div><!-- #job-listings -->
		</div><!-- #content -->

{include file="footer.tpl"}