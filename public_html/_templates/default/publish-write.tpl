{include file="header.tpl"}
		
		<div id="content">
			<div id="job-listings"></div><!-- #job-listings -->
			<div class="steps">
				<div id="step-1" class="step-active">
					{$translations.publish.step1}
				</div>
				<div id="step-2">
					{$translations.publish.step2}
				</div>
				<div id="step-3">
					{$translations.publish.step3}
				</div>
				<div class="clear"></div>
			</div>
			<br />
			{if $filter_error}
			<div class="validation-failure">
				<img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" />
				{$filter_error}
			</div>
			{/if}
			{if $errors}
			<div class="validation-failure">
				<img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" />
				{$translations.publish.form_error}
			</div>
			{/if}
            
			{php}
            	global $message;
                
                if(!empty($message))
                { {/php}
                <div class="validation-failure">
                    <img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" />
                   {php} echo $message; {/php}
                </div>
            {php}    
            	}
                {/php}
                
			<form id="publish_form" method="post" action="{$BASE_URL}post/">
				<fieldset>
					<legend>{$translations.publish.job_details}</legend>

					<div style="text-align:right; margin-right:10px;">
						<a href="http://www.jawhm.or.jp/jobboard.html" target="_blank">登録方法の説明などはこちら</a>
					</div>

					<table border="0" cellspacing="2" cellpadding="2">
						<tr>
							<td>Work type</td>
							<td>
								{section name=tmp2 loop=$types}
								<input class="no-border" type="radio" name="type_id" id="type_id_{$types[tmp2].id}" value="{$types[tmp2].id}" {if !$job.type_id && !$smarty.post.type_id}{if $smarty.section.tmp2.first}checked="checked"{/if}{else}{if $types[tmp2].id == $job.type_id}checked="checked"{/if}{if $types[tmp2].id == $smarty.post.type_id}checked="checked"{/if}{/if} />
								<label for="type_id_{$types[tmp2].id}"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-{$types[tmp2].var_name}.png" alt="{$types[tmp2].name}" /></label>
								{/section}&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td>Category</td>
							<td>
								<select name="category_id" id="category_id" tabindex="1">
									{section name=tmp1 loop=$categories}
									<option value="{$categories[tmp1].id}" {if $default_categ_id != '' && $default_categ_id == $categories[tmp1].id}selected="selected"{else}{if $categories[tmp1].id == $job.category_id}selected="selected"{/if}{if $categories[tmp1].id == $smarty.post.category_id}selected="selected"{/if}{/if}>{$categories[tmp1].name}</option>
									{/section}
								</select>
							</td>
						</tr>
						<tr>
							<td class="publish-label" valign="top">{$translations.publish.title_label}:</td>
							<td>
								<input {if $errors.title}class="error"{/if} type="text" name="title" id="title" tabindex="2" size="50" value="{if $job.company}{$job.title|escape}{else}{$smarty.post.title|escape}{/if}" />
								{if $errors.title}<span class="validation-error"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" /></span>{/if}
								<div class="">{$translations.publish.title_info}</div>
							</td>
						</tr>
						<tr>
							<td valign="top">{$translations.publish.location_label}:</td>
							<td>
								<select name="city_id" id="city_id" tabindex="2" {if $job.location_outside_ro != '' OR $smarty.post.location_outside_ro_where != ''}disabled="disabled"{/if}>
									<option value="0">{$translations.jobs.location_anywhere}</option>
									{section name="c" loop=$cities}
									<option value="{$cities[c].id}" {if $smarty.post.city_id == $cities[c].id || $job.city_id == $cities[c].id}selected="selected"{else}{if $user_city.id == $cities[c].id AND !$smarty.post.city_id AND !$job.city_id}selected="selected"{/if}{/if}>{$cities[c].name}</option>
									{/section}
								</select>
								<a id="other_location_label" href="#" onclick="Jobber.HandleLocationOutsideRo(); return false;">{if $job.location_outside_ro != '' OR $smarty.post.location_outside_ro_where != ''}{$translations.publish.location_pick_from_list}{else}{$translations.publish.other}{/if}</a>
								<div id="location_outside_ro" {if $job.location_outside_ro != '' OR $smarty.post.location_outside_ro_where != ''}style="display: block;"{else}style="display: none;"{/if}>
									{$translations.publish.where} <input type="text" name="location_outside_ro_where" id="location_outside_ro_where" size="50" maxlength="140" {if $job.location_outside_ro != ''}value="{$job.location|escape}"{/if}{if $smarty.post.location_outside_ro_where != ''}value="{$smarty.post.location_outside_ro_where|escape}"{/if} />
									<div class="suggestion">{$translations.publish.where_info}</div>
								</div>
							</td>
						</tr>

						<tr>
							<td class="publish-label" valign="top">{$translations.publish.occupation_label}:</td>
							<td>
								<input {if $errors.occupation}class="error"{/if} type="text" name="occupation" id="occupation" tabindex="2" size="50" value="{if $job.company}{$job.occupation|escape}{else}{$smarty.post.occupation|escape}{/if}" />
								{if $errors.occupation}<span class="validation-error"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" /></span>{/if}
								<div class="">{$translations.publish.occupation_info}</div>
							</td>
						</tr>
						<tr>
							<td class="publish-label" valign="top">{$translations.publish.details_label}:</td>
							<td>
								<input {if $errors.details}class="error"{/if} type="text" name="details" id="details" tabindex="2" size="50" value="{if $job.company}{$job.details|escape}{else}{$smarty.post.details|escape}{/if}" />
								{if $errors.details}<span class="validation-error"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" /></span>{/if}
								<div class="">{$translations.publish.details_info}</div>
							</td>
						</tr>
						<tr>
							<td class="publish-label" valign="top">{$translations.publish.address_label}:</td>
							<td>
								<input {if $errors.address}class="error"{/if} type="text" name="address" id="address" tabindex="2" size="80" value="{if $job.company}{$job.address|escape}{else}{$smarty.post.address|escape}{/if}" />
								{if $errors.address}<span class="validation-error"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" /></span>{/if}
								<div class="">{$translations.publish.address_info}</div>
							</td>
						</tr>
						<tr>
							<td class="publish-label" valign="top">{$translations.publish.requ_label}:</td>
							<td>
								<input {if $errors.requ}class="error"{/if} type="text" name="requ" id="requ" tabindex="2" size="50" value="{if $job.company}{$job.requ|escape}{else}{$smarty.post.requ|escape}{/if}" />
								{if $errors.requ}<span class="validation-error"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" /></span>{/if}
								<div class="">{$translations.publish.requ_info}</div>
							</td>
						</tr>
						<tr>
							<td class="publish-label" valign="top">{$translations.publish.wage_label}:</td>
							<td>
								<input {if $errors.wage}class="error"{/if} type="text" name="wage" id="wage" tabindex="2" size="50" value="{if $job.company}{$job.wage|escape}{else}{$smarty.post.wage|escape}{/if}" />
								{if $errors.wage}<span class="validation-error"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" /></span>{/if}
								<div class="">{$translations.publish.wage_info}</div>
							</td>
						</tr>

						<tr>
							<td valign="top">{$translations.publish.description_label}:</td>
							<td><textarea {if $errors.description}class="error"{/if} tabindex="4" name="description" id="description" class="mceEditor" cols="80" rows="15">{if $job.company}{$job.description}{else}{$smarty.post.description}{/if}</textarea>
								{if $errors.description}<span class="validation-error"><img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" /></span>{/if}
								<div class="suggestion">
									<a target="_blank" href="http://www.textism.com/tools/textile/" onclick="$('#textile-suggestions').toggle(); return false;">{$translations.publish.description_info}</a></div>
								<div id="textile-suggestions" style="display: none;">
									<table>
											<thead>
											<tr class="odd">
												<th>{$translations.publish.syntax}</th>
												<th>{$translations.publish.result}</th>
											</tr>
											</thead>
											<tbody>
											<tr class="even">
												<td>That is _incredible_</td>
												<td>That is <em>incredible</em></td>

											</tr>
											<tr class="odd">
												<td>*Indeed* it is</td>
												<td><strong>Indeed</strong> it is</td>
											</tr>
											<tr class="even">
												<td>"Wikipedia":http://www.wikipedia.org</td>

												<td><a href="http://www.wikipedia.org">Wikipedia</a></td>
											</tr>
											<tr class="odd">
												<td>* apples<br />* oranges<br />* pears</td>
												<td>

													<ul>
														<li>apples</li>
														<li>oranges</li>
														<li>pears</li>
													</ul>
												</td>
											</tr>

											<tr class="even">
												<td># first<br /># second<br /># third</td>
												<td>
													<ol>
														<li>first</li>
														<li>second</li>
														<li>third</li>
													</ol>
												</td>
											</tr>
											</tbody>
										</table>
								</div><!-- #textile-suggestions -->
							</td>
						</tr>
					</table>
				</fieldset>
				<fieldset>
					<legend>{$translations.publish.company}</legend>
					<table border="0" cellspacing="2" cellpadding="2">
						<tr>
							<td class="publish-label">{$translations.publish.name_label}:</td>
							<td><input {if $errors.company}class="error"{/if} tabindex="6" type="text" name="company" id="company" size="40" value="{if $job.company}{$job.company|escape}{else}{$smarty.post.company|escape}{/if}" />
							<span class="validation-error">{if $errors.company}<img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" />{/if}</span>
							</td>
						</tr> 
						<tr>
							<td valign="top">{$translations.publish.website_label}:</td>
							<td>http://<input tabindex="7" type="text" name="url" id="url" size="35" value="{if $job.company}{$job.url}{else}{$smarty.post.url}{/if}" />
								<div class="suggestion">{$translations.publish.website_info}</div>
							</td>
						</tr>
						<tr>
							<td class="publish-label">{$translations.publish.email_label}<br /><strong>({$translations.publish.email_info1})</strong>:</td>
							<td>
								<input {if $errors.poster_email}class="error"{/if} tabindex="8" type="text" name="poster_email" id="poster_email" size="40" value="{if $job.poster_email}{$job.poster_email}{else}{$smarty.post.poster_email}{/if}" />
								<span class="validation-error">{if $errors.poster_email}<img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" />{/if}</span>
								<div class="suggestion">
									{$translations.publish.email_info2}
								</div>
							</td>
						</tr>
					</table>
				</fieldset>

				<fieldset>
					<legend>利用規約　/　Terms and conditions</legend>

				{literal}
					<ul>
						<li>Please read the terms and conditions of this service before you post.</li>
						<li>The terms and conditions is written in Japanese. Even Japanese is not user's primary language, it is the user’s responsibilities to read and understand the terms and conditions of the user agreement.</li>
						<li>In the event of any inconsistency, conflict, ambiguity or discrepancy between the Japanese version and any other version in other languages of these terms and conditions, the Japanese version shall prevail at all times.</li>
						<li><b>By using our Service, you shall be deemed to have agreed to the Terms and Conditions.</b></li>
						&nbsp;<br/>
					<p style="maring-top:8px;">
						以下の利用規約を必ず確認してください。<br/>
						<b>この掲示板に投稿された場合、本規約に同意したものとみなします。</b><br/>
					</p>
					【JobBoard（求人掲示板）利用規約】<br/>
					<table style="font-size:9pt; margin-left:10px; margin-top:0px;">
						<tr>
							<td style="vertical-align:top;">１．</td>
							<td>
								投稿者は、掲載内容についての一切の責任をお持ちください。<br/>
								掲載内容の変更・修正が必要な場合は必ず掲載者が行い、その情報掲載が不要となった場合は、すみやかに削除をお願いします。<br/>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;">２．</td>
							<td>
								代理人による投稿及び、コンピュータプログラムなどによる自動投稿は禁止します。<br/>
								また、同一内容を投稿する場合は、以前の掲載を一度削除された上で、再度の投稿をお願いします。<br/>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;">３．</td>
							<td>
								このサービスは、ワーキングホリデーの活性化の為に提供するものであるため、以下の様な掲載は禁止します。<br/>
								　・　公序良俗に反する内容<br/>
								　・　アダルト関係、ネットワークビジネス関係の内容<br/>
								　・　求職者に一方的に不利益な内容<br/>
								　・　その他、当協会が不当と判断する内容<br/>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;">４．</td>
							<td>
								掲載内容については当協会の管理下WEBサイトの他、<a target="_blank" href="http://japanworkingholiday.org/jobboard/widgets/">Site Widgets機能</a>により
								当協会の管理外のWEBサイトにも掲載される可能性があります。<br/>
								また、掲載内容の表示位置、順位、方法などについては投稿者が指定することは出来ません。
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;">５．</td>
							<td>
								当協会は求人情報に関する掲示板を運営するのみであり、実際の面談、採用に関する手続き等の斡旋、代行等は行いません。<br/>
								求職者との連絡、雇用に関する手続き等は、投稿者又は投稿者に準ずる者の責任において実施してください。
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;">６．</td>
							<td>
								当協会は、当協会の判断により掲載停止及び削除する権利を有します。<br/>
								また、この掲示板の全部又は一部の機能を適宜変更・廃止できるものとします。<br/>
								これらの事象により投稿者など、全ての利用者に生じた損害は、理由のいかんを問わず、一切の責任を負わないものとします。<br/>
							</td>
						</tr>
						<tr>
							<td style="vertical-align:top;">７．</td>
							<td>
								この利用規約は、当協会の判断により事前の予告なく追加・変更・削除できるものとします。<br/>
								また、この利用規約は日本語で作成され、日本語のみによって解釈されるものとします。<br/>
							</td>
						</tr>
					</table>
					<p style="margin-top:12px;">
						【重要】<br/>
						2012年2月27日より投稿された<b>全ての掲載情報は、当協会にて内容を確認の後、Jobboard上で閲覧可能となります。</b><br/>
						確認作業にお時間を頂戴する場合がありますのでご了承ください。<br/>
					</p>
				{/literal}
				</fieldset>

				{if $ENABLE_RECAPTCHA}
				<fieldset>
					<legend>{$translations.captcha.captcha_title}</legend>
					{literal}
					<script type="text/javascript">
					  var RecaptchaOptions = {
					    theme : 'white',
					    tabindex : 9
					  };
					</script>
					{/literal}
					{$the_captcha} <span class="validation-error">{if $errors.captcha}
					<img src="{$BASE_URL}_templates/{$THEME}/img/icon-delete.png" alt="" /> {$errors.captcha}{/if}</span>
				</fieldset>
				{/if}
				<fieldset><input type="checkbox" name="apply_online" id="apply_online" class="no-border" {if $job.apply_online == 1 || $is_apply == 1}checked="checked"{/if}{if !isset($job.apply_online) && !isset($is_apply)}checked="checked"{/if} /><label for="apply_online">{$translations.publish.apply_online}</label></fieldset>
				<fieldset><input type="submit" name="submit" id="submit" value="{$translations.publish.step1_submit}" /></fieldset>
				<fieldset class="hidden">					
					<input type="hidden" name="action" {if $job.id || $smarty.session.later_edit}value="edit"{else}value="publish"{/if} />
					{if $smarty.session.later_edit}<input type="hidden" name="auth" value="{$smarty.session.later_edit}" />{/if}
					{if $job.id}<input type="hidden" name="job_id" value="{$job.id}" />{/if}
				</fieldset>
			</form>
		</div><!-- /content -->
		
		{literal}
		<script type="text/javascript">
			$(document).ready(function()
			{
				$('#title').focus();
				
				$('#submit').click(function()
				{
				   tinyMCE.triggerSave();
				});
				
				$("#publish_form").validate({
					rules: {
                        type_id: { required: true },
						company: { required: true },
						title: { required: true },
						description: { required: true },
						poster_email: { required: true, email: true }
					},
					messages: {
                        type_id: ' <img src="{/literal}{$BASE_URL}_templates/{$THEME}/{literal}img/icon-delete.png" alt="" />',					   
						company: ' <img src="{/literal}{$BASE_URL}_templates/{$THEME}/{literal}img/icon-delete.png" alt="" />',
						title: ' <img src="{/literal}{$BASE_URL}_templates/{$THEME}/{literal}img/icon-delete.png" alt="" />',
						location: ' <img src="{/literal}{$BASE_URL}_templates/{$THEME}/{literal}img/icon-delete.png" alt="" />',
						description: ' <img src="{/literal}{$BASE_URL}_templates/{$THEME}/{literal}img/icon-delete.png" alt="" />',
						poster_email: ' <img src="{/literal}{$BASE_URL}_templates/{$THEME}/{literal}img/icon-delete.png" alt="" />'
					}
				});
			});
		</script>
		{/literal}

{include file="footer.tpl"}