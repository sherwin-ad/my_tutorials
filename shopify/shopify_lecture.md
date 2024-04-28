# Shopify  

## Install theme kit

```
brew tap shopify/shopify
brew instal themekit
```

## Create a new theme

1. Go to the store

2. Goto App > App and sales channel settings > click Develop app

3. Goto App development > Configuration
   - View or manage theme templates and assets > ckeck read and write theme 

4. Goto App development > API credentials
   - Access tokens > Install app 

```
theme new --password=[your-password] --store="[your-store.myshopify.com]" --name=[theme name]
```

##### 

## Object > all_products

Index.liquid

```
{{ all_products['fitra'].title }}

{{ all_products['fitra'].price|money }}
```



## Tags > Variable tags

Index.liquid

```
{% assign mainProduct = all_products['fitra'] %}

{{ mainProduct.title }}

{{ mainProduct.price | money }}

{{ mainProduct.url }}
```

