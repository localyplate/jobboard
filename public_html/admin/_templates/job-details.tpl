			<div id="job-details">
				
				{if $job.days_old > 40}
				<div id="old-ad">
					This job ad has been posted over 40 days ago...
				</div>
				{/if}
				{if $CURRENT_PAGE == $URL_JOB}
				<div id="applied-to-job">
					{$job.applied_count}
					{if $job.applied_count != 1}
					<p>applicants</p>
					{else}
					<p>applicant</p>
					{/if}
				</div>
				{/if}
				<h2>
					<img src="{$BASE_URL}_templates/{$THEME}/img/icon-{$job.type_var_name}.png" alt="{$job.type_name}" /> {$job.title} 
				</h2>

				<p>
					<span class="fading">at</span>
					{if $job.url && $job.url != 'http://'}
					<a href="{$job.url}">{$job.company}</a>
					{else}
					<strong>{$job.company}</strong>
					{/if}
					{if $job.is_location_anywhere}
					<strong>({$translations.jobs.location_anywhere})</strong>
					{else}
					<span class="fading">in</span> <strong>{$job.location}</strong>
					{/if}
				</p>

				<table style="margin:0 0 10px 0;">
					{if $job.occupation}<tr><th style="background-color:navy; color:white;">Occupation</th><td style="border:1px solid navy;">{$job.occupation}</td></tr>{/if}
					{if $job.details}<tr><th style="background-color:navy; color:white;">Details of the job</th><td style="border:1px solid navy;">{$job.details}</td></tr>{/if}
					{if $job.address}<tr><th style="background-color:navy; color:white;">Working address</th><td style="border:1px solid navy;">{$job.address}</td></tr>{/if}
					{if $job.requ}<tr><th style="background-color:navy; color:white;">Requirements</th><td style="border:1px solid navy;">{$job.requ}</td></tr>{/if}
					{if $job.wage}<tr><th style="background-color:navy; color:white;">Wage</th><td style="border:1px solid navy;">{$job.wage}</td></tr>{/if}
				</table>

				<div id="job-description">
				{$job.description|highlight_keywords:$smarty.session.keywords_array}
				</div><br />
				
			</div><!-- #job-details -->
