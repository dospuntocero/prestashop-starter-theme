{*
*
*
*}

{capture name=path}{l s='Sitemap'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}

<h1>{l s='Sitemap'}</h1>
<div id="sitemap_content" class="clearfix">
	<div class="sitemap_block">
		<h3>{l s='Our offers'}</h3>
		<ul>
			<li><a href="{$link->getPageLink('new-products')}" title="{l s='View a new products'}">{l s='New products'}</a></li>
			{if !$PS_CATALOG_MODE}
			<li><a href="{$link->getPageLink('best-sales')}" title="{l s='View a top sellers products'}">{l s='Top sellers'}</a></li>
			<li><a href="{$link->getPageLink('prices-drop')}" title="{l s='View a products with price drop'}">{l s='Price drop'}</a></li>
			{/if}
			{if $display_manufacturer_link OR $PS_DISPLAY_SUPPLIERS}<li><a href="{$link->getPageLink('manufacturer')}" title="{l s='View list of a manufacturers'}">{l s='Manufacturers'}</a></li>{/if}
			{if $display_supplier_link OR $PS_DISPLAY_SUPPLIERS}<li><a href="{$link->getPageLink('supplier')}" title="{l s='View list of a suppliers'}">{l s='Suppliers'}</a></li>{/if}
		</ul>
	</div>
	<div class="sitemap_block">
		<h3>{l s='Your Account'}</h3>
		<ul>
		{if $logged}
			<li><a href="{$link->getPageLink('my-account', true)}" title="{l s='Manage my customer account'}" rel="nofollow">{l s='Your Account'}</a></li>
			<li><a href="{$link->getPageLink('identity', true)}" title="{l s='Manage my personal information'}" rel="nofollow">{l s='Personal information'}</a></li>
			<li><a href="{$link->getPageLink('addresses', true)}" title="{l s='View list of my addresses'}" rel="nofollow">{l s='Addresses'}</a></li>
			{if $voucherAllowed}<li><a href="{$link->getPageLink('discount', true)}" title="{l s='View list of my discounts'}" rel="nofollow">{l s='Discounts'}</a></li>{/if}
			<li><a href="{$link->getPageLink('history', true)}" title="{l s='View list of my orders'}" rel="nofollow">{l s='Order history'}</a></li>
		{else}
			<li><a href="{$link->getPageLink('authentication', true)}" title="{l s='Authentication'}" rel="nofollow">{l s='Authentication'}</a></li>
			<li><a href="{$link->getPageLink('authentication', true)}" title="{l s='Create new account'}"rel="nofollow">{l s='Create new account'}</a></li>
		{/if}
		{if $logged}
			<li><a href="{$link->getPageLink('index')}?mylogout" title="{l s='Log out'}" rel="nofollow">{l s='Log out'}</a></li>
		{/if}
		</ul>
	</div>
	<div class="clear"></div>
</div>
<div id="listpage_content">
	<div class="categTree">
		<h3>{l s='Categories'}</h3>
		<div class="tree_top"><a href="{$base_dir_ssl}" title="{$categoriesTree.name|escape:'htmlall':'UTF-8'}">{$categoriesTree.name|escape:'htmlall':'UTF-8'}</a></div>
		<ul class="tree">
		{if isset($categoriesTree.children)}
			{foreach $categoriesTree.children as $child}
				{if $child@last}
					{include file="$tpl_dir./category-tree-branch.tpl" node=$child last='true'}
				{else}
					{include file="$tpl_dir./category-tree-branch.tpl" node=$child}
				{/if}
			{/foreach}
		{/if}
		</ul>
	</div>
	<div class="categTree">
		<h3>{l s='Pages'}</h3>
		<div class="tree_top"><a href="{$categoriescmsTree.link}" title="{$categoriescmsTree.name|escape:'htmlall':'UTF-8'}">{$categoriescmsTree.name|escape:'htmlall':'UTF-8'}</a></div>
		<ul class="tree">
			{if isset($categoriescmsTree.children)}
				{foreach $categoriescmsTree.children as $child}
					{if (isset($child.children) && $child.children|@count > 0) || $child.cms|@count > 0}
						{include file="$tpl_dir./category-cms-tree-branch.tpl" node=$child}
					{/if}
				{/foreach}
			{/if}
			{foreach from=$categoriescmsTree.cms item=cms name=cmsTree}
				<li><a href="{$cms.link|escape:'htmlall':'UTF-8'}" title="{$cms.meta_title|escape:'htmlall':'UTF-8'}">{$cms.meta_title|escape:'htmlall':'UTF-8'}</a></li>
			{/foreach}
			<li><a href="{$link->getPageLink('contact', true)}" title="{l s='Contact'}">{l s='Contact'}</a></li>
			{if $display_store}<li class="last"><a href="{$link->getPageLink('stores')}" title="{l s='List of our stores'}">{l s='Our stores'}</a></li>{/if}
		</ul>
	</div>
</div>
