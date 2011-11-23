Permutations
============

Generate permutations for nested arrays or strings that offer one or more choices.

Installation
------------

You can use it as a Rails plugin or as a normal ruby.

    script/plugin install git://github.com/Narnach/permutations.git

or

    sudo gem install permutations

Example
-------

You can permutate array elements:

    require 'permutations'
    [[1,2],[3,4]].permutations # =>[[1,3],[1,4],[2,3],[2,4]]

You can also permutate choice sets extraced from strings. These choices are specified between curly braces:

    "{1,2}{3,4}".permutations # => ["13", "14", "23", "24"]

It is possible to use a custom separator, and whitespace surrounding options is automatically removed to allow for more reader-friendly formatting of the choicees:

    "{ 1 | 2 }{ 3 | 4 }".permutations("|") # => ["13", "14", "23", "24"]

By default (custom) separators are regexp-escaped, but this can be turned off to use a regexp to determine the separation; for example when there are multiple separators:

    "{1|2}{3,4}".permutations("[|,]", false) # => ["13", "14", "23", "24"]

Contributing
------------

Bugs and feature requests can be added in Lighthouse. Pull requests on Github are welcome, too.
When you submit code, it is very much appreciated when you have specs and perhaps a bit of documentation for new features.

https://narnach.lighthouseapp.com/projects/45010-permutations

Credits
-------

Created by Wes Oldenbeuving. Licensed under the MIT License.