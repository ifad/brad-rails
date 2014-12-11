# Brad

![image](http://upload.wikimedia.org/wikipedia/en/d/df/Roy_Lichtenstein_Drowning_Girl.jpg)

But she'd better have called Brad.

Brad is a very simple Gem for Rails that uses [Bootstrap3](http://getbootstrap.com/) Popovers to add contextual help to any document element.

It can also generate an help button if needed.

The default help button code uses [fontawesome](http://fortawesome.github.io/Font-Awesome/), but you can change it as you like.

The contents of the popover are taken from the language files (I18n).

### Usage:
#### with the help icon:

```ruby
help_me_brad(key)
```

where *key* is the key to the translation, as in `t(key)`

##### Example

```ruby
help_me_brad('brad.help_key_foo')
```

#### without the help icon:

```ruby
help_me_brad(key, help_button:false)
```

this line renders the hidden popover contents div

then, in the triggering element

```ruby
data: brad_data_options(key, derp: 'herp')
```

the `brad_data_options(key, opts = {})` helper method generates all the data options needed to transform any element into a trigger for Brad popovers

##### Example

```ruby
text_field_tag 'this_field_requires_some_explanations', data: brad_data_options('foo.help_key_bar')
```

### Language file structure



```yaml
foo:
  help_key_bar:
    title_html: The title key must be title_html
    text_html: The text key must be text_html and, as the title, it can contain <em>html!</em>
```


### Options

You can use all the [Bootstrap popover options](http://getbootstrap.com/javascript/#popovers-usage), plus the `button_html` option, to customize the html button code

the default button HTML is

```html
<i class="fa fa-question-circle fa-lg text-info"></i>
```

and the default popover template is

```html
<div class="brad popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>
```

##### Example

```ruby
help_me_brad('foo.help_key_bar', trigger: "click", placement: "bottom", animation: "false")
```
