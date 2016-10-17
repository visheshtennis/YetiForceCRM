{*<!-- {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} --!>*}
{strip}
	<div class="media noticeRow" data-id="{$ROW->getId()}" data-type="{$ROW->get('type')}">
		{assign var=ICON value=$ROW->getIcon()}
		<div class="media-body wordBreakAll">
			<div class="panel panel-default">
				<div class="panel-heading">
					{if $ICON}
						<div class="pull-left">
							{if $ICON['type'] == 'image'}
								<img width="22px" class="top2px {$ICON['class']}" title="{$ICON['title']}" alt="{$ICON['title']}" src="{$ICON['src']}"/>
							{else}
								<span class="noticeIcon {$ICON['class']}" title="{$ICON['title']}" alt="{$ICON['title']}" aria-hidden="true"></span>
							{/if}&nbsp;&nbsp;
						</div>
					{/if}
					<div class="pull-right">
						<small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($ROW->get('createdtime'))}">
							{Vtiger_Util_Helper::formatDateDiffInStrings($ROW->get('createdtime'))}
						</small>
					</div>
					<strong>{$ROW->getTitle()}</strong>
					{if $SHOW_TYPE}
						&nbsp;({vtranslate($ROW->getTypeName(), $MODULE_NAME)})
					{/if}
				</div>
				<div class="panel-body">
					{assign var=COTENT value=$ROW->getMessage()}
					{if $COTENT}
						{$COTENT}
						<hr/>
					{/if}
					<div class="text-right ">
						<button type="button" class="btn btn-success btn-xs" onclick="Vtiger_Index_Js.markNotifications({$ROW->getId()});" title="{vtranslate('LBL_MARK_AS_READ', $MODULE_NAME)}">
							<span class="glyphicon glyphicon-ok"></span>
						</button>&nbsp;&nbsp;
						{if \includes\Record::isExists($ROW->get('relatedid'))}
							<a class="btn btn-info btn-xs glyphicon glyphicon-th-list" title="{vtranslate('LBL_GO_TO_PREVIEW')}" href="index.php?module={$ROW->get('relatedmodule')}&view=Detail&record={$ROW->get('relatedid')}"></a>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>
{/strip}
